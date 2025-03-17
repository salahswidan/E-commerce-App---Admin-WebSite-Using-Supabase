import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market/core/api_services.dart';
import 'package:our_market/core/models/product_model/favorite_product.dart';
import 'package:our_market/core/models/product_model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ApiServices _apiServices = ApiServices();
  final String userId = Supabase.instance.client.auth.currentUser!.id;

  List<ProductModel> products = [];
  List<ProductModel> searchResults = [];
  List<ProductModel> categoryProducts = [];
  Future<void> getProducts({String? query, String? category}) async {
    products = [];
    searchResults = [];
    categoryProducts = [];
    favoriteProductsList = [];
    emit(GetDataLoading());
    try {
      Response response = await _apiServices.getData(
          'product_table?select=*,favorite_products(*),purchase_table(*)');
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      getFavoriteProducts();
      search(query);
      getPrtoductsByCategory(category);
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }

  void search(String? query) {
    if (query != null) {
      for (var product in products) {
        if (product.productName!.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(product);
        }
      }
    }
  }

  void getPrtoductsByCategory(String? category) {
    if (category != null) {
      for (var product in products) {
        if (product.category!.trim().toLowerCase() ==
            (category.trim().toLowerCase())) {
          categoryProducts.add(product);
        }
      }
    }
  }

  Map<String, bool> favoriteProducts = {};

  Future<void> addToFavorite(String productId) async {
    emit(AddToFavoriteLoading());
    try {
      await _apiServices.postData("favorite_products", {
        "is_favorite": true,
        "for_user": userId,
        "for_product": productId,
      });
      await getProducts();
      favoriteProducts.addAll({productId: true});
      emit(AddToFavoriteSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddToFavoriteError());
    }
  }

  bool checkIsFavorite(String productId) {
    return favoriteProducts.containsKey(productId);
  }

  Future<void> removeFavorite(String productId) async {
    emit(RemoveFromFavoriteLoading());
    try {
      await _apiServices.deleteData(
          "favorite_products?for_user=eq.$userId&for_product=eq.$productId");
      await getProducts();
      favoriteProducts.removeWhere((key, value) => key == productId);
      emit(RemoveFromFavoriteSuccess());
    } catch (e) {
      log(e.toString());
      emit(RemoveFromFavoriteError());
    }
  }

  List<ProductModel> favoriteProductsList = [];
  void getFavoriteProducts() {
    for (ProductModel product in products) {
      if (product.favoriteProducts != null &&
          product.favoriteProducts!.isNotEmpty) {
        for (FavoriteProduct favoriteProduct in product.favoriteProducts!) {
          if (favoriteProduct.forUser == userId) {
            favoriteProductsList.add(product);
            favoriteProducts.addAll({product.productId!: true});
          }
        }
      }
    }
  }
}

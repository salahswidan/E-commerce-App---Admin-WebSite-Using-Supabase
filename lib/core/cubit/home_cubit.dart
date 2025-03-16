import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market/core/api_services.dart';
import 'package:our_market/core/models/product_model/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ApiServices _apiServices = ApiServices();

  List<ProductModel> products = [];
  List<ProductModel> searchResults = [];
  List<ProductModel> categoryProducts = [];
  Future<void> getProducts({String? query, String? category}) async {
    emit(GetDataLoading());
    try {
      Response response = await _apiServices.getData(
          'product_table?select=*,favorite_products(*),purchase_table(*)');
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
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
  void getPrtoductsByCategory(String? category)  {
    if (category != null) {
      for (var product in products) {
        if (product.category!.trim().toLowerCase() == (category.trim().toLowerCase())) {
          categoryProducts.add(product);
        }
      }
    }
  }
}

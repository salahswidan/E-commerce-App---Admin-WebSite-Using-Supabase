import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/components/custom_cicle_progress_indicator.dart';
import 'package:our_market/core/components/product_cart.dart';
import 'package:our_market/core/cubit/home_cubit.dart';
import '../models/product_model/product_model.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    this.shrinkWrap,
    this.physics,
    this.query,
    this.category,  this.isFavoriteView =false,
  });
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final String? query;
  final String? category;
  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..getProducts(query: query, category: category),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          HomeCubit homeCubit = context.read<HomeCubit>();
          List<ProductModel> products = query != null
              ? context.read<HomeCubit>().searchResults
              :
              // query == null
              category != null
                  ? context.read<HomeCubit>().categoryProducts
                  : isFavoriteView ? homeCubit.favoriteProductsList :
                  // category == null & query == null => home view
                  context.read<HomeCubit>().products;
          return state is GetDataLoading
              ? CustomCircleIndicator()
              : ListView.builder(
                  shrinkWrap: shrinkWrap ?? true,
                  physics: physics ?? const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      onPaymentSuccess: (){
                        
                      },
                      isFavorite:
                          homeCubit.checkIsFavorite(products[index].productId!),
                      onTap: () {
                        bool isFavorite = homeCubit
                            .checkIsFavorite(products[index].productId!);
                        isFavorite
                            ? homeCubit
                                .removeFavorite(products[index].productId!)
                            : homeCubit
                                .addToFavorite(products[index].productId!);
                      },
                      product: products[index],
                    );
                  });
        },
      ),
    );
  }
}

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
    this.physics, this.query, this.category,
  });
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final String? query;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(query: query,category: category),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<ProductModel> products =query != null ? 
          context.read<HomeCubit>().searchResults:
          // query == null
          category != null ?
          context.read<HomeCubit>().categoryProducts:
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
                      product: products[index],
                    );
                  });
        },
      ),
    );
  }
}

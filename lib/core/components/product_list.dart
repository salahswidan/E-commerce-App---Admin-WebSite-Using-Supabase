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
  });
  final bool? shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<ProductModel> products = context.read<HomeCubit>().products;
          return state is GetDataLoading ? CustomCircleIndicator(): ListView.builder(
              shrinkWrap: shrinkWrap ?? true,
              physics: physics ?? const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return  ProductCard(
                  product: products[index],
                );
              });
        },
      ),
    );
  }
}

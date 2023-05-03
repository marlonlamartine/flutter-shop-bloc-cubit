// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_api_shop/app/bloc/product/product_cubit.dart';
import 'package:fake_api_shop/app/bloc/product/product_state.dart';
import 'package:fake_api_shop/app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  const ProductDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final productCubit = context.read<ProductCubit>();
      productCubit.getProductById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kSecondaryColor,
            )),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state.status == ProductStateStatus.initial ||
                  state.status == ProductStateStatus.loading) {
                return const Center(
                  child: SpinKitSpinningLines(
                    color: Colors.blue,
                    size: 30.0,
                  ),
                );
              } else if (state.status == ProductStateStatus.error) {
                return Center(
                  child: Text(state.errorMessage ?? 'erro'),
                );
              } else if (state.status == ProductStateStatus.loaded) {
                final product = state.product;
                return Text(product?.title ?? '');
              } else {
                return Center(
                  child: Text(state.toString()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

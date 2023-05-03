import 'package:fake_api_shop/app/bloc/home/home_cubit.dart';
import 'package:fake_api_shop/app/pages/splash/splash_page.dart';
import 'package:fake_api_shop/app/repositories/products/products_repository.dart';
//import 'package:fake_api_shop/app/repositories/products/products_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product/product_cubit.dart';
import 'pages/home/home_page.dart';

class FakeApiShop extends StatefulWidget {
  const FakeApiShop({super.key});

  @override
  State<FakeApiShop> createState() => _FakeApiShopState();
}

class _FakeApiShopState extends State<FakeApiShop> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(ProductsRepository()),
        ),
        BlocProvider(
          create: (context) => ProductCubit(ProductsRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'FakeShop',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}

import 'package:fake_api_shop/app/bloc/home/home_cubit.dart';
import 'package:fake_api_shop/app/bloc/home/home_state.dart';
import 'package:fake_api_shop/app/core/config/constants.dart';
import 'package:fake_api_shop/app/core/ui/styles/colors_app.dart';
import 'package:fake_api_shop/app/core/ui/styles/text_styles.dart';
import 'package:fake_api_shop/app/core/ui/widgets/category_tile.dart';
import 'package:fake_api_shop/app/core/ui/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<HomeCubit>();
      cubit.loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      "Todas",
      "Eletrônicos",
      "Joalheria",
      "Roupa Masculina",
      "Roupa Feminina"
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .09),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: context.colors.fillColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Procurar Produto',
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0XFFf2efef),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: kPrimaryColor,
                            )),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0XFFf2efef),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              color: kPrimaryColor,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oi Marlon',
                          style: context.textStyles.primaryTextTitle,
                        ),
                        Text(
                          'O que deseja comprar hoje?',
                          style: context.textStyles.primaryTextComment,
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border_outlined))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Categorias',
                style: context.textStyles.primaryTextTitle,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.account_tree),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CategoryTile(
                              index: 0, label: categories[0], isSelected: true),
                          CategoryTile(
                              index: 1,
                              label: categories[1],
                              isSelected: false),
                          CategoryTile(
                              index: 2,
                              label: categories[2],
                              isSelected: false),
                          CategoryTile(
                              index: 3,
                              label: categories[3],
                              isSelected: false),
                          CategoryTile(
                              index: 4,
                              label: categories[4],
                              isSelected: false),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.status == HomeStateStatus.initial ||
                      state.status == HomeStateStatus.loading) {
                    return const Center(
                      child: SpinKitSpinningLines(
                        color: Colors.blue,
                        size: 30.0,
                      ),
                    );
                  } else if (state.status == HomeStateStatus.error) {
                    return Center(
                      child: Text(state.errorMessage ?? 'erro'),
                    );
                  } else if (state.status == HomeStateStatus.loaded) {
                    final products = state.products;
                    return SizedBox(
                      height: 220,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(12),
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ProductTile(
                              id: products[index].id,
                              title: products[index].title,
                              image: products[index].image,
                              price: products[index].price.toString(),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: Text(state.toString()),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Populares',
                style: context.textStyles.primaryTextTitle,
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.status == HomeStateStatus.initial ||
                      state.status == HomeStateStatus.loading) {
                    return const Center(
                      child: SpinKitSpinningLines(
                        color: Colors.blue,
                        size: 30.0,
                      ),
                    );
                  } else if (state.status == HomeStateStatus.error) {
                    return Center(
                      child: Text(state.errorMessage ?? 'erro'),
                    );
                  } else if (state.status == HomeStateStatus.loaded) {
                    final promotions = state.products;
                    promotions.shuffle();
                    return SizedBox(
                      height: 220,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(12),
                          scrollDirection: Axis.horizontal,
                          itemCount: promotions.length,
                          itemBuilder: (context, index) {
                            return ProductTile(
                              id: promotions[index].id,
                              title: promotions[index].title,
                              image: promotions[index].image,
                              price: promotions[index].price.toString(),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: Text(state.toString()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

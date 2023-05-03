// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_api_shop/app/pages/product/product_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:fake_api_shop/app/core/ui/styles/text_styles.dart';

class ProductTile extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final String price;

  const ProductTile({
    Key? key,
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 7,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                id: id,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 110,
                  width: 130,
                  child: Image.network(image, fit: BoxFit.contain),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 140,
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.primaryTextComment
                              .copyWith(fontSize: 14),
                        )),
                    Text(
                      '$price R\$',
                      style: context.textStyles.primaryTextPrice
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

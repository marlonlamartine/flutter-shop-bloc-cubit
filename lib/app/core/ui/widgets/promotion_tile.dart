// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_api_shop/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class PromotionTile extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String description;

  const PromotionTile({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  height: 110,
                  width: 110,
                  child: Image.network(image, fit: BoxFit.cover),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(title,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.primaryTextBody
                              .copyWith(fontSize: 14)),
                      Text(price,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.primaryTextComment
                              .copyWith(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

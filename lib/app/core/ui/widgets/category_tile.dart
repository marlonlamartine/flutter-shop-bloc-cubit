// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_api_shop/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final int index;
  final String label;
  final bool isSelected;
  const CategoryTile({
    Key? key,
    required this.index,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey.shade200 : Colors.white54,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                label,
                style: context.textStyles.primaryTextComment,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

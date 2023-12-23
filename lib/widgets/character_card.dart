import 'package:flutter/material.dart';
import 'package:marvel_app/config/color_pallete.dart';

class CharacterCard extends StatelessWidget {
  final String? name;
  final String? imageUrl;

  const CharacterCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPallete.appBarColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl!),
        ),
        title: Text(
          name!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorPallete.textColor,
          ),
        ),
      ),
    );
  }
}

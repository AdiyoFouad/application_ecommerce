import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class BuildImages extends StatelessWidget {
  const BuildImages({Key? key,required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(image),
      width: 250,
      height: 200
      ,);
  }
}
import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final double containerSize;
  final double progressSize;

  const MyProgressIndicator({Key? key, required this.containerSize, required this.progressSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      child: SizedBox(
        width: progressSize,
        height: progressSize,
        child: Image.asset('assets/images/loading_img.gif'),
        ),
    );
  }
}

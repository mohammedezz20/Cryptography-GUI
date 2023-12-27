// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  TextWidget({super.key, required this.text});
// ignore: prefer_typing_uninitialized_variables
  var text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}

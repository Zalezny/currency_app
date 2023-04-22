import 'package:flutter/material.dart';

class MainBottomSheetDialog extends StatelessWidget {
  final Function(BuildContext) onPicture;
  const MainBottomSheetDialog({Key? key, required this.onPicture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff1B1B1B),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Center()
    );
  }
}

import 'package:currency_app/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  final String text;
  const TopRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 8.0,
                right: 16.0,
              ),
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => RadialGradient(
                    center: Alignment.topCenter,
                    stops: const [
                      .5,
                      1
                    ],
                    colors: [
                      Theme.of(context).primaryColor,
                      AppColors.o_800
                    ]).createShader(bounds),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Expanded(
              child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.start,
          )),
        ],
      ),
    );
  }
}

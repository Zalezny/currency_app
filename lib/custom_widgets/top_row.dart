import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                    stops: [
                      .5,
                      1
                    ],
                    colors: [
                      Theme.of(context).primaryColor,
                      Color(0xFFFF7D2C)
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

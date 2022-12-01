import 'package:flutter/material.dart';

class OnboadingWidget extends StatelessWidget {
  const OnboadingWidget(
      {Key? key,
      this.imagePath1,
      this.imagePath2,
      this.titleText1,
      this.titleText2,
      this.subtitleText,
      this.secondLeft})
      : super(key: key);
  final String? imagePath1;
  final String? imagePath2;
  final String? titleText1;
  final String? titleText2;
  final String? subtitleText;
  final double? secondLeft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: -20,
                  bottom: 25,
                  left: -10,
                  child: Image.asset(
                    imagePath1 ?? "",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: secondLeft,
                  child: Image.asset(
                    imagePath2 ?? "",
                    scale: 4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            titleText1 ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
          ),
          Text(
            titleText2 ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              subtitleText ?? "",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFF939497)),
            ),
          ),
        ],
      ),
    );
  }
}

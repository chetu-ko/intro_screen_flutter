import 'package:flutter/material.dart';
import 'package:intro_screen_flutter/main.dart';

Widget pageViewWidget(
    {BuildContext? context,
    String? title,
    String? isextratitle,
    String? gradientText,
    String? image,
    int? index,
    String? longText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 33, top: 57),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w800,
                wordSpacing: -0.2,
              ),
            ),
            isextratitle == ""
                ? const Text("")
                : Text(
                    isextratitle!,
                    style: const TextStyle(
                      fontSize: 50,
                      wordSpacing: -0.3,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
            GradientText(
              text: gradientText,
              style: const TextStyle(
                fontSize: 50,
                height: 1.0,
                fontWeight: FontWeight.w900,
              ),
              gradient:  const LinearGradient(
                colors: [
                  Color.fromRGBO(134, 185, 64, 1.0),
                  AppColor.primary1,
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 21,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 33),
        child: Text(
          longText!,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
      ),
      const SizedBox(
        height: 42,
      ),
      image == ""
          ? const SizedBox(height: 312.76, width: 350, child: Text("image"))
          : Padding(
              padding: const EdgeInsets.only(
                  top: 34, left: 12, right: 13, bottom: 20),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 280.76,
                  width: 300,
                  child: Image.asset(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
      index != 2
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(colors: AppColor.gradient),
                  ),
                  width: 288,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () async {
                      
                    },
                    child: const Text(
                      "Go to Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    ],
  );
  //);
}

class GradientText extends StatelessWidget {
  String? text;
  TextStyle? style;
  Gradient? gradient;

  GradientText({
    Key? key,
    this.text,
    this.style,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient!.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text!, style: style),
    );
  }
}

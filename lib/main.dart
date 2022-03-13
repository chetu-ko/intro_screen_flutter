import 'package:flutter/material.dart';
import 'package:intro_screen_flutter/page_view.dart';

Future<void> main() async {
  return runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          useInheritedMediaQuery: true,
         
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "sf pro",
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(
            title: 'Intro Screen',
          )
    );
  }
}

class AppColor {
  static final List<Color> gradient = [
    primary2,
    primary1,
  ];
  static const kColorPrimary = Color(0xffEDEEF9);
  static const kColorPrimary2 = Color(0xFfA174DB);
  static const kColorPrimary3 = Color(0xFFE7D5FE);
  static const bgColor = Color.fromRGBO(231, 247, 234, 1);

  static const primary2 = Color.fromARGB(255, 22, 117, 161);
  static const primary1 = Color.fromARGB(255, 29, 211, 138);
  static const Color secondary = Color(0xff14171A);
  static const Color lightGrey = Color(0xffAAB8C2);
  static const Color extraLightGrey = Color(0xffE1E8ED);
  static const Color white = Color(0xFFffffff);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int currentIndex = 0;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          PageView(
            onPageChanged: onChangedFunction,
            controller: _pageController,
            children: [
              pageViewWidget(
                  context: context,
                  gradientText: "Qrcode ",
                  image: "assets/image/ScanQR.png",
                  index: currentIndex,
                  isextratitle: "",
                  longText: "Scan Qr code To send Money",
                  title: "Scan"),
              pageViewWidget(
                  context: context,
                  gradientText: "Amount",
                  image: "assets/image/ScanQR_1.png",
                  index: currentIndex,
                  isextratitle: "",
                  longText: "Enter Amount to send amount securely",
                  title: "Enter"),
              pageViewWidget(
                  context: context,
                  gradientText: "transferred",
                  image: "assets/image/ScanQR_2.png",
                  index: currentIndex,
                  isextratitle: "",
                  longText: "Amount transferred successfully",
                  title: "successfully"),
            ],
          ),
          currentIndex != 2
              ? Positioned(
                  bottom: 80,
                  left: 168,
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () => nextFunction(),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary1),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
          Positioned(
            bottom: 36,
            left: 165,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Indicator(
                  positionIndex: 0,
                  currentIndex: currentIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 1,
                  currentIndex: currentIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 2,
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int? positionIndex, currentIndex;
  const Indicator({Key? key, this.currentIndex, this.positionIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 7,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: positionIndex == currentIndex ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}

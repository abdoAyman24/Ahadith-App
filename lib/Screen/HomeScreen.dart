import 'package:azkar/Screen/HadithScreen.dart';
import 'package:azkar/Screen/audioHadith.dart';
import 'package:azkar/Screen/hadithFavorite.dart';
import 'package:azkar/utils/colorApp.dart';
import 'package:azkar/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/svg/homebackground.svg',
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(child: SvgPicture.asset('assets/svg/logo.svg')),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextApp.primarySmalle,
                    TextApp.headerScreen,
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => HadithScreen()),
                        ),
                      );
                    },
                    child: myCard(
                        ColorApp.primary,
                        ColorApp.primaryDark,
                        TextApp.cardOne,
                        "assets/svg/one.svg",
                        "assets/quran.png"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => AudioHadith()),
                        ),
                      );
                    },
                    child: myCard(
                        ColorApp.red2,
                        ColorApp.yellow,
                        TextApp.cardTwo,
                        "assets/svg/twoo.svg",
                        "assets/play.png"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (conyext) => hadithFav(),
                        ),
                      );
                    },
                    child: myCard(ColorApp.red1, ColorApp.red2, TextApp.cardOne,
                        "assets/svg/three.svg", "assets/save-instagram.png"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget myCard(
    Color color1, Color color2, Text text, String path1, String path2) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 48,
      left: 20,
      right: 20,
    ),
    child: Container(
      height: 120,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(10, 10),
            color: ColorApp.Dark,
            blurRadius: 43,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: AlignmentDirectional.topEnd,
          end: AlignmentDirectional.bottomStart,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(path2),
          text,
          SvgPicture.asset(path1),
        ],
      ),
    ),
  );
}

import 'package:azkar/Screen/localAudio.dart';
import 'package:azkar/db/myDb.dart';
import 'package:azkar/model/hadith.dart';
import 'package:azkar/utils/colorApp.dart';
import 'package:azkar/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioHadith extends StatefulWidget {
  @override
  State<AudioHadith> createState() => _AudioHadithState();
}

class _AudioHadithState extends State<AudioHadith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/svg/homebackground.svg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(''),
                        SvgPicture.asset('assets/svg/logo.svg'),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset('assets/svg/arrow-right.svg'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextApp.screen2,
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/svg/homebackground.svg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                FutureBuilder(
                  future: myDatabase.getAllHadith(),
                  builder: (ctx, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (ctx, index) {
                          Hadith item = snapshot.data[index];
                          return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => LocalHadith(
                                      hadith: item,
                                      indexHadith: index,
                                    ),
                                  ),
                                );
                              },
                              child: ayah(item.key, item.nameHadith));
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget ayah(String key, String name) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(
        'assets/img.png',
        width: double.infinity,
      ),
      SvgPicture.asset(
        'assets/svg/grey.svg',
        width: double.infinity,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              key,
              style: GoogleFonts.tajawal(fontSize: 12, color: ColorApp.yellow),
            ),
            Text(
              textAlign: TextAlign.center,
              maxLines: 2,
              textWidthBasis: TextWidthBasis.parent,
              overflow: TextOverflow.ellipsis,
              name,
              style: GoogleFonts.tajawal(
                  wordSpacing: 2,
                  letterSpacing: 2,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.yellow),
            ),
          ],
        ),
      ),
    ],
  );
}

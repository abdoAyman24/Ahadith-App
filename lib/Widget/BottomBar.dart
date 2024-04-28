import 'package:azkar/Screen/localAudio.dart';
import 'package:azkar/model/hadith.dart';
import 'package:azkar/networking/networkPage.dart';
import 'package:azkar/utils/colorApp.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BottomBar extends StatefulWidget {
  Hadith hadith;
  int indexhadith;
  BottomBar({required this.hadith, required this.indexhadith});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool bol = true;
  bool clickCenterFAB = false;
  String text = "";
  int selectedIndex = 0;
  @override
  void initState() {
    text = widget.hadith.textHadith;
    super.initState();
  }

  void updateTapSelection(int index, String bottomText) {
    setState(() {
      selectedIndex = index;
      text = bottomText + '\n';
    });
  }

  Widget getWidget(bool bol) {
    if (bol) {
      return NetworkPage(data: text, hadith: widget.hadith);
    }
    return LocalHadith(
      hadith: widget.hadith,
      indexHadith: widget.indexhadith,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          getWidget(bol),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        hoverColor: Colors.blue[100],
        onPressed: () {
          setState(() {
            clickCenterFAB = !clickCenterFAB;
          });
          Share.share(
            text,
            subject: widget.hadith.textHadith,
          );
        },
        tooltip: "Centre FAB",
        elevation: 4.0,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: const Icon(Icons.share),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: ColorApp.primary,
        child: Container(
          height: 60,
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  bol = true;
                  updateTapSelection(0, widget.hadith.textHadith);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.book,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0 ? ColorApp.yellow : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  bol = true;
                  updateTapSelection(1, widget.hadith.explanationHadith);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.library_books,
                  color: selectedIndex == 1 ? ColorApp.yellow : Colors.white,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  bol = true;
                  updateTapSelection(2, widget.hadith.translateNarrator);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.collections_bookmark,
                  color: selectedIndex == 2 ? ColorApp.yellow : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  bol = false;
                  updateTapSelection(
                      3, widget.hadith.key + ' \n' + widget.hadith.nameHadith);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.volume_up,
                  color: selectedIndex == 3 ? ColorApp.yellow : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

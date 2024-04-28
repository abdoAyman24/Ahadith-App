import 'package:audioplayers/audioplayers.dart';
import 'package:azkar/model/hadith.dart';
import 'package:azkar/utils/colorApp.dart';
import 'package:azkar/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LocalHadith extends StatefulWidget {
  Hadith hadith;
  int indexHadith;
  LocalHadith({required this.hadith, required this.indexHadith});

  @override
  State<LocalHadith> createState() => _LocalHadithState();
}

class _LocalHadithState extends State<LocalHadith> {
  late final AudioPlayer player;
  late final AssetSource path;
  bool isPlay = false;
  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = AssetSource('audio/${widget.hadith.audioHadith}');

    // set a callback for changing duration
    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    // set a callback for position change
    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    // set a callback for when audio ends
    player.onPlayerComplete.listen((_) {
      setState(() => _position = _duration);
    });
  }

  void playPause() async {
    if (isPlay) {
      player.pause();
      isPlay = false;
    } else {
      player.play(path);
      isPlay = true;
    }
    setState(() {});
  }

  Widget slider() {
    return Slider(
      value: _position.inSeconds.toDouble(),
      onChanged: (value) async {
        await player.seek(Duration(seconds: value.toInt()));
        setState(() {});
      },
      min: 0,
      max: _duration.inSeconds.toDouble(),
      inactiveColor: Colors.grey,
      activeColor: Colors.red,
    );
  }

  Widget _btn(Widget image, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 53.0,
      child: Container(
        width: 73,
        height: 53,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: Colors.black45,
          textColor: ColorApp.yellow,
          onPressed: onPressed,
          child: image,
        ),
      ),
    );
  }

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
                      height: 20,
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
                          Text(
                            widget.hadith.nameHadith,
                            style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.bold,
                                color: ColorApp.primary,
                                fontSize: 18),
                          ),
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
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/audio.svg',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    slider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.hadith.changeFavorite();
                            });
                          },
                          icon: widget.hadith.isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 40.0,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  size: 40.0,
                                ),
                        ),
                        const Text(''),
                        Text(_duration.format()),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _btn(
                          Image.asset('assets/rewind.png'),
                          () {
                            player.seek(
                                Duration(seconds: _position.inSeconds - 10));
                            setState(() {});
                          },
                        ),
                        _btn(
                          Icon(
                            isPlay ? Icons.pause_circle : Icons.play_circle,
                            color: Colors.red,
                          ),
                          () {
                            playPause();
                          },
                        ),
                        _btn(
                          Image.asset('assets/forward.png'),
                          () {
                            player.seek(
                                Duration(seconds: _position.inSeconds + 10));
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

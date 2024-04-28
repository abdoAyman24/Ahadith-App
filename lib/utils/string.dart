import 'package:azkar/utils/colorApp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextApp {
  static Text primary = Text('الأربعون النووية',
      style: GoogleFonts.tajawal(
          fontWeight: FontWeight.bold, fontSize: 36, color: ColorApp.offWhite));

  static Text primarySmalle = Text('الأربعون النووية',
      style: GoogleFonts.tajawal(fontSize: 16, color: Colors.black));

  static Text headerScreen = Text('لحفظ وسماع الاحاديث النبوية',
      style: GoogleFonts.tajawal(fontSize: 24, color: ColorApp.primary));

  static Text cardOne = Text('الأحاديث الأربعون',
      style: GoogleFonts.tajawal(fontSize: 22, color: ColorApp.offWhite));

  static Text cardTwo = Text('الأستماع للأحاديث',
      style: GoogleFonts.tajawal(fontSize: 22, color: ColorApp.offWhite));

  static Text cardThree = Text('الاحاديث المحفوظة',
      style: GoogleFonts.tajawal(fontSize: 22, color: ColorApp.offWhite));

  static Text screen1 = Text('الأحاديث الأربعون',
      style: GoogleFonts.tajawal(fontSize: 22, color: ColorApp.primary));

  static Text screen2 = Text('الأستماع للأحاديث',
      style: GoogleFonts.tajawal(fontSize: 22, color: ColorApp.primary));

  static Text textFav = Text('لا توجد احاديث مفضله',
      style: GoogleFonts.tajawal(
          fontWeight: FontWeight.bold, fontSize: 36, color: ColorApp.Dark));
}

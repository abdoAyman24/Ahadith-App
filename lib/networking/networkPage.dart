import 'package:azkar/model/hadith.dart';
import 'package:azkar/networking/networkContent.dart';
import 'package:flutter/material.dart';

class NetworkPage extends StatelessWidget {
  final String data;
  final Hadith hadith;

  NetworkPage({required this.data, required this.hadith});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          NetworkingPageContent(data: data),
        ],
      ),
    );
  }
}

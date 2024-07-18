import 'package:flutter/material.dart';
import 'package:football_score/utils/app_theme.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text('Match Details',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: const Center(
        child: Text('Match Detail Screen'),
      ),
    );
  }
}

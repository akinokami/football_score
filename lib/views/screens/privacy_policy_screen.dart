import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/global.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: lightWhiteColor),
        title: Text('Privacy Policy', style: TextStyle(color: lightWhiteColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Global.policy, style: TextStyle(color: lightWhiteColor, fontSize: 14)),
            )
          ],
        ),
      )
      ,
    );
  }
}

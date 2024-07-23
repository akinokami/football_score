import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Info'),
          Row(
            children: [
              CustomText(text: 'Founded in :'),
              CustomText(text: '1996'),
            ],
          ),
          Row(
            children: [
              CustomText(text: 'Founded in :'),
              CustomText(text: '1996'),
            ],
          ),
          Row(
            children: [
              CustomText(text: 'Founded in :'),
              CustomText(text: '1996'),
            ],
          ),
        ],
      ),
    );
  }
}

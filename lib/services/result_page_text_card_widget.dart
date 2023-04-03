import 'package:flutter/material.dart';
import 'package:ip_api/utilities/constants.dart';

//Widget from the result page where the result is displayed
class ResultPageTextCard extends StatelessWidget {
  const ResultPageTextCard({
    super.key,
    required this.textResultLabel,
    required this.textResult,
  });

  final String textResultLabel;
  final String textResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFBE11E5),
          ),
          child: Text(
            textResultLabel,
            style: kTextFieldLabelStyle,
          ),
        ),
        Text(textResult, style: kTextFieldStyle),
      ],
    );
  }
}

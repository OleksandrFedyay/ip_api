import 'package:flutter/material.dart';
import 'package:ip_api/utilities/constants.dart';
import 'package:ip_api/services/result_page_text_card_widget.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, this.ipApiResponse});

  final ipApiResponse;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late String firstResultTextFieldLabel;
  late String secondResultTextFieldLabel;
  late String thirdResultTextFieldLabel;
  late String firstResultTextField;
  late String secondResultTextField;
  late String thirdResultTextField;

  @override
  void initState() {
    super.initState();
    updateResultPageUI(widget.ipApiResponse);
  }

  void updateResultPageUI(ipApiData) {
    setState(() {
      if (ipApiData['message'] == 'invalid query' &&
          ipApiData['status'] == 'fail') {
        String query = ipApiData['query'];
        firstResultTextField = query;
        firstResultTextFieldLabel = 'QUERY:';

        String message = ipApiData['message'];
        secondResultTextField = message;
        secondResultTextFieldLabel = 'MESSAGE:';

        String status = ipApiData['status'];
        thirdResultTextField = status;
        thirdResultTextFieldLabel = 'STATUS:';
        return;
      }
      String isp = ipApiData['isp'] ?? 'No data available';
      firstResultTextField = isp;
      firstResultTextFieldLabel = 'ISP:';
      String country = ipApiData['country'] ?? 'No data available';
      secondResultTextField = country;
      secondResultTextFieldLabel = 'COUNTRY:';
      String city = ipApiData['city'] ?? 'No data available';
      thirdResultTextField = city;
      thirdResultTextFieldLabel = 'CITY:';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kAppBarTitle,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: kResultBoxDecoration,
                constraints:
                    const BoxConstraints.expand(width: double.infinity),
                margin: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResultPageTextCard(
                        textResultLabel: firstResultTextFieldLabel,
                        textResult: firstResultTextField),
                    const SizedBox(height: 10),
                    ResultPageTextCard(
                        textResultLabel: secondResultTextFieldLabel,
                        textResult: secondResultTextField),
                    const SizedBox(height: 10),
                    ResultPageTextCard(
                        textResultLabel: thirdResultTextFieldLabel,
                        textResult: thirdResultTextField),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color(0xFFFFBB47),
                  elevation: 15,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                child: const Text(
                  'ENTER ANOTHER IP',
                  style: kTextFieldStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

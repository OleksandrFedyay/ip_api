import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ip_api/utilities/constants.dart';
import 'package:ip_api/screens/resul_page.dart';
import 'package:ip_api/services/ip_api_output.dart';
import 'package:ip_api/services/alert.dart';

class IpApiInputScreen extends StatefulWidget {
  const IpApiInputScreen({super.key});

  @override
  State<IpApiInputScreen> createState() => _IpApiInputScreenState();
}

class _IpApiInputScreenState extends State<IpApiInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final FilteringTextInputFormatter inputFilteringFormattingAllowenses =
      FilteringTextInputFormatter.allow(
    RegExp('[0-9\\:\\.]'),
  );
  late String ipInput;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IP API'),
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  inputFormatters: [
                    inputFilteringFormattingAllowenses,
                  ],
                  style: const TextStyle(color: Colors.black),
                  decoration: kTextFieldDecoration,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your IP';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    ipInput = value;
                  },
                ),
              ),
              SizedBox(height: 50),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                        duration: Duration.zero,
                      ),
                    );
                    var ipApiData = await IpApiOutput().getIpApiData(ipInput);

                    if (ipApiData == null) {
                      ErrorAlert().buildAlert(context).show();
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultPage(ipApiResponse: ipApiData),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  backgroundColor: Color(0xFFFFBB47),
                  elevation: 15,
                  foregroundColor: Colors.pink,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

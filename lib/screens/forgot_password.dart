import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/form_container_forgotpassword.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void init() {
      print('object');
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: height + 100,
                color: Color.fromRGBO(255, 187, 0, 1),
                child: Stack(children: [
                  CustomFormFgtPwdWidget(
                    formItemNames: [
                      "Registered Email ID",
                      "Enter OTP",
                      "Enter New Password",
                      "Confirm New Password"
                      // Add more form items as needed
                    ],
                    title: 'Forgot Password',
                    submitName: 'Confirm Email ID',
                    onFormSubmitted: (Map<String, String> formValues) {
                      // Handle form values here
                      print('Form Values: $formValues');
                    },
                  ),
                  Positioned(
                      top: height * 0.09,
                      left: width * 0.3,
                      child: Text(
                        'TRANSIT',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ))
                ]))));
  }
}

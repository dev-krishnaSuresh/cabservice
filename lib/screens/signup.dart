import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/form_container_signup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: height + 200,
      color: Color.fromRGBO(255, 187, 0, 1),
      child: CustomFormSignupWidget(
        formItemNames: [
          "Full Name",
          "Phone Number",
          "Email ID",
          "Password",
          "Confirm Password"
          // Add more form items as needed
        ],
        title: 'Signup',
        submitName: 'Signup',
        onFormSubmitted: (Map<String, String> formValues) {
          // Handle form values here
          print('Form Values: $formValues');
        },
      ),
    )));
  }
}

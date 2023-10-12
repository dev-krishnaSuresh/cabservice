import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/form_container_login.dart';
import 'package:ontransit_app/screens/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 187, 0, 1),
      child: CustomFormWidget(
        formItemNames: [
          "User Id",
          "Password"
          // Add more form items as needed
        ],
        title: 'Login',
        submitName: 'Login',
        onFormSubmitted: (Map<String, String> formValues) {
          // Handle form values here
          print('Form Values: $formValues');
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Home();
          }));
        },
      ),
    );
  }
}

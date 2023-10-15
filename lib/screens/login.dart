import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/form_container_login.dart';
import 'package:ontransit_app/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  final SharedPreferences prefs;
  const Login({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
            child: Container(
                color: Color.fromRGBO(255, 187, 0, 1),
                child: Stack(
                  children: <Widget>[
                    CustomFormWidget(
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
                        prefs.setBool('isLoggedIn', true);
                        prefs.setString('userToken', 'your_user_token_here');
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
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
                  ],
                ))));
  }
}

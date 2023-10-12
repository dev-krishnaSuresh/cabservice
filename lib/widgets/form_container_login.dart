import 'package:flutter/material.dart';
import 'package:ontransit_app/screens/forgot_password.dart';
import 'package:ontransit_app/screens/signup.dart';

class CustomFormWidget extends StatefulWidget {
  final String title;
  final String submitName;
  final List<String> formItemNames;
  final Function(Map<String, String>) onFormSubmitted; // Callback function

  CustomFormWidget({
    required this.title,
    required this.submitName,
    required this.formItemNames,
    required this.onFormSubmitted, // Callback parameter
  });

  @override
  _CustomFormWidgetState createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  Map<String, String> formValues = {}; // Store form values
  Map<String, TextEditingController> formControllers =
      {}; // Store form controllers

  @override
  void initState() {
    super.initState();
    // Initialize form controllers
    widget.formItemNames.forEach((itemName) {
      formControllers[itemName] = TextEditingController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            // Wrap your content in a SingleChildScrollView

            child: Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (widget.title == 'Login')
            SizedBox(
              height: 20,
            ),
          Form(
            key: _formKey,
            child: Column(
              children: widget.formItemNames.map((itemName) {
                final controller = formControllers[itemName];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    if (itemName.toLowerCase().contains("password"))
                      TextFormField(
                        controller: controller,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFEEEEEE),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xFF262626),
                            ),
                          ),
                          hintText: '',
                          hintStyle: TextStyle(
                            color: Color(0xFF262626),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            height: 0.5,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter $itemName';
                          }
                          return null;
                        },
                      )
                    else
                      TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFEEEEEE),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          hintText: '',
                          hintStyle: TextStyle(
                            color: Color(0xFF262626),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            height: 0.5,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter $itemName';
                          }
                          return null;
                        },
                      ),
                    SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ),
          ),
          if (widget.title == 'Login')
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('Debug1: This is a debug message.');
                    _navigateToForgotPasswordScreen(
                        context); // Navigate to forgot password screen
                  },
                  child: Text(
                    "Forgot Password?",

                    style: TextStyle(
                      color: Color(0xFFFFBB00),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right, // Right-aligned text
                  ),
                ),
              ],
            ),
          SizedBox(height: 20),
          SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, collect and pass form values
                  widget.formItemNames.forEach((itemName) {
                    print(itemName);
                    print(_formKey.currentState);
                    final formValues = <String, String>{};
                    widget.formItemNames.forEach((itemName) {
                      final controller = formControllers[itemName];
                      formValues[itemName] = controller!.text;
                    });
                    widget.onFormSubmitted(formValues);
                  });
                  widget.onFormSubmitted(formValues); // Call the callback
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF262626),
              ),
              child: Text(
                widget.submitName,
                style: TextStyle(
                  color: Color(0xFFFFBB00),
                ),
              ),
            ),
          ),
          if (widget.title == 'Login')
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Do not have an account?",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.right, // Right-aligned text
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        _navigateToSignUpScreen(
                            context); // Navigate to sign-up screen
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Color(0xFFFFBB00),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left, // Right-aligned text
                      ),
                    )
                  ],
                )
              ],
            ),
        ],
      ),
    )));
  }

  // @override
  // void dispose() {
  //   // Dispose of form controllers when the widget is disposed
  //   formControllers.values.forEach((controller) {
  //     controller.dispose();
  //   });
  //   super.dispose();
  // }
}

void _navigateToForgotPasswordScreen(BuildContext context) {
  print('Debug2: This is a debug message.');
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) {
      print('inside context');
      return ForgotPassword();
    }),
  );
}

void _navigateToSignUpScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) {
      return SignUp();
    }),
  );
}

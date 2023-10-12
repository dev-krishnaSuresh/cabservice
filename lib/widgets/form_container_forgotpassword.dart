import 'package:flutter/material.dart';

class CustomFormFgtPwdWidget extends StatefulWidget {
  final String title;
  final String submitName;
  final List<String> formItemNames;
  final Function(Map<String, String>) onFormSubmitted; // Callback function

  CustomFormFgtPwdWidget({
    required this.title,
    required this.submitName,
    required this.formItemNames,
    required this.onFormSubmitted, // Callback parameter
  });

  @override
  _CustomFormWidgetState createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormFgtPwdWidget> {
  final _formkeysignup = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  Map<String, String> formValues = {}; // Store form values
  Map<String, TextEditingController> formControllers =
      {}; // Store form controllers
  bool otpState = false;
  bool passwordState = false;

  @override
  void initState() {
    super.initState();
    // Initialize form controllers
    widget.formItemNames.forEach((itemName) {
      print(itemName);
      formControllers[itemName] = TextEditingController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                icon: Icon(
                  // <-- Icon
                  Icons.arrow_back_ios_new,
                  size: 12,
                  color: Color.fromRGBO(255, 187, 0, 1),
                ),
                label: Text('Back'), // <-- Text
              ),
            ],
          ),
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
          SizedBox(height: 20),
          Form(
            key: _formkeysignup,
            child: Column(
              children: widget.formItemNames.map((itemName) {
                final controller = formControllers[itemName];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (itemName == "Enter OTP" && otpState ||
                        itemName == "Registered Email ID" ||
                        (itemName == "Enter New Password" && passwordState) ||
                        (itemName == "Confirm New Password" && passwordState))
                      Text(
                        itemName,
                        style: TextStyle(
                          color: Color(0xFF262626),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    SizedBox(height: 5),
                    if (itemName.toLowerCase().contains("password") &&
                        ((itemName == "Enter New Password" && passwordState) ||
                            (itemName == "Confirm New Password" &&
                                passwordState)))
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
                    else if (itemName == "Enter OTP" && otpState ||
                        itemName == "Registered Email ID" ||
                        (itemName == "Enter New Password" && passwordState) ||
                        (itemName == "Confirm New Password" && passwordState))
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
          SizedBox(height: 20),
          SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                if (_formkeysignup.currentState!.validate()) {
                  // Form is valid, collect and pass form values
                  widget.formItemNames.forEach((itemName) {
                    final formValues = <String, String>{};
                    widget.formItemNames.forEach((itemName) {
                      final controller = formControllers[itemName];
                      formValues[itemName] = controller!.text;
                    });
                    print(formValues);
                    widget.onFormSubmitted(formValues);
                    setState(() {
                      print(otpState);
                      print(passwordState);
                      final registeredEmailId =
                          formValues["Registered Email ID"];
                      final enterOTP = formValues["Enter OTP"];
                      if (!otpState &&
                          registeredEmailId != null &&
                          registeredEmailId.isNotEmpty) {
                        otpState = true;
                      } else if (otpState &&
                          !passwordState &&
                          enterOTP != null &&
                          enterOTP.isNotEmpty) {
                        passwordState = true;
                      }
                    });
                  });

                  // widget.onFormSubmitted(formValues); // Call the callback
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
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Dispose of form controllers when the widget is disposed
    formControllers.values.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }
}

void _navigateToForgotPasswordScreen(BuildContext context) {
  print('Debug2: This is a debug message.');
}

void _navigateToSignUpScreen(BuildContext context) {}

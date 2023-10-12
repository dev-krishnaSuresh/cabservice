import 'package:flutter/material.dart';

class CustomFormChooseCarWidget extends StatefulWidget {
  final String title;
  final String submitName;
  final List<String> formItemNames;
  final Function(Map<String, String>) onFormSubmitted; // Callback function

  CustomFormChooseCarWidget({
    required this.title,
    required this.submitName,
    required this.formItemNames,
    required this.onFormSubmitted, // Callback parameter
  });

  @override
  _CustomFormWidgetState createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormChooseCarWidget> {
  final _formkeysignup = GlobalKey<FormState>();

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
    String? _selectedOption;
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
          Form(
            key: _formkeysignup,
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    if (itemName == "Choose Car Type")
                      DropdownButtonFormField<String>(
                        value: _selectedOption,
                        // style: TextStyle(fontSize: 14, color: Color(0x262626)),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedOption = newValue;
                          });
                        },
                        items: widget.formItemNames.map((itemName) {
                          return DropdownMenuItem<String>(
                            value: itemName,
                            child: Text(itemName),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFEEEEEE),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 6,
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
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                      )
                    else
                      TextFormField(
                        controller: controller,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFEEEEEE),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 6,
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
                    print(itemName);
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

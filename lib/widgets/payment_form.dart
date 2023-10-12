import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/success_modal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Payment Form'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: PaymentForm(),
          ),
        ),
      ),
    );
  }
}

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _expiryDateMonthController =
      TextEditingController();
  final TextEditingController _securityCodeController = TextEditingController();

  bool _saveCard = false;

  @override
  void dispose() {
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _expiryDateMonthController.dispose();
    _securityCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 5),
              Text(
                "Cardholder Name",
                style: TextStyle(
                  color: Color(0xFF262626),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _cardHolderNameController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(
                            0xFFFFBB00), // Yellow border color when focused
                        width: 2.0, // Border width
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(
                            0xFFFFBB00), // Yellow border color in the normal state
                        // width: 2.0, // Border width
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors
                            .red, // Yellow border color in the normal state
                        // width: 2.0, // Border width
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(
                            0xFFFFBB00), // Yellow border color in the normal state
                        // width: 2.0, // Border width
                      ),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Cardholder Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                "Card Number",
                style: TextStyle(
                  color: Color(0xFF262626),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(
                            0xFFFFBB00), // Yellow border color when focused
                        width: 2.0, // Border width
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(
                            0xFFFFBB00), // Yellow border color in the normal state
                        // width: 2.0, // Border width
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors
                            .red, // Yellow border color in the normal state
                        // width: 2.0, // Border width
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(
                            0xFFFFBB00), // Yellow border color in the normal state
                        // width: 2.0, // Border width
                      ),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Card Number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Expiry Date",
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.27,
                  ),
                  Text(
                    "Security Code",
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expiryDateController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFFFBB00), // Yellow border color when focused
                              width: 2.0, // Border width
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFFFBB00), // Yellow border color in the normal state
                              // width: 2.0, // Border width
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors
                                  .red, // Yellow border color in the normal state
                              // width: 2.0, // Border width
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFFFBB00), // Yellow border color in the normal state
                              // width: 2.0, // Border width
                            ),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Expiry Date';
                        }
                        if (value.length != 2) {
                          return 'Invalid Expiry Date';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _expiryDateMonthController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFFFBB00), // Yellow border color when focused
                              width: 2.0, // Border width
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFFFBB00), // Yellow border color in the normal state
                              // width: 2.0, // Border width
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors
                                  .red, // Yellow border color in the normal state
                              // width: 2.0, // Border width
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFFFBB00), // Yellow border color in the normal state
                              // width: 2.0, // Border width
                            ),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Expiry Date';
                        }
                        if (value.length != 2) {
                          return 'Invalid Expiry Date';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                    height: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _securityCodeController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFFFBB00), // Yellow border color when focused
                              width: 2.0, // Border width
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFFFBB00), // Yellow border color in the normal state
                              // width: 2.0, // Border width
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors
                                  .red, // Yellow border color in the normal state
                              // width: 2.0, // Border width
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFFFBB00), // Yellow border color in the normal state
                              // width: 2.0, // Border width
                            ),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Security Code';
                        }
                        if (value.length != 3) {
                          return 'Code must be 3 digits';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _saveCard,
                    onChanged: (value) {
                      setState(() {
                        _saveCard = value!;
                      });
                    },
                  ),
                  Text('Save this card'),
                ],
              ),
              Divider(
                color: Color(0xFFEEEEEE),
                thickness: 1.0,
                height: 1.0,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Estimation",
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "R15.00",
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF262626),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, perform payment processing here
                        final cardHolderName = _cardHolderNameController.text;
                        final cardNumber = _cardNumberController.text;
                        final expiryDate = _expiryDateController.text;
                        final expiryDateMonth = _expiryDateMonthController.text;
                        final securityCode = _securityCodeController.text;
                        final saveCard = _saveCard;

                        // Perform payment processing logic here
                        // You can access the entered data above
                        print('Cardholder Name: $cardHolderName');
                        print('Card Number: $cardNumber');
                        print('Expiry Date: $expiryDate');
                        print('Expiry Date: $expiryDateMonth');
                        print('Security Code: $securityCode');
                        print('Save Card: $saveCard');
                      }
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        print('inside context');
                        return SuccessModal();
                      }));
                    },
                    child: Text(
                      'Make Payment',
                      style: TextStyle(
                        color: Color(0xFFFFBB00),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

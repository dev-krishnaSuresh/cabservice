import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:ontransit_app/widgets/map_route.dart';
import 'package:ontransit_app/widgets/dottedline.dart';
import 'package:ontransit_app/widgets/payment_form.dart';
import 'package:ontransit_app/widgets/success_modal.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  String selectedPaymentOption = 'Cash';
  bool showCardForm = false;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Container(
            color: Color(0xFFFFBB00),
            child: Column(
              children: [
                Container(height: height * 0.4, child: MapRoute()),
                Center(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('Amount to be Paid',
                          style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(8),
                          color: Color(0xffCBCBCB),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffEEEEEE),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Estimation",
                                    style: TextStyle(
                                        color: Color(0xff262626), fontSize: 14),
                                  ),
                                  Text(
                                    "R15.00",
                                    style: TextStyle(
                                        color: Color(0xff262626),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ))),
                      SizedBox(height: 15),
                      Text('Choose Payment Method',
                          style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Radio(
                            value: 'Cash',
                            groupValue: selectedPaymentOption,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentOption = value!;
                                showCardForm = false;
                              });
                            },
                          ),
                          Text('Cash'),
                          Radio(
                            value: 'Card',
                            groupValue: selectedPaymentOption,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentOption = value!;
                                showCardForm = true;
                              });
                            },
                          ),
                          Text('Card'),
                        ],
                      ),
                      if (showCardForm)
                        PaymentForm()
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      print('inside context');
                                      return SuccessModal();
                                    }));
                                  }
                                  // Navigator.of(context)
                                  //     .push(MaterialPageRoute(builder: (context) {
                                  //   print('inside context');
                                  //   return Payment();
                                  // }));
                                  ,
                                  child: Text(
                                    'Make Payment',
                                    style: TextStyle(
                                      color: Color(0xFFFFBB00),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                    ],
                  ),
                ))
              ],
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/app_bar.dart';
import 'package:ontransit_app/widgets/payment_widget.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return HomeAppBar(
      body: PaymentWidget(),
      title: "Make Payment",
      backbutton: true,
    );
  }
}

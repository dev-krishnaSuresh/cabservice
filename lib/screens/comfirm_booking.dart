import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/confirm_details.dart';
import 'package:ontransit_app/widgets/app_bar.dart';

class ConfirmBooking extends StatefulWidget {
  const ConfirmBooking({super.key});

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  @override
  Widget build(BuildContext context) {
    return HomeAppBar(
      body: ConfirmDetails(),
      title: "Confirm your booking",
      backbutton: true,
    );
  }
}

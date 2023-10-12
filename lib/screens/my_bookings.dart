import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/app_bar.dart';
import 'package:ontransit_app/widgets/mybookings_widget.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return HomeAppBar(
      body: MyBookingsWidget(),
      title: "My Bookings",
      backbutton: true,
    );
  }
}

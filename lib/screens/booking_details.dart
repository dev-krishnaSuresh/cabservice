import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/bookingdetails_conatiner.dart';
import 'package:ontransit_app/widgets/confirm_details.dart';
import 'package:ontransit_app/widgets/map_screen.dart';
import 'package:ontransit_app/widgets/app_bar.dart';

class BookingDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  const BookingDetails({super.key, required this.data});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return HomeAppBar(
      body: BookingDetailsContainer(data: widget.data),
      title: "My Bookings",
      backbutton: true,
    );
  }
}

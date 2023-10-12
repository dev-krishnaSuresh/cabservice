import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ontransit_app/widgets/mybookings_container.dart';

class MyBookingsWidget extends StatefulWidget {
  const MyBookingsWidget({super.key});

  @override
  State<MyBookingsWidget> createState() => _MyBookingsWidgetState();
}

class _MyBookingsWidgetState extends State<MyBookingsWidget> {
  int selectedIndex = 0; // Initial selected index

  @override
  late Map<String, dynamic> data;
  late List<dynamic> cancelledBookings;
  late List<dynamic> ongoingBookings = [];
  late List<dynamic> completedBookings;

  Future<void> loadJsonData() async {
    // Load the JSON file using rootBundle
    final String jsonData =
        await rootBundle.loadString('assets/bookingDetails.json');
    data = json.decode(jsonData);
    cancelledBookings = data['bookingDetails'].where((booking) {
      return booking['status'] == 'Cancelled';
    }).toList();
    ongoingBookings = data['bookingDetails'].where((booking) {
      return booking['status'] == 'Ongoing';
    }).toList();
    completedBookings = data['bookingDetails'].where((booking) {
      return booking['status'] == 'Completed';
    }).toList();
  }

  void initState() {
    loadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 500,
      color: Color(0xffEEEEEE),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoSegmentedControl(
            borderColor: Colors.amber,
            pressedColor: Colors.amber,
            children: {
              0: buildSegmentedControlChild("Ongoing", 0),
              1: buildSegmentedControlChild("Completed", 1),
              2: buildSegmentedControlChild("Cancelled", 2),
            },
            groupValue: selectedIndex,
            onValueChanged: (int newValue) {
              setState(() {
                selectedIndex = newValue;
              });
            },
          ),
          SizedBox(height: 20),
          Expanded(
              child: ListView(
                  children: selectedIndex == 0
                      ? ongoingBookings
                          .map((e) => MyBookingsContainer(data: e))
                          .toList()
                      : selectedIndex == 1
                          ? completedBookings
                              .map((e) => MyBookingsContainer(data: e))
                              .toList()
                          : cancelledBookings
                              .map((e) => MyBookingsContainer(data: e))
                              .toList())),

          //                 ongoingBookings.forEach((e) {
          // })
        ],
      ),
    ));
  }

  Widget buildSegmentedControlChild(String text, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? Color(0xFF262626)
            : Colors.white, // Background color for the selected segment
        borderRadius: BorderRadius.circular(
            7.0), // Border radius for the selected segment
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selectedIndex == index
              ? Colors.amber
              : Color(0xFF9F9F9F), // Text color for the selected segment
        ),
      ),
    );
  }
}

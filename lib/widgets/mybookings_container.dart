import 'package:flutter/material.dart';
import 'package:ontransit_app/screens/booking_details.dart';
import 'package:ontransit_app/widgets/dottedline.dart';

class MyBookingsContainer extends StatefulWidget {
  final Map<String, dynamic> data;

  const MyBookingsContainer({required this.data});

  @override
  State<MyBookingsContainer> createState() => _MyBookingsContainerState();
}

class _MyBookingsContainerState extends State<MyBookingsContainer> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookingDetails(
                    data: widget
                        .data)), // Replace SecondPage with the target page
          );
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data['dateTime'],
                              style: TextStyle(fontSize: 10),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.data['carType'],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 8),
                                ),
                                Container(
                                  width: 0.8, // Width of the vertical divider
                                  height: 10, // Height of the vertical divider
                                  color: Colors
                                      .grey, // Color of the vertical divider
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          10), // Margin around the divider
                                ),
                                Text(
                                  widget.data['vechicleNumber'],
                                  style: TextStyle(fontSize: 8),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 10.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFBB00),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Center(
                                      child: Center(
                                        child: DottedLinesContainer(
                                          lineCount:
                                              4, // Number of horizontal dotted lines
                                          lineSpacing:
                                              1, // Spacing between lines
                                          lineColor: Color(
                                              0xffCBCBCB), // Color of the lines
                                          lineWidth: 6.0, // Width of the lines
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 10.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFF6A6A),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    // width: width * 0.3,
                                    height: height * 0.11,
                                    padding: EdgeInsets.all(9),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: width * 0.45,
                                          child: Text(
                                            widget.data['pickupPoint'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            style: TextStyle(
                                                color: Color(0xff262626),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.45,
                                          child: Text(
                                            widget.data['dropPoint'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            style: TextStyle(
                                                color: Color(0xff262626),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "R15.00",
                          style: TextStyle(
                              color: Color(0xff262626),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: width * 0.15, // Adjust the width as needed
                          height: width * 0.15, // Adjust the height as needed
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFEEEEEE), // Border color
                              width: 1.0, // Border width (1px)
                            ),
                            borderRadius:
                                BorderRadius.circular(25.0), // Border radius
                          ),
                          child: Image.asset(
                            'assets/images/driver.jpeg', // Replace with the path to your image asset
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: widget.data['status'] == 'Ongoing' ? 10 : 0,
                ),
                widget.data['status'] == 'Ongoing'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xffEEEEEE),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0xFFFFBB00), // Border color
                                width: 2.0, // Border width (1px)
                              ),
                            ),
                            child: Text(
                              "OTP : ${widget.data['otp']}",
                              style: TextStyle(
                                  color: Color(0xff262626),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Container(
                            width: width * 0.1, // Adjust the width as needed
                            height: width * 0.1, // Adjust the height as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  Color(0xFFFFBB00), // Circle background color
                            ),
                            child: Center(
                              child: Icon(
                                Icons.phone,
                                size: 20.0, // Adjust the icon size as needed
                                color: Colors.white, // Icon color
                              ),
                            ),
                          )
                        ],
                      )
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(
                  height:
                      widget.data['status'] == 'Ongoing' ? height * 0.04 : 0,
                ),
                widget.data['status'] == 'Ongoing'
                    ? Divider(
                        color: Color(0xFFEEEEEE),
                        thickness: 1.0,
                        height: 1.0,
                      )
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(
                  height:
                      widget.data['status'] == 'Ongoing' ? height * 0.04 : 0,
                ),
                widget.data['status'] == 'Ongoing'
                    ? RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Status : ',
                              style: TextStyle(
                                color: Colors.black, // Color for the first half
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: widget.data['status'],
                              style: TextStyle(
                                color:
                                    Colors.black, // Color for the second half
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      )
              ],
            )));
  }
}

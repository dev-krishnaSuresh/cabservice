import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/dottedline.dart';
import 'package:ontransit_app/widgets/map_route.dart';

class BookingDetailsContainer extends StatefulWidget {
  final Map<String, dynamic> data;
  const BookingDetailsContainer(
      {super.key, required Map<String, dynamic> this.data});

  @override
  State<BookingDetailsContainer> createState() =>
      _BookingDetailsContainerState();
}

class _BookingDetailsContainerState extends State<BookingDetailsContainer> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    void showAlertDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Container(
                  width: width * 0.2, // Adjust the width as needed
                  height: width * 0.2, // Adjust the height as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFEEEEEE), // Border color
                      width: 1.0, // Border width (1px)
                    ),
                    borderRadius: BorderRadius.circular(25.0), // Border radius
                  ),
                  child: Image.asset(
                    'assets/images/caution.jpg', // Replace with the path to your image asset
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                )),
                SizedBox(height: 10.0),
                Text(
                  'Cancel the booking?',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Add your code for 'Yes' button action here.
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF262626)),
                        minimumSize:
                            MaterialStateProperty.all(Size(100.0, 40.0)),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFFFBB00),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Add your code for 'No' button action here.
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFE1E1E1)),
                        minimumSize:
                            MaterialStateProperty.all(Size(100.0, 40.0)),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF252525),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return SingleChildScrollView(
        child: Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFFEEEEEE),
                ),
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(height: height * 0.4, child: MapRoute()),
                        Center(
                            child: Container(
                          height: widget.data['status'] == "Ongoing"
                              ? height * 0.53
                              : height * 0.48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
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
                                                  8, // Number of horizontal dotted lines
                                              lineSpacing:
                                                  1, // Spacing between lines
                                              lineColor: Color(
                                                  0xffCBCBCB), // Color of the lines
                                              lineWidth:
                                                  6.0, // Width of the lines
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
                                        width: width * 0.6,
                                        height: height * 0.18,
                                        padding: EdgeInsets.all(9),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Pickup Location',
                                                  style: TextStyle(
                                                      color: Color(0xff9F9F9F),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  widget.data['pickupPoint'],
                                                  style: TextStyle(
                                                      color: Color(0xff262626),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Destination',
                                                  style: TextStyle(
                                                      color: Color(0xff9F9F9F),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  widget.data['dropPoint'],
                                                  style: TextStyle(
                                                      color: Color(0xff262626),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: height *,
                              // ),
                              Divider(
                                color: Color(0xFFEEEEEE),
                                thickness: 1.0,
                                height: 1.0,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width *
                                        0.15, // Adjust the width as needed
                                    height: width *
                                        0.15, // Adjust the height as needed
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            Color(0xFFEEEEEE), // Border color
                                        width: 1.0, // Border width (1px)
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          25.0), // Border radius
                                    ),
                                    child: Image.asset(
                                      'assets/images/driver.jpeg', // Replace with the path to your image asset
                                      fit: BoxFit
                                          .cover, // Adjust the fit as needed
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Service Person",
                                        style: TextStyle(
                                            color: Color(0xff9F9F9F),
                                            fontSize: 10),
                                      ),
                                      Text(
                                        widget.data['servicePerson'],
                                        style: TextStyle(
                                            color: Color(0xff262626),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        widget.data['dateTime'],
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Row(children: [
                                        Text(
                                          widget.data['carType'],
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 8),
                                        ),
                                        Container(
                                          width:
                                              0.8, // Width of the vertical divider
                                          height:
                                              10, // Height of the vertical divider
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
                                      ])
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Payment : ',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors
                                                .black, // Color for the first half
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: widget.data['payment'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors
                                                .black, // Color for the second half
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    widget.data['paymentCost'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff262626),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              // Spacer(),
                              Divider(
                                color: Color(0xFFEEEEEE),
                                thickness: 1.0,
                                height: 1.0,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Status : ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors
                                                  .black, // Color for the first half
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          TextSpan(
                                            text: widget.data['status'],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors
                                                  .black, // Color for the second half
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    widget.data['status'] == "Ongoing"
                                        ? TextButton(
                                            onPressed: () {
                                              showAlertDialog(context);
                                              // Add your cancellation logic here
                                            },
                                            child: Text("Cancel Booking"),
                                          )
                                        : SizedBox(width: 0, height: 0)
                                  ])
                            ],
                          ),
                        ))
                      ],
                    )))));
  }
}

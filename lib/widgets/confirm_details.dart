import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ontransit_app/screens/payment.dart';
import 'package:ontransit_app/widgets/dottedline.dart';
import 'package:ontransit_app/widgets/map_route.dart';

class ConfirmDetails extends StatefulWidget {
  @override
  _ConfirmDetailsState createState() => _ConfirmDetailsState();
}

class _ConfirmDetailsState extends State<ConfirmDetails> {
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
                  height: height * 0.8,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('Confirm Details',
                          style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffEEEEEE),
                        ),
                        padding: EdgeInsets.all(20),
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
                                          10, // Number of horizontal dotted lines
                                      lineSpacing: 1, // Spacing between lines
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
                                width: width * 0.6,
                                height: height * 0.2,
                                padding: EdgeInsets.all(9),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "5th Cross Street, Halfway Gardens, Midrand",
                                          style: TextStyle(
                                              color: Color(0xff262626),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "5th Cross Street, Halfway Gardens, Midrand",
                                          style: TextStyle(
                                              color: Color(0xff262626),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // width: 200,
                            child: Column(
                              children: [
                                Text(
                                  'Car Type',
                                  style: TextStyle(
                                      color: Color(0xff9F9F9F),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Sedan",
                                  style: TextStyle(
                                      color: Color(0xff262626),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            // width: 200,
                            child: Column(
                              children: [
                                Text(
                                  'Vehicle Number',
                                  style: TextStyle(
                                      color: Color(0xff9F9F9F),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "ABC 123 EF",
                                  style: TextStyle(
                                      color: Color(0xff262626),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Spacer(),
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF262626),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Payment();
                          }));
                        },
                        child: Text(
                          'Confirm Booking',
                          style: TextStyle(
                            color: Color(0xFFFFBB00),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            )));
  }
}

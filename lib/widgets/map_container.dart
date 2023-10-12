import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapContainer(),
    );
  }
}

class MapContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
        height: height * 0.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(0.0, 0.0), // Default initial location
                  zoom: 15.0,
                ),
              ),
            ),
            Positioned(
                top: 10,
                child: Container(
                  height: 100,
                  width: 0.8 * MediaQuery.of(context).size.width,
                  child: TextField(
                    style: TextStyle(fontSize: 10),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFFFBB00),
                      ),
                      hintText: "Your Pickup Location",
                      hintStyle: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 12.0,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                )),
            Positioned(
                bottom: 10,
                child: Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFFFBB00),
                      ),
                      hintText: "Choose Your Destination",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                      filled: true,
                      fillColor: Color(0xFF262626),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                )),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRoute extends StatefulWidget {
  const MapRoute({super.key});

  @override
  State<MapRoute> createState() => _MapRouteState();
}

class _MapRouteState extends State<MapRoute> {
  @override
  Widget build(BuildContext context) {
    GoogleMapController? _mapController;
    LatLng _center = LatLng(12.9716, 77.5946); // Bangalore
    LatLng? _pickupLocation;
    LatLng? _dropLocation;
    Set<Marker> _markers = {};

    void _onMapCreated(GoogleMapController controller) {
      setState(() {
        _mapController = controller;
      });
    }

    void _onTap(LatLng location) {
      setState(() {
        if (_pickupLocation == null) {
          // set the pickup location
          _pickupLocation = location;
          _markers.add(Marker(
            markerId: MarkerId('pickup'),
            position: location,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow: InfoWindow(title: 'Pickup Location'),
          ));
        } else if (_dropLocation == null) {
          // set the drop location
          _dropLocation = location;
          _markers.add(Marker(
            markerId: MarkerId('drop'),
            position: location,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(title: 'Drop Location'),
          ));
        } else {
          // reset the locations
          _pickupLocation = null;
          _dropLocation = null;
          _markers.clear();
        }
      });
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      onTap: _onTap,
      markers: _markers,
    );
  }
}

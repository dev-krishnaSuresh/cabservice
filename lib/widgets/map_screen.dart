import 'package:flutter/material.dart';
import 'package:ontransit_app/screens/comfirm_booking.dart';
import 'package:ontransit_app/widgets/form_container_choosecar.dart';
import 'package:ontransit_app/widgets/map_container.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: Color(0xFFFFBB00),
      child: Column(
        children: [
          MapContainer(),
          CustomFormChooseCarWidget(
            formItemNames: [
              "Choose Car Type",
              "Vechicle Number"
              // Add more form items as needed
            ],
            title: 'Login',
            submitName: 'Book Now',
            onFormSubmitted: (Map<String, String> formValues) {
              // Handle form values here
              print('Form Values: $formValues');

              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ConfirmBooking();
              }));
            },
          ),
        ],
      ),
    ));
  }
}

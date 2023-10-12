import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/map_screen.dart';
import 'package:ontransit_app/widgets/app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return HomeAppBar(
      body: MapScreen(),
      title: 'Home',
      backbutton: false,
    );
  }
}

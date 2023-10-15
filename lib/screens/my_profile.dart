import 'package:flutter/material.dart';
import 'package:ontransit_app/widgets/app_bar.dart';
import 'package:ontransit_app/widgets/myprofile_widget.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return HomeAppBar(
      body: MyProfileWidget(),
      title: "My Profile",
      backbutton: true,
    );
  }
}

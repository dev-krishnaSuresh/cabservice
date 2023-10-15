import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ontransit_app/screens/login.dart';
import 'package:ontransit_app/screens/my_profile.dart';

class HomeAppBar extends StatefulWidget {
  final Widget body;
  final String title;
  bool backbutton;
  HomeAppBar(
      {required this.body, required this.title, required this.backbutton});
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final ImagePicker _imagePicker = ImagePicker();
    String? _profileImagePath; // Store the selected profile image path

    // Function to open the image picker and set the selected image as the profile picture
    Future<void> _pickImageFromCamera() async {
      final XFile? pickedImage =
          await _imagePicker.pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        setState(() {
          _profileImagePath = pickedImage.path;
        });
      }
    }

    Future<void> _pickImageFromGallery() async {
      final XFile? pickedImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          _profileImagePath = pickedImage.path;
        });
      }
    }

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
                Text("Do you want to"),
                // SizedBox(height: 10.0),
                Text(
                  'Logout?',
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
                        Navigator.of(context).pushNamed('/');
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

    print(_profileImagePath);

    return Scaffold(
      appBar: AppBar(
        leading: widget.backbutton
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xffFFBB00)),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        automaticallyImplyLeading: widget.backbutton ? true : false,
        backgroundColor: Color(0xFF262626),
        title: widget.title == "Home"
            ? Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Color(0xFFFFBB00),
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "UserName",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              )
            : Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xFFFFBB00),
            ),
            onPressed: () {
              // Open the drawer
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      body: widget.body,
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: double.infinity,
          color: Color(0xFFFFBB00),
          child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              if (_profileImagePath != null)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.file(
                                    File(
                                        _profileImagePath!), // Use File from dart:io
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFBB00),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title:
                                                Text("Select Profile Picture"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ListTile(
                                                  leading:
                                                      Icon(Icons.camera_alt),
                                                  title: Text("Take a Photo"),
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    _pickImageFromCamera();
                                                  },
                                                ),
                                                ListTile(
                                                  leading: Icon(Icons.photo),
                                                  title: Text(
                                                      "Choose from Gallery"),
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    _pickImageFromGallery();
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // Container()
                            ],
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "UserName",
                                style: TextStyle(
                                  color: Color(0xFF252525),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "user@example.com",
                                style: TextStyle(
                                  color: Color(0xFFA1A1A1),
                                  fontSize: 10.0,
                                ),
                              ),
                              SizedBox(height: 6.0),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      print('inside context');
                                      return MyProfile();
                                    }),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  side: BorderSide(color: Color(0xFFFFBB00)),
                                ),
                                child: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    color: Color(0xFFFFBB00),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xFFE1E1E1),
                        thickness: 1.0,
                        height: 1.0,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home, color: Color(0xFF252525)),
                  title: Text("Home",
                      style:
                          TextStyle(color: Color(0xFF252525), fontSize: 14.0)),
                ),
                ListTile(
                  leading: Icon(Icons.book, color: Color(0xFF252525)),
                  title: Text("My Bookings",
                      style:
                          TextStyle(color: Color(0xFF252525), fontSize: 14.0)),
                ),
                ListTile(
                  leading: Icon(Icons.description, color: Color(0xFF252525)),
                  title: Text("Terms and Conditions",
                      style:
                          TextStyle(color: Color(0xFF252525), fontSize: 14.0)),
                ),
                ListTile(
                  leading: Icon(Icons.lock, color: Color(0xFF252525)),
                  title: Text("Privacy Policy",
                      style:
                          TextStyle(color: Color(0xFF252525), fontSize: 14.0)),
                ),
                ListTile(
                  leading: Icon(Icons.money, color: Color(0xFF252525)),
                  title: Text("Refund Policy",
                      style:
                          TextStyle(color: Color(0xFF252525), fontSize: 14.0)),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context);
                    // Perform logout action here
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200.0, 36.0),
                    primary: Color(0xFF252525),
                    onPrimary: Color(0xFFFFBB00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text("Logout"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

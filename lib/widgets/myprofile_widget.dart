import 'package:flutter/material.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({super.key});

  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isPasswordVisible = false;
    // TextEditingController passwordController = {};

    return SingleChildScrollView(
      child: Container(
        color: Color(0xffEEEEEE),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Personal Information",
                  style: TextStyle(
                    color: Color(0xff252525),
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Edit",
                  style: TextStyle(color: Color(0xffFFBB00), fontSize: 12),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: TextStyle(
                        color: Color(0xffA1A1A1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Michael Richard",
                    style: TextStyle(
                        color: Color(0xff252525),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email ID",
                    style: TextStyle(
                        color: Color(0xffA1A1A1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "michaelrichard@gmail.com",
                    style: TextStyle(
                        color: Color(0xff252525),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                        color: Color(0xffA1A1A1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "+27 987654321",
                    style: TextStyle(
                        color: Color(0xff252525),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                    color: Color(0xff252525),
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Change Password",
                  style: TextStyle(color: Color(0xffFFBB00), fontSize: 12),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        color: Color(0xffA1A1A1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    // controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Color(0xFFEEEEEE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xFF262626),
                        ),
                      ),
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Color(0xFF262626),
                      ),
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        height: 0.5,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

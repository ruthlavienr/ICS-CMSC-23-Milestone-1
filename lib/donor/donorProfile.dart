//Donor's Profile

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Temporary profile for donor
            CircleAvatar(
              radius: 55,
              child: Icon(
                Icons.person,
                color: Color.fromRGBO(135, 206, 235, 50),
                size: 55,
              ),
            ),
            SizedBox(height: 25),
            //username of the donor
            Text(
              "@USERNAME",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            SizedBox(height: 30),
            Divider(
              color: Color.fromRGBO(135, 206, 235, 100),
            ),
            // email of the donor
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Color.fromRGBO(135, 206, 235, 100),
                  size: 30,
                ),
                Text("EMAIL",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
            SizedBox(height: 30),
            Divider(
              color: Color.fromRGBO(135, 206, 235, 100),
            ),
            //contact number of the donor
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: Color.fromRGBO(135, 206, 235, 50),
                  size: 30,
                ),
                Text("CALL",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
            SizedBox(height: 30),
            Divider(
              color: Color.fromRGBO(135, 206, 235, 50),
            ),
            //donations made by the donor
            Row(
              children: [
                Icon(
                  Icons.house_outlined,
                  color: Color.fromRGBO(135, 206, 235, 50),
                  size: 30,
                ),
                Text("DONATIONS",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
            SizedBox(height: 30),
            Divider(
              color: Color.fromRGBO(135, 206, 235, 100),
            ),
            //privacy policy
            Row(
              children: [
                Icon(
                  Icons.shield,
                  color: Color.fromRGBO(135, 206, 235, 100),
                  size: 30,
                ),
                Text("PRIVACY",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
            SizedBox(height: 30),
            Divider(
              color: Color.fromRGBO(135, 206, 235, 100),
            ),
            //settings
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Color.fromRGBO(135, 206, 235, 100),
                  size: 30,
                ),
                Text("SETTINGS",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
            SizedBox(height: 30),
            Divider(
              color: Color.fromRGBO(135, 206, 235, 100),
            ),
            //logout option
            Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Color.fromRGBO(135, 206, 235, 100),
                  size: 30,
                ),
                Text("LOGOUT",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
          ],
        )));
  }
}

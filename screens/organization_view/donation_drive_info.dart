// this screen is for viewing the information of a donation drive;
// organization can also update or delete the donation drive

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elbi Donation System',
      home: DonationDriveScreen(),
    );
  }
}

class DonationDriveScreen extends StatelessWidget {
  // sample data for a donation drive
  final String driveName = "Help the Community";
  final String location = "Los Banos, Laguna";
  final String category = "Health";
  final String description =
      "Collecting donations to feed 50 families in underprivileged communities.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Donation Drive",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2F4852)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // sample pic for the 'cover photo' of the donation drive
              Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage("assets/sample-pic.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // display the information of the donation drive
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$driveName',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF2F4852)),
                        textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text('$location',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2F4852)),
                        textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF50C0ED),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '$category',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('$description',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF2F4852)),
                        textAlign: TextAlign.center),
                    SizedBox(height: 10),
                    // update and delete buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('UPDATE',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF50C0ED),
                              minimumSize: Size(double.infinity, 48),
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              _showDeleteConfirmationDialog(context);
                            },
                            child: Text('DELETE',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Color(0xFF2F4852))),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFD9D9D9),
                              minimumSize: Size(double.infinity,
                                  48), // makes button width 100%
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// function to view a modal when deleting the donation drive
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Donation Drive"),
          content: Text(
              "Are you sure you want to delete this donation drive? This action cannot be undone."),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel", style: TextStyle(color: Color(0xFF8F8F8F))),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // dismiss the dialog but don't delete
              },
            ),
            TextButton(
              child: Text("Delete", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // dismiss the dialog after deleting
              },
            ),
          ],
        );
      },
    );
  }
}

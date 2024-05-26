// screen of donation if donations is for pick - up
// additional info include address for pick up and contact number

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  // sample data
  final String donorName = "John Doe";
  final String category = "Food";
  final String mode = "Pick-up";
  final double weight = 0.5;
  final String dateTime = "May 11, 2024, 3:00 PM";
  final String address = "123 ABC Street., XYZ City";
  final String contactNum = "09123456789";
  String selectedStatus = "Pending";

  final List<String> statuses = [
    'Pending',
    'Confirmed',
    'Scheduled for Pick Up',
    'Complete',
    'Cancelled'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Color(0xFF87CEEB), // Sky blue color
      //         ),
      //         child: Text(
      //           'Elbi\nDonation\nSystem',
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //               fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Home'),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: const Text('Donation Drives'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Profile'),
      //         onTap: () {},
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        title: Text(
          'Donation',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2F4852)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        // backgroundColor: Color(0xFF50C0ED),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sample-pic.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: EdgeInsets.all(16),
                clipBehavior: Clip.antiAlias,
              ),
              infoSection("Donor's Name", value: donorName),
              infoSection("Category", value: category),
              infoSection("Pickup or Drop-off", value: mode),
              infoSection("Weight (in kg)", value: weight.toString()),
              infoSection("Date and Time of Pick-Up", value: dateTime),
              infoSection("Address", value: address),
              infoSection("Contact Number", value: contactNum),
              infoSection("Status",
                  dropdown: dropdownMenu(statuses, selectedStatus, (newValue) {
                    setState(() {
                      selectedStatus = newValue;
                    });
                  })),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('CANCEL',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFF2F4852))),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD9D9D9),
                      ),
                    ),
                    // save button for saving state if status is changed, or cancel button to discard changes
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('SAVE',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF50C0ED),
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

// widget for layout and style of the information
  Widget infoSection(String title, {String? value, Widget? dropdown}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18)),
          dropdown ??
              Text(value ?? '', style: GoogleFonts.poppins(fontSize: 16)),
        ],
      ),
    );
  }

// widget for drop down menu in status
  Widget dropdownMenu(List<String> options, String currentValue,
      void Function(String) onChanged) {
    return DropdownButton<String>(
      value: currentValue,
      onChanged: (String? newValue) => onChanged(newValue!),
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: GoogleFonts.poppins(fontSize: 16)),
        );
      }).toList(),
      isExpanded: true,
    );
  }
}

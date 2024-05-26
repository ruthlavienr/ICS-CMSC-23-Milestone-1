// screen for the homepage of the organization
// that displays a list of donations
// the organization can see a summary on the top of the screen
// the organization can search and filter the donation list by category and/or status

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/organization/donation_drives.dart';
import 'package:my_app/organization/donation_dropoff.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // sample data for summary card
  final Map<String, int> donationStatusCounts = {
    'Total Donations': 120,
    'Pending': 25,
    'Confirmed': 40,
    'Scheduled for Pick Up': 15,
    'Completed': 35,
    'Cancelled': 5,
  };

  // sample data for donations
  List<Donation> allDonations = [
    Donation(
        status: 'Pending',
        donor: 'Donor 1',
        title: 'Donation 1',
        category: 'Food'),
    Donation(
        status: 'Confirmed',
        donor: 'Donor 2',
        title: 'Donation 2',
        category: 'Clothes'),
    Donation(
        status: 'Scheduled for Pick Up',
        donor: 'Donor 3',
        title: 'Donation 3',
        category: 'Cash'),
    Donation(
        status: 'Completed',
        donor: 'Donor 4',
        title: 'Donation 4',
        category: 'Necessities'),
    Donation(
        status: 'Cancelled',
        donor: 'Donor 5',
        title: 'Donation 5',
        category: 'Others'),
    Donation(
        status: 'Pending',
        donor: 'Donor 1',
        title: 'Donation 1',
        category: 'Food'),
    Donation(
        status: 'Confirmed',
        donor: 'Donor 2',
        title: 'Donation 2',
        category: 'Clothes'),
    Donation(
        status: 'Scheduled for Pick Up',
        donor: 'Donor 3',
        title: 'Donation 3',
        category: 'Cash'),
    Donation(
        status: 'Completed',
        donor: 'Donor 4',
        title: 'Donation 4',
        category: 'Necessities'),
    Donation(
        status: 'Cancelled',
        donor: 'Donor 5',
        title: 'Donation 5',
        category: 'Others'),
  ];

  // initialization for search, filter; controller
  String? selectedCategory;
  String? selectedStatus;
  List<Donation> filteredDonations = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // initialized that all donations will be viewed
    filteredDonations = allDonations;
    //listener calls _filterDonations everytime searchController is modified
    searchController.addListener(_filterDonations);
  }

// method for filtering donations
  void _filterDonations() {
    String query = searchController.text.toLowerCase();
    List<Donation> tempDonations = allDonations.where((donation) {
      return (selectedCategory == null ||
              donation.category == selectedCategory) &&
          (selectedStatus == null || donation.status == selectedStatus) &&
          donation.title.toLowerCase().contains(query);
    }).toList();

    setState(() {
      filteredDonations = tempDonations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF87CEEB), // Sky blue color
              ),
              child: Text(
                'Elbi\nDonation\nSystem',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text('Donation Drives'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return DonationDriveHomePage();
                }));
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Welcome!',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2F4852)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // summary card
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text("Donations This Week",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xFF2F4852))),
                subtitle: Text("10",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: const Color(0xFF2F4852))),
              ),
            ),
            const SizedBox(height: 10),
            // search bar
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search Donation',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // filter - status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedStatus,
                          hint: const Text("Select Status"),
                          isExpanded: true,
                          items: [
                            'Pending',
                            'Confirmed',
                            'Scheduled for Pick Up',
                            'Completed',
                            'Cancelled'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedStatus = value;
                              _filterDonations();
                            });
                          },
                        ),
                      ),
                      // button to clear filter
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            selectedStatus = null;
                            _filterDonations();
                          });
                        },
                      ),
                      // filter - category
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedCategory,
                          hint: const Text("Select Category"),
                          isExpanded: true,
                          items: [
                            'Food',
                            'Clothes',
                            'Cash',
                            'Necessities',
                            'Others'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value;
                              _filterDonations();
                            });
                          },
                        ),
                      ),
                      // clear filter
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            selectedCategory = null;
                            _filterDonations();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // calls buildDonationList to display the donation list
            Expanded(
              flex: 3,
              child: buildDonationList(),
            ),
          ],
        ),
      ),
      // button for qr code scanner
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('QR Scanner Pressed');
          // open qr code scanner to scan qr code generated by donor
        },
        backgroundColor: const Color(0xFF2F4852),
        child: const Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
        ), // Icon for QR code scanner
      ),
    );
  }

// widget for summary card (content is temporary as of 5/11)
  // Widget buildSummaryCard() {
  //   return Card(
  //     margin: const EdgeInsets.all(8),
  //     child: Padding(
  //         padding: const EdgeInsets.all(5),
  //         child: Text("Donation Summary Here.")),
  //   );
  // }

// widget for viewing donation list
  Widget buildDonationList() {
    return ListView.builder(
      itemCount: filteredDonations.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(filteredDonations[index].title,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color(0xFF2F4852))),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF517C8D),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    filteredDonations[index].status,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(filteredDonations[index].donor,
                    style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xFF2F4852))),
                Text(filteredDonations[index].category,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xFF2F4852)))
              ],
            ),
            onTap: () {
              // will go to Donations page to view full info of donation
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return DonationScreen();
              }));
            },
          ),
        );
      },
    );
  }
}

// structure for Donation
class Donation {
  String title;
  String donor;
  String status;
  String category;

  Donation(
      {required this.title,
      required this.donor,
      required this.status,
      required this.category});
}

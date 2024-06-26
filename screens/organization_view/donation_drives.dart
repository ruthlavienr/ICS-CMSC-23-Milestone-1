// screen for the list of donation drives

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// structure for donation drive
class DonationDrive {
  final String name;
  final String place;
  final String category;
  final String description;
  final String imageUrl;

  DonationDrive(
      {required this.name,
      required this.place,
      required this.category,
      required this.description,
      required this.imageUrl});
}

final List<DonationDrive> donationDrives = [
  // sample info
  DonationDrive(
    name: 'Help Orphans',
    place: 'New York',
    category: 'General',
    description: 'Support the local orphanage.',
    imageUrl: 'assets/sample-pic.jpg',
  ),
  DonationDrive(
    name: 'Feed the Hungry',
    place: 'California',
    category: 'Health',
    description: 'Provide meals for those in need.',
    imageUrl: 'assets/sample-pic.jpg',
  ),
  DonationDrive(
    name: 'Clean the Beach',
    place: 'Florida',
    category: 'Environment',
    description: 'Help us clean the local beaches.',
    imageUrl: 'assets/sample-pic.jpg',
  ),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elbi Donation System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DonationDriveHomePage(),
    );
  }
}

class DonationDriveHomePage extends StatefulWidget {
  @override
  _DonationDriveHomePageState createState() => _DonationDriveHomePageState();
}

class _DonationDriveHomePageState extends State<DonationDriveHomePage> {
  // controller for search
  late List<DonationDrive> filteredDonationDrives;
  late TextEditingController _searchController;

  // changing state when searching
  @override
  void initState() {
    super.initState();
    filteredDonationDrives = donationDrives;
    _searchController = TextEditingController();
  }

  // dispose controllers
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // method for searching
  void _filterDonationDrives(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDonationDrives = donationDrives;
      } else {
        filteredDonationDrives = donationDrives
            .where((drive) =>
                drive.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF87CEEB),
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
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Donation Drives'),
              onTap: () {
                Navigator.pop(context);
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
        title: Text(
          "Donation Drives",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2F4852)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // search bar
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search Drives',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _filterDonationDrives,
                ),
              ])),
          // donation drives
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: filteredDonationDrives.length,
                itemBuilder: (context, index) {
                  // card for donation drives
                  return Card(
                    margin: EdgeInsets.all(10),
                    color: Color(0xFF50C0ED),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // photo in the card
                        Container(
                          height: 150,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.asset(
                              filteredDonationDrives[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // text in the card
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(filteredDonationDrives[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18)),
                              Text(filteredDonationDrives[index].category,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              Text(filteredDonationDrives[index].place),
                              Text(filteredDonationDrives[index].description),
                            ],
                          ),
                        ),
                        // donate now button
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFF2F4852),
                              backgroundColor: Colors.white,
                              minimumSize: Size(double.infinity, 50),
                            ),
                            child: Text('Donate Now',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              print(
                                  'Donate to ${filteredDonationDrives[index].name}');
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      // button to add donation drive
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // go to create donation drive
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF2F4852),
      ),
    );
  }
}

// screen for the view donors for admin
// still need to edit UI

import 'package:flutter/material.dart';

class DonorListPage extends StatelessWidget {
  final List<Donor> donors = [
    Donor(name: 'Donor Sample 1', imageUrl: 'assets/org-logo.jpg'),
    Donor(name: 'Donor Sample 2', imageUrl: 'assets/org-logo.jpg'),
    Donor(name: 'Donor Sample 3', imageUrl: 'assets/org-logo.jpg'),
    Donor(name: 'Donor Sample 4', imageUrl: 'assets/org-logo.jpg'),
    Donor(name: 'Donor Sample 5', imageUrl: 'assets/org-logo.jpg'),
    Donor(name: 'Donor Sample 6', imageUrl: 'assets/org-logo.jpg'),
    Donor(name: 'Donor Sample 7', imageUrl: 'assets/org-logo.jpg'),
    Donor(name: 'Donor Sample 8', imageUrl: 'assets/org-logo.jpg'),
    Donor(name: 'Donor Sample 9', imageUrl: 'assets/org-logo.jpg'),
    Donor(name: 'Donor Sample 10', imageUrl: 'assets/org-logo.jpg'),
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
      //         title: const Text('View Orgs and Donations'),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: const Text('Approve Sign-Up'),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: const Text('View All Donors'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Donor List',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage("assets/admin-icon.png"),
              backgroundColor: Color(0xFF87CEEB),
            ),
            onPressed: () {
              // print('Profile button pressed');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Admin Profile'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: donors.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
              color: const Color(0xFF87CEEB),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(donors[index].imageUrl),
                ),
                title: Text(
                  donors[index].name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Info for ${donors[index].name}'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: 12.0), // spacing between tiles
      ),
    );
  }
}

class Donor {
  final String name;
  final String imageUrl;

  Donor({required this.name, required this.imageUrl});
}

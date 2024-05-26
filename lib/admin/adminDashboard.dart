import 'package:flutter/material.dart';
import 'package:my_app/admin/approve_signup.dart';
import 'package:my_app/admin/viewAllDonors_Leila.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Homepage',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2F4852),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Welcome, Admin!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F4852),
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            // card 1
            SizedBox(
              height: 140.0,
              child: AdminDashboardCard(
                title: 'View All Organizations\nand Donations',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonorListPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0), // space between
            // card 2
            SizedBox(
              height: 140.0,
              child: AdminDashboardCard(
                title: 'Approve Organizations',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpLogs()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0), // space between
            // card 3
            SizedBox(
              height: 140.0,
              child: AdminDashboardCard(
                title: 'View All Donors',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonorListPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// UI of cards
class AdminDashboardCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AdminDashboardCard(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: const Color(0xFF87CEEB),
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

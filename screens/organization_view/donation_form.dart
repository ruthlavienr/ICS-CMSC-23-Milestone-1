import 'package:flutter/material.dart';

class DonationForm extends StatefulWidget {
  const DonationForm({super.key});

  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Donation Form')),
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Item category",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.list),
                    Text(
                      "Category",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                    )
                  ], // will be changed to a dropdown menu
                ),
                Row(
                  children: [
                    Text(
                      "Mode of Delivery",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.motorcycle),
                    Text(
                      "Mode",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                    )
                  ], // will be changed to a dropdown menu
                ),
                Row(
                  children: [
                    Text(
                      "Weight (kg)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.book),
                    Text(
                      "kg",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                    )
                  ], // will be changed to a dropdown menu
                ),
                Row(
                  children: [
                    Text(
                      "Photo of Donation",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(31, 159, 159, 159))),
                ),
                Row(
                  children: [
                    Text(
                      "Delivery Date and Time",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    Text(
                      "01/01/24 12:00",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.house),
                    Text(
                      "Address",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Contact Number",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.phone),
                    Text(
                      "09177112470",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Donation Status",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [DropdownMenu(dropdownMenuEntries: [])],
                )
              ],
            )),
      ),
    );
  }
}

// screen for when creating a new donation drive

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DonationDriveForm(),
    );
  }
}

class DonationDriveForm extends StatefulWidget {
  @override
  _DonationDriveFormState createState() => _DonationDriveFormState();
}

class _DonationDriveFormState extends State<DonationDriveForm> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;
  String? location;
  double? targetAmount;
  String? category;
  List<String> categories = [
    'Education',
    'Health',
    'Environment',
    'Community Support',
    'Animal Welfare',
    'Others'
  ];

  // sample only; modal when successfully created
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Successfully created!',
            style: TextStyle(fontSize: 18.0),
          ),
          // content: Text(
          //     'Title: $title\nDescription: $description\nTarget Amount: $targetAmount\nLocation: $location\nCategory: $category'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Donation Drives",
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
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20), // for spacing
                // placeholder for graphics, so that it won't look empty
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/sample-pic.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 30),
                // field for name of donation drive
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name of Donation Drive',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.handshake),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name.';
                    }
                    return null;
                  },
                  onSaved: (value) => title = value,
                ),
                SizedBox(height: 20),
                // drop down for the category of donation drive
                DropdownButtonFormField<String>(
                  value: category,
                  decoration: InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.category),
                  ),
                  items: categories.map((String category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      category = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a category' : null,
                  onSaved: (value) => category = value,
                ),
                SizedBox(height: 20),
                // field for location of donation drive
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the location';
                    }
                    return null;
                  },
                  onSaved: (value) => location = value,
                ),
                SizedBox(height: 20),
                // field for description of donation drive
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.description),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) => description = value,
                ),
                // field for target of donation drive
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Target Amount', border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(12),
                // ),),
                //   keyboardType: TextInputType.number,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter a target amount';
                //     }
                //     if (double.tryParse(value) == null) {
                //       return 'Please enter a valid number';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) => targetAmount = double.parse(value!),
                // ),
                SizedBox(height: 30),
                // save and cancel buttons
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('CANCEL',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xFF2F4852))),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD9D9D9),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _submitForm,
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
      ),
    );
  }
}

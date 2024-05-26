//Donate Screen (For Milestone1)

import 'package:flutter/material.dart'; //library for widgets

class DonateScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 10),
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Color(0xFF87CEEB),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  //Drop Shadow Effect
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 3,
                  offset: const Offset(0, 1), //below it
                ),
              ],
            ),
          ),
          const Text(
            'Organization Name',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(3.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          height: 1.0, //bottom line height
        ),
      ),
    );
  }

  @override
  Size
      get preferredSize => //getter that returns the preferred size of the widget
          Size.fromHeight(kToolbarHeight + 1); // Adding 1 for the line
}

class DonatePage extends StatefulWidget {
  //Initial Route
  const DonatePage({Key? key}) : super(key: key);

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  //State Fields:
  //pickip/drop-off times
  String? _pickupDropOff;
  String? _pickupTime;
  String? _dropoffTime;

  //For the weight input
  TextEditingController weightController = TextEditingController();
  TextEditingController pickUpAddressController = TextEditingController();
  TextEditingController pickUpContactNoController = TextEditingController();

  //for checkbuttons
  bool _foodChecked = false;
  bool _clothesChecked = false;
  bool _cashChecked = false;
  bool _necessitiesChecked = false;
  bool _othersChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonateScreenAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Item Category',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600, //semibold
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              //checkboxes
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // to take the 50% space on the left
                  child: Column(
                    children: [
                      buildCategoryItem('Food', _foodChecked, (value) {
                        setState(() {
                          _foodChecked = value!;
                        });
                      }),
                      buildCategoryItem('Clothes', _clothesChecked, (value) {
                        setState(() {
                          _clothesChecked = value!;
                        });
                      }),
                      buildCategoryItem('Cash', _cashChecked, (value) {
                        setState(() {
                          _cashChecked = value!;
                        });
                      }),
                    ],
                  ),
                ),
                Expanded(
                  // to take the 50% space on the right
                  child: Column(
                    children: [
                      buildCategoryItem('Necessities', _necessitiesChecked,
                          (value) {
                        setState(() {
                          _necessitiesChecked = value!;
                        });
                      }),
                      buildCategoryItem('Others', _othersChecked, (value) {
                        setState(() {
                          _othersChecked = value!;
                        });
                      }),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Delivery Method',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'pickup',
                  groupValue: _pickupDropOff,
                  onChanged: (value) {
                    setState(() {
                      _pickupDropOff = value;
                    });
                  },
                ),
                const Text(
                  'Pick Up',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 50),
                Radio<String>(
                  value: 'dropoff',
                  groupValue: _pickupDropOff,
                  onChanged: (value) {
                    setState(() {
                      _pickupDropOff = value;
                    });
                  },
                ),
                const Text(
                  'Drop-off',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Weight (kg)',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            InputBox(
              labelText: 'Weight',
              icon: Icons.monitor_weight,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: weightController,
              border: const UnderlineInputBorder(),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 292,
                    height: 106,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF8FC), // Fill color
                      boxShadow: [
                        BoxShadow(
                          //Drop Shadow Effect
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    // image box widget goes here
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF87CEEB),
                      minimumSize: const Size(292, 36),
                    ),
                    child: const Text(
                      'Upload Photo',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF), // Set font color to 2F4852
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Pick Up',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      //Pick Up Time
                      value: _pickupTime,
                      onChanged: (String? newValue) {
                        setState(() {
                          _pickupTime = newValue;
                        });
                      },
                      items: <String>[
                        '9:00 AM',
                        '10:00 AM',
                        '11:00 AM',
                        '12:00 PM',
                        '1:00 PM',
                        '2:00 PM',
                        '3:00 PM',
                        '4:00 PM'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Drop-off',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      //Drop-off Time
                      value: _dropoffTime,
                      onChanged: (String? newValue) {
                        setState(() {
                          _dropoffTime = newValue;
                        });
                      },
                      items: <String>[
                        '9:00 AM',
                        '10:00 AM',
                        '11:00 AM',
                        '12:00 PM',
                        '1:00 PM',
                        '2:00 PM',
                        '3:00 PM',
                        '4:00 PM'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            InputBox(
              labelText: 'Pick Up Address',
              keyboardType: TextInputType.text,
              controller: pickUpAddressController,
              border: const OutlineInputBorder(),
            ),
            const SizedBox(height: 20),
            InputBox(
              labelText: 'Pick Up Contact no',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              controller: pickUpContactNoController,
              border: const OutlineInputBorder(),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 292,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF87CEEB), // Change background color
                    minimumSize:
                        const Size(292, 36), // Keep the same minimum size
                  ),
                  child: const Text(
                    'DONATE',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF), // Set font color to 87CEEB
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Input Box Widget

class InputBox extends StatelessWidget {
  final String labelText;
  final IconData? icon;
  final Color iconColor = const Color(0xFF87CEEB); // Add this property
  final TextInputType keyboardType;
  final TextEditingController controller;
  final InputBorder border;

  const InputBox({
    Key? key,
    required this.labelText,
    this.icon,
    required this.keyboardType,
    required this.controller,
    required this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: iconColor,
                )
              : null,
          border: border,
        ),
      ),
    );
  }
}

// Check Box Widget
Widget buildCategoryItem(
    String title, bool isChecked, ValueChanged<bool?> onChanged) {
  return Padding(
    padding: const EdgeInsets.only(left: 50.0),
    child: Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

// screen for sign up of user

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: SignUpPage(),
    theme: ThemeData(
      primaryColor: Color(0xFF50C0ED),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: Color(0xFF50C0ED)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF50C0ED)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ));
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool isOrganization = false;

  // controllers for the text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController organizationNameController = TextEditingController();
  List<PlatformFile> proofsOfLegitimacy = [];

  // for file upload (does not use firebase yet); can upload multiple files
  Future<void> pickProofOfLegitimacy() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        proofsOfLegitimacy.addAll(result.files);
      });
    }
  }

  // for removing/deleting uploaded file
  void removeProofOfLegitimacy(PlatformFile file) {
    setState(() {
      proofsOfLegitimacy.remove(file);
    });
  }

  // widget for the list view of uploaded proof (in case of multiple uploads)
  Widget buildProofList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: proofsOfLegitimacy.length,
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (context, index) {
        final file = proofsOfLegitimacy[index];
        return ListTile(
          title: Text(file.name),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => removeProofOfLegitimacy(file),
          ),
        );
      },
    );
  }

  // widget for the form fields
  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon,
      {bool obscureText = false, bool isPassword = false}) {
    // obscureText is for hiding the password

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText, // controlled by the state
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: isPassword // icon for password visibility
              ? IconButton(
                  // conditional
                  icon: Icon(obscureText
                      ? Icons.visibility_off
                      : Icons.visibility), // toggle based on state
                  onPressed: () {
                    setState(() {
                      _passwordVisible =
                          !_passwordVisible; // toggle state on press
                    });
                  },
                )
              : null,
          labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 16),
          ),
        ),
        style: GoogleFonts.poppins(
          textStyle: TextStyle(fontSize: 16),
        ),
        // temporary validator
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
      ),
    );
  }

// dispose controllers
  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    addressController.dispose();
    contactNumberController.dispose();
    organizationNameController.dispose();
    super.dispose();
  }

// build widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Sign Up'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              Text(
                "Let's get you started!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF50C0ED)),
                ),
              ),
              SizedBox(height: 50), // temporary for spacings
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField('Name', nameController, Icons.person),
                    _buildTextField(
                        'Username', usernameController, Icons.account_circle),
                    _buildTextField('Address', addressController, Icons.home),
                    _buildTextField(
                        'Contact Number', contactNumberController, Icons.phone),
                    _buildTextField('Password', passwordController, Icons.lock,
                        obscureText: !_passwordVisible, // use state here
                        isPassword: true // indicates this is a password field
                        ),
                    // if the user wants to register an organization, additional fields needs to be filled out
                    SwitchListTile(
                        title: Text(
                          'Register as an organization?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w500)),
                        ),
                        value: isOrganization,
                        onChanged: (bool value) {
                          setState(() {
                            isOrganization = value;
                          });
                        },
                        activeTrackColor: Theme.of(context).primaryColor),
                    SizedBox(height: 10),
                    // if true, show additional fields - organization name
                    if (isOrganization)
                      _buildTextField('Organization Name',
                          organizationNameController, Icons.business),
                    // if true, show additional fields - upload files for proof of legitimacy
                    if (isOrganization)
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: pickProofOfLegitimacy,
                              child: Text('Upload Proof of Legitimacy',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF50C0ED)),
                                  )),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              )),
                          SizedBox(height: 10),
                          buildProofList(),
                        ],
                      ),
                    SizedBox(height: 10),
                    // button for sign up
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // handle submission using controllers directly
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Color(0xFF50C0ED)),
                    ),
                    // if user is in the sign up page but already has an account, they can go to sign in/log in page through the textlink
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                  color: Color(0xFF350C0ED),
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // go to sign in page
                                },
                            ),
                          ],
                        ),
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
}

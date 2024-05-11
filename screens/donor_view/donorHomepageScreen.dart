import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Homepage (Donor's View)",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Organizations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF87CEEB),
        title: Text(widget.title, style: const TextStyle(fontFamily: 'Poppins', fontWeight:FontWeight.w600)),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: const Color(0xFF87CEEB),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        'bldg1.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0, -1),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                                child: Text(
                                                  'Organization Name',
                                                  style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Text(
                                                'LOCATION',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          Color(0xFF517C8D),
                                                      fontSize: 10,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 3),
                                              child: Container(
                                                width: 215,
                                                height: 3,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ),
                                            const Expanded(
                                              child: Text(
                                                'Short description of the organization',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 4, 8, 8),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF))),
                                        child: const Text('Donate now',
                                          style: TextStyle(
                                            color: Color(0xFF2F4852),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: const Color(0xFF87CEEB),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        'bldg2.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0, -1),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                                child: Text(
                                                  'Organization Name',
                                                  style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Text(
                                                'LOCATION',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          Color(0xFF517C8D),
                                                      fontSize: 10,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 3),
                                              child: Container(
                                                width: 215,
                                                height: 3,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ),
                                            const Expanded(
                                              child: Text(
                                                'Short description of the organization',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 4, 8, 8),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF))),
                                        child: const Text('Donate now',
                                          style: TextStyle(
                                            color: Color(0xFF2F4852),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: const Color(0xFF87CEEB),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        'bldg3.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0, -1),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                                child: Text(
                                                  'Organization Name',
                                                  style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Text(
                                                'LOCATION',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          Color(0xFF517C8D),
                                                      fontSize: 10,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 3),
                                              child: Container(
                                                width: 215,
                                                height: 3,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ),
                                            const Expanded(
                                              child: Text(
                                                'Short description of the organization',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 4, 8, 8),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF))),
                                        child: const Text('Donate now',
                                          style: TextStyle(
                                            color: Color(0xFF2F4852),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: const Color(0xFF87CEEB),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        'bldg4.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0, -1),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                                child: Text(
                                                  'Organization Name',
                                                  style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Text(
                                                'LOCATION',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          Color(0xFF517C8D),
                                                      fontSize: 10,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 3),
                                              child: Container(
                                                width: 215,
                                                height: 3,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ),
                                            const Expanded(
                                              child: Text(
                                                'Short description of the organization',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 8),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF))),
                                        child: const Text('Donate now',
                                          style: TextStyle(
                                            color: Color(0xFF2F4852),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ), 
            ],
          ),
        ),
      ),
    );          
  }
}

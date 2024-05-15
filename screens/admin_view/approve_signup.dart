import 'package:flutter/material.dart';

class SignUpLogs extends StatefulWidget {
  const SignUpLogs({super.key});

  @override
  State<SignUpLogs> createState() => _SignUpLogsState();
}

class _SignUpLogsState extends State<SignUpLogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Logs'),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Organization 3"),
                Spacer(),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Approve'),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Disapprove'),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text("Organization 4"),
                Spacer(),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Approve'),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Disapprove'),
                )
              ],
            ),
            SizedBox(
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Organization 3",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Organization 2",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Organization 1",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Date and Time",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "13:54 05-06-24",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "13:54 05-05-24",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "13:54 05-05-24",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Status",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Pending",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Disapproved",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Approved",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

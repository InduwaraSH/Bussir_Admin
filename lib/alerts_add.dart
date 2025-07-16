import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AlertUpdate extends StatefulWidget {
  const AlertUpdate({super.key});

  @override
  State<AlertUpdate> createState() => _AlertUpdateState();
}

class _AlertUpdateState extends State<AlertUpdate> {
  final alert_title = TextEditingController();
  final alert_description = TextEditingController();

  late DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.ref().child(
      'Alerts',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert add')),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            TextField(
              controller: alert_title,
              decoration: InputDecoration(labelText: 'Alert_Title'),
            ),
            TextField(
              controller: alert_description,
              decoration: InputDecoration(labelText: 'Alert_Description'),
            ),
            
            ElevatedButton(
              onPressed: () {
                Map<String, String> alertData = {
                  'Alert_Title': alert_title.text,
                  'Alert_Description': alert_description.text,
                
                };
                databaseReference
                    .push()
                    .set(alertData)
                    .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Data Updated Successfully')),
                      );
                    })
                    .catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to update data: $error'),
                        ),
                      );
                    });
              },
              child: Text('Update Bus Time Table'),
            ),
          ],
        ),
      ),
    );
  }
}

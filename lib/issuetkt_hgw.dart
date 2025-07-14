import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class IssuetktHgw extends StatefulWidget {
  const IssuetktHgw({super.key});

  @override
  State<IssuetktHgw> createState() => _IssuetktHgwState();
}

class _IssuetktHgwState extends State<IssuetktHgw> {
  final busNoController = TextEditingController();
  final departureTimeController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final dateController = TextEditingController();
  final passengerIdController = TextEditingController();

  late DatabaseReference databaseReference_3;

  @override
  void initState() {
    super.initState();
    databaseReference_3 = FirebaseDatabase.instance.ref().child(
      'TicketIssue_Hgw',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Issue Ticket Hgw')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: busNoController,
              decoration: InputDecoration(labelText: 'Bus Number'),
            ),

            TextField(
              controller: departureTimeController,
              decoration: InputDecoration(labelText: 'Departure Time'),
            ),
            TextField(
              controller: fromController,
              decoration: InputDecoration(labelText: 'From'),
            ),
            TextField(
              controller: toController,
              decoration: InputDecoration(labelText: 'To'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: passengerIdController,
              decoration: InputDecoration(labelText: 'Passenger ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Map<String, String> ticketdata = {
                  'Bus Number': busNoController.text,
                  'Departure Time': departureTimeController.text,
                  'From': fromController.text,
                  'To': toController.text,
                  'Date': dateController.text,
                  'Passenger ID': passengerIdController.text,
                };
                databaseReference_3
                    .push()
                    .set(ticketdata)
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
              child: Text('Issue Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}

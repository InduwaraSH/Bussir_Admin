import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Normal_bustime_IC extends StatefulWidget {
  const Normal_bustime_IC({super.key});

  @override
  State<Normal_bustime_IC> createState() => _Normal_bustime_ICState();
}

class _Normal_bustime_ICState extends State<Normal_bustime_IC> {
  final busStartLocationController = TextEditingController();
  final busEndLocationController = TextEditingController();
  final busStartTimeController = TextEditingController();
  final busNmberController = TextEditingController();
  final busdriverNameController = TextEditingController();
  final busTPnumberController = TextEditingController();

  late DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.ref().child(
      'NormalBusTimeTable_IC',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Normal Bus Time Table Update')),
      body: Column(
        children: [
          TextField(
            controller: busStartLocationController,
            decoration: InputDecoration(labelText: 'Start Location'),
          ),
          TextField(
            controller: busEndLocationController,
            decoration: InputDecoration(labelText: 'End Location'),
          ),
          TextField(
            controller: busStartTimeController,
            decoration: InputDecoration(labelText: 'Start Time'),
          ),
          TextField(
            controller: busNmberController,
            decoration: InputDecoration(labelText: 'Bus Number'),
          ),
          TextField(
            controller: busdriverNameController,
            decoration: InputDecoration(labelText: 'Driver Name'),
          ),
          TextField(
            controller: busTPnumberController,
            decoration: InputDecoration(labelText: 'Driver TP Number'),
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, String> normalbustimetableIc = {
                'Start Location': busStartLocationController.text,
                'End Location': busEndLocationController.text,
                'Start Time': busStartTimeController.text,
                'Bus Number': busNmberController.text,
                'Driver Name': busdriverNameController.text,
                'Driver TP Number': busTPnumberController.text,
              };
              databaseReference
                  .push()
                  .set(normalbustimetableIc)
                  .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Data Updated Successfully')),
                    );
                  })
                  .catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update data: $error')),
                    );
                  });
            },
            child: Text('Update Bus Time Table'),
          ),
        ],
      ),
    );
  }
}

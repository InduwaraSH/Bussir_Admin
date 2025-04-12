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
            decoration: InputDecoration(labelText: 'Bus Start Location'),
          ),
          TextField(
            controller: busEndLocationController,
            decoration: InputDecoration(labelText: 'Bus End Location'),
          ),
          TextField(
            controller: busStartTimeController,
            decoration: InputDecoration(labelText: 'Bus Start Time'),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     String startLocation = busStartLocationController.text;
          //     String endLocation = busEndLocationController.text;
          //     String startTime = busStartTimeController.text;
          //   },
          //   child: Text('Add Bus Time'),
          // ),
        ],
      ),
    );
  }
}

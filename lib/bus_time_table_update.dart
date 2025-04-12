import 'package:bussir_admin/Normal_bus_time_IC_update.dart';
import 'package:flutter/material.dart';

class Bus_time_t_update extends StatelessWidget {
  const Bus_time_t_update({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bus Time Table Update')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Normal_bustime_IC(),
                  ),
                );
              },
              child: const Text('Normal Bus Time Table(IC)'),
            ),
          ],
        ),
      ),
    );
  }
}

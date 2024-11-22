import 'package:flutter/material.dart';

class AvailabilityScreen extends StatefulWidget {
  @override
  _AvailabilityScreenState createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  bool isSimpleStatus = true;
  bool isAvailable = true;
  bool receiveOffersOffline = false;
  String unavailabilityReason = '';
  List<String> selectedDays = [];

  void toggleDay(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Availability"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile(
              title: Text("Simple status", style: TextStyle(fontSize: 18)),
              value: true,
              groupValue: isSimpleStatus,
              onChanged: (bool? value) {
                setState(() {
                  isSimpleStatus = value ?? true;
                });
              },
            ),
            if (isSimpleStatus) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Available", style: TextStyle(fontSize: 18)),
                  Switch(
                    value: isAvailable,
                    onChanged: (bool value) {
                      setState(() {
                        isAvailable = value;
                      });
                    },
                  ),
                ],
              ),
              if (!isAvailable)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        unavailabilityReason = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Reason for unavailability",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
            ],
            SizedBox(height: 20),
            RadioListTile(
              title: Text("Schedule status", style: TextStyle(fontSize: 18)),
              value: false,
              groupValue: isSimpleStatus,
              onChanged: (bool? value) {
                setState(() {
                  isSimpleStatus = value ?? false;
                });
              },
            ),
            if (!isSimpleStatus)
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  'Sunday',
                  'Monday',
                  'Tuesday',
                  'Wednesday',
                  'Thursday',
                  'Friday',
                  'Saturday'
                ]
                    .map((day) => GestureDetector(
                          onTap: () => toggleDay(day),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: selectedDays.contains(day)
                                  ? Colors.green
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              day,
                              style: TextStyle(
                                color: selectedDays.contains(day)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Receive offers offline", style: TextStyle(fontSize: 18)),
                Switch(
                  value: receiveOffersOffline,
                  onChanged: (bool value) {
                    setState(() {
                      receiveOffersOffline = value;
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text("Save", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

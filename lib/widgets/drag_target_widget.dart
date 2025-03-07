import 'package:flutter/material.dart';

class DragTargetWidget extends StatelessWidget {
  final Function(String, String, DateTime) onPlanDropped;

  DragTargetWidget({required this.onPlanDropped});

  @override
  Widget build(BuildContext context) {
    return DragTarget<Map<String, dynamic>>(
      onAccept: (data) {
        onPlanDropped(data['name'], data['description'], data['date']);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: 100,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Center(
            child: Text(
              "Drag & Drop Plan Here",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}

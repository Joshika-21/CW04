import 'package:flutter/material.dart';
import '../models/plan.dart';

class PlanItem extends StatelessWidget {
  final Plan plan;
  final int index;
  final Function(int) toggleCompletion;
  final Function(int, String, String) updatePlan;
  final Function(int) deletePlan;

  PlanItem({
    required this.plan,
    required this.index,
    required this.toggleCompletion,
    required this.updatePlan,
    required this.deletePlan,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(plan.name),
      background: Container(
        color: Colors.green,
        child: Icon(Icons.check, color: Colors.white),
      ),
      onDismissed: (_) => toggleCompletion(index),
      child: GestureDetector(
        onDoubleTap: () => deletePlan(index),
        onLongPress: () {
        },
        child: Card(
          child: ListTile(
            title: Text(
              plan.name,
              style: TextStyle(
                decoration:
                    plan.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(plan.description),
          ),
        ),
      ),
    );
  }
}

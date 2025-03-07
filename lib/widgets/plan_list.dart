import 'package:flutter/material.dart';
import '../models/plan.dart';
import './plan_item.dart';

class PlanList extends StatelessWidget {
  final List<Plan> plans;
  final Function(int) toggleCompletion;
  final Function(int, String, String) updatePlan;
  final Function(int) deletePlan;

  PlanList({
    required this.plans,
    required this.toggleCompletion,
    required this.updatePlan,
    required this.deletePlan,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (ctx, index) {
        return PlanItem(
          plan: plans[index],
          index: index,
          toggleCompletion: toggleCompletion,
          updatePlan: updatePlan,
          deletePlan: deletePlan,
        );
      },
    );
  }
}

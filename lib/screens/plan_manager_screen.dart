import 'package:flutter/material.dart';
import '../models/plan.dart';
import '../widgets/plan_list.dart';
import '../widgets/create_plan_modal.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/drag_target_widget.dart';

class PlanManagerScreen extends StatefulWidget {
  @override
  _PlanManagerScreenState createState() => _PlanManagerScreenState();
}

class _PlanManagerScreenState extends State<PlanManagerScreen> {
  List<Plan> plans = [];

  void _addPlan(String name, String description, DateTime date) {
    setState(() {
      plans.add(Plan(name: name, description: description, date: date));
    });
  }

  void _openCreatePlanModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      builder: (_) {
        return CreatePlanModal(addPlan: _addPlan);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adoption & Travel Plans")),
      body: SafeArea(
        child: Column(
          children: [
            DragTargetWidget(onPlanDropped: _addPlan),
            Expanded(
              child:
                  plans.isEmpty
                      ? Center(
                        child: Text(
                          "No plans added. Tap + to create a new plan!",
                        ),
                      )
                      : PlanList(
                        plans: plans,
                        toggleCompletion: (index) {
                          setState(() {
                            plans[index].isCompleted =
                                !plans[index].isCompleted;
                          });
                        },
                        updatePlan: (index, newName, newDescription) {
                          setState(() {
                            plans[index].name = newName;
                            plans[index].description = newDescription;
                          });
                        },
                        deletePlan: (index) {
                          setState(() {
                            plans.removeAt(index);
                          });
                        },
                      ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: CalendarWidget(plans: plans),
            ), 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openCreatePlanModal(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

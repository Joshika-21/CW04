import 'package:flutter/material.dart';
import 'screens/plan_manager_screen.dart';

void main() {
  runApp(AdoptionTravelPlannerApp());
}

class AdoptionTravelPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Adoption & Travel Planner",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SafeArea(
        child: PlanManagerScreen(),
      ), 
    );
  }
}

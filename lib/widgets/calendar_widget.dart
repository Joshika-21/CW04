import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/plan.dart';

class CalendarWidget extends StatefulWidget {
  final List<Plan> plans;

  CalendarWidget({required this.plans});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: _selectedDate,
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDate = selectedDay;
            });
          },
          eventLoader: (day) {
            return widget.plans
                .where(
                  (plan) =>
                      plan.date.year == day.year &&
                      plan.date.month == day.month &&
                      plan.date.day == day.day,
                )
                .toList();
          },
        ),
        Expanded(
          child:
              widget.plans.isEmpty
                  ? Center(child: Text("No plans scheduled for this date."))
                  : ListView(
                    children:
                        widget.plans
                            .where(
                              (plan) =>
                                  plan.date.year == _selectedDate.year &&
                                  plan.date.month == _selectedDate.month &&
                                  plan.date.day == _selectedDate.day,
                            )
                            .map(
                              (plan) => ListTile(
                                title: Text(plan.name),
                                subtitle: Text(plan.description),
                                trailing:
                                    plan.isCompleted
                                        ? Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                        : Icon(
                                          Icons.radio_button_unchecked,
                                          color: Colors.red,
                                        ),
                              ),
                            )
                            .toList(),
                  ),
        ),
      ],
    );
  }
}

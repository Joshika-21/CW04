import 'package:flutter/material.dart';

class CreatePlanModal extends StatefulWidget {
  final Function(String, String, DateTime) addPlan;

  CreatePlanModal({required this.addPlan});

  @override
  _CreatePlanModalState createState() => _CreatePlanModalState();
}

class _CreatePlanModalState extends State<CreatePlanModal> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final enteredName = _nameController.text;
    final enteredDesc = _descController.text;

    if (enteredName.isEmpty || enteredDesc.isEmpty) {
      return;
    }

    widget.addPlan(enteredName, enteredDesc, _selectedDate);
    Navigator.of(context).pop();
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom:
              MediaQuery.of(
                context,
              ).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Plan Name"),
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: "Plan Description"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Selected Date: ${_selectedDate.toLocal()}".split(' ')[0]),
                ElevatedButton(onPressed: _pickDate, child: Text("Pick Date")),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _submitData, child: Text("Add Plan")),
          ],
        ),
      ),
    );
  }
}

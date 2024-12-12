import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter by Date Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const DateFilterPopup();
              },
            );
          },
          child: const Text("Show Date Filter"),
        ),
      ),
    );
  }
}

class DateFilterPopup extends StatefulWidget {
  const DateFilterPopup({super.key});

  @override
  State<DateFilterPopup> createState() => _DateFilterPopupState();
}

class _DateFilterPopupState extends State<DateFilterPopup> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  String? _errorText;

  void _selectDate(BuildContext context, TextEditingController controller, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    setState(() {
      if (isStartDate) {
        _startDate = pickedDate;
      } else {
        _endDate = pickedDate;
      }
      controller.text = "${pickedDate!.year}-${pickedDate!.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      _validateDates();
    });
    }

  void _validateDates() {
    if (_startDate != null && _endDate != null && _startDate!.isAfter(_endDate!)) {
      setState(() {
        _errorText = "Start date cannot be later than end date.";
      });
    } else {
      setState(() {
        _errorText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: const Color(0xFF8DA285),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Filtering by Date :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _startDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Start Date",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: _errorText != null ? Colors.red : Colors.grey,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context, _startDateController, true),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _endDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "End Date",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: _errorText != null ? Colors.red : Colors.grey,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context, _endDateController, false),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (_errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _errorText!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_errorText == null) {
                      // Add your filter logic here
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Apply"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

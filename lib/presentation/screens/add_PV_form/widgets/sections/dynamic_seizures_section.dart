import 'package:flutter/material.dart';
import 'seizure_section.dart';
import 'package:cvms/domain/entities/pv/seizure.dart';

class DynamicSeizureSections extends StatefulWidget {
  final Function(List<Seizure>)
      onSeizuresUpdated; // Callback to send updated list back to the parent

  const DynamicSeizureSections({super.key, required this.onSeizuresUpdated});

  @override
  _DynamicSeizureSectionsState createState() => _DynamicSeizureSectionsState();
}

class _DynamicSeizureSectionsState extends State<DynamicSeizureSections> {
  final List<SeizureSection> _seizureSections = [];
  List<Seizure> seizures = [];

  @override
  void initState() {
    super.initState();
    _seizureSections
        .add(SeizureSection(onSeizureUpdated: _handleSeizureUpdated));
    seizures
        .add(Seizure(seizureAmount: '', seizureQuantity: '', seizedGoods: ''));
  }

  void _handleSeizureUpdated(Seizure seizure, int index) {
    setState(() {
      seizures[index] = seizure;
    });

    widget.onSeizuresUpdated(seizures); // Notify parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: _seizureSections.asMap().entries.map((entry) {
            final index = entry.key;
            final seizureSection = entry.value;
            return Column(
              children: [
                seizureSection,
                if (index > 0) // Show delete button for additional sections
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _seizureSections.removeAt(index);
                          seizures.removeAt(
                              index); // Remove corresponding seizure data
                          widget.onSeizuresUpdated(
                              seizures); // Notify parent widget
                        });
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ),
              ],
            );
          }).toList(),
        ),

        // Add new seizure section button
        Container(
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                _seizureSections.add(
                    SeizureSection(onSeizureUpdated: _handleSeizureUpdated));
                seizures.add(Seizure(
                    seizureAmount: '', seizureQuantity: '', seizedGoods: ''));
                widget.onSeizuresUpdated(
                    seizures); // Notify parent widget when a new seizure is added
              });
            },
            icon: const Icon(
              Icons.add,
              color: Color(0xFF545837), // Set the icon color to green
            ),
            label: const Text(
              "Add Seizure Section",
              style: TextStyle(color: Color(0xFF545837)),
            ),
          ),
        ),
      ],
    );
  }
}

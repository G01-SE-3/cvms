import 'package:flutter/material.dart';
import 'package:cvms/domain/usecases/offender/get_offender_by_rc.dart';
import 'package:cvms/presentation/controllers/offender/offender_controller.dart';
import 'package:cvms/data/repositories/rc/register_number_repository_impl.dart';
import 'package:cvms/data/datasources/rc/register_number_datasource.dart';

class RcField extends StatefulWidget {
  final TextEditingController controller;
  final Function(
          bool isRcExisting, String? error, Map<String, dynamic>? details)
      onRcChanged;

  const RcField({
    Key? key,
    required this.controller,
    required this.onRcChanged,
  }) : super(key: key);

  @override
  State<RcField> createState() => _RcFieldState();
}

class _RcFieldState extends State<RcField> {
  late final OffenderController offenderController;

  @override
  void initState() {
    super.initState();

    // Create an instance of RegisterNumberDataSource
    final registerNumberDataSource =
        RegisterNumberDataSource(); // Replace with your concrete implementation

    // Pass the data source to the repository implementation
    final registerNumberRepository =
        RegisterNumberRepositoryImpl(registerNumberDataSource);
    final getOffenderByRC = GetOffenderByRC(registerNumberRepository);
    offenderController = OffenderController(getOffenderByRC);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 800, // Adjust the width as needed
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: "Enter RC Number",
            labelStyle: const TextStyle(color: Colors.black54),
            filled: true,
            fillColor: const Color(0xFFDDE5CD),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.green),
            ),
          ),
          style: const TextStyle(color: Color(0xFF545837)),
          keyboardType: TextInputType.text,
          onChanged: (value) async {
            if (value.isNotEmpty) {
              // Call the fetchOffenderByRC method from the offenderController
              try {
                final offenderDetails =
                    await offenderController.fetchOffenderByRC(value);

                // Check if offender exists and determine the error message accordingly
                if (offenderDetails['isExisting'] == 1) {
                  widget.onRcChanged(true, null,
                      offenderDetails); // Pass offender details to the parent
                } else {
                  widget.onRcChanged(
                    false,
                    "Non-existing economic operator.",
                    null, // No offender details to pass
                  );
                }
              } catch (e) {
                widget.onRcChanged(
                  false,
                  "Error fetching offender data: ${e.toString()}",
                  null, // No offender details to pass on error
                );
              }
            } else {
              widget.onRcChanged(
                  false, null, null); // Reset when the input is empty
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/EconomicOperatorDetails/widgets/buildSidebar.dart';
import 'package:cvms/presentation/screens/EconomicOperatorDetails/widgets/buildHeaderSection.dart';
import 'package:cvms/presentation/screens/EconomicOperatorDetails/widgets/MainTabBar.dart';
class AddBusinessOffender extends StatefulWidget {
  const AddBusinessOffender({super.key});

  @override
  State<AddBusinessOffender> createState() => _AddBusinessOffenderState();
}

class _AddBusinessOffenderState extends State<AddBusinessOffender> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _birthCertificateController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _motherSurnameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _businessAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Row(
          children: [
            // Sidebar Menu
            buildSidebar(),

            // Main Content wrapped in a scrollable widget
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeaderSection(),
                    const Divider(color: Colors.grey),
                    const MainTabBar(),
                    const SizedBox(height: 15),
                    const Text("Add Individual Offender Informations",style: TextStyle(fontSize: 25),),
                    
                    _buildForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildForm() {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensures the form's size fits its content
          children: [
            _buildTextField('Name', _nameController),
            _buildTextField('Surname', _surnameController),
            _buildTextField('Date & Place of Birth', _dobController),
            _buildTextField('Birth Certificate Number', _birthCertificateController),
            _buildTextField("Mother's Name", _motherNameController),
            _buildTextField("Mother's Surname", _motherSurnameController),
            _buildTextField("Father's Name", _fatherNameController),
            _buildTextField('Address', _addressController),
            _buildTextField('Business Address', _businessAddressController),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF306238),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Individual Offender details added successfully.')),
                  );
                }
              },
              child: const Text('Add', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildTextField(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: SizedBox(
      width: 800, // Adjust the width as needed
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    ),
  );
}


  @override
  void dispose() {
    _businessNameController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _dobController.dispose();
    _birthCertificateController.dispose();
    _motherNameController.dispose();
    _motherSurnameController.dispose();
    _fatherNameController.dispose();
    _addressController.dispose();
    _businessAddressController.dispose();
    super.dispose();
  }
}


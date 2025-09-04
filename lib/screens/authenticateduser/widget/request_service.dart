import 'package:flutter/material.dart';
import 'package:fumigation_app/screens/authenticateduser/widget/checkout_page.dart';
import 'package:fumigation_app/utils/colors.dart';
import 'package:fumigation_app/utils/typography.dart';
import 'package:fumigation_app/widgets/components/buttons/primary_button.dart';
import 'package:fumigation_app/widgets/components/inputfield/custom_input_field.dart';
import 'package:intl/intl.dart';

class RequestServicePage extends StatefulWidget {
  final String categoryTitle;

  const RequestServicePage({
    super.key,
    required this.categoryTitle,
  });

  @override
  State<RequestServicePage> createState() => _RequestServicePageState();
}

class _RequestServicePageState extends State<RequestServicePage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields (remain the same)
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submitRequest() {
    // First, validate the form to ensure all fields are filled correctly.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, navigate to the checkout page.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RequestedServiceCheckoutPage(
            // Pass all the data from the controllers
            serviceTitle: widget.categoryTitle,
            name: _nameController.text,
            phone: _phoneController.text,
            address: _addressController.text,
            date: _dateController.text,
            time: _timeController.text,
            notes: _notesController.text,
          ),
        ),
      );
    }
  }

  // Date and Time picker functions (remain the same)
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:  ColorScheme.light(
              primary: ColorPack.iconOrange,
              onPrimary: Colors.white,
              onSurface: ColorPack.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorPack.iconOrange,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorPack.iconOrange,
              onPrimary: Colors.white,
              onSurface: ColorPack.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  // Submit function (remains the same)

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Request ${widget.categoryTitle}",
          style: tTextStyleBold.copyWith(
            color: ColorPack.black,
            fontSize: size.width * 0.035,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2. Replace all fields with CustomInputField
                CustomInputField(
                  controller: _nameController,
                  label: 'Full Name',
                  placeholder: 'Enter your full name',
                  leadingIcon: Icons.person_outline,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter your name' : null,
                ),
                SizedBox(height: size.height * 0.02),
                CustomInputField(
                  controller: _phoneController,
                  label: 'Phone Number',
                  placeholder: 'e.g., 024 123 4567',
                  leadingIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your phone number'
                      : null,
                ),
                SizedBox(height: size.height * 0.02),
                CustomInputField(
                  controller: _addressController,
                  label: 'Full Address',
                  placeholder: 'Enter your house number, street, and area',
                  leadingIcon: Icons.location_on_outlined,
                  maxLines: 3,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your address'
                      : null,
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        controller: _dateController,
                        label: 'Preferred Date',
                        placeholder: 'Select a date',
                        leadingIcon: Icons.calendar_today_outlined,
                        readOnly: true,
                        onTap: _pickDate,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please select a date'
                            : null,
                      ),
                    ),
                    SizedBox(width: size.width * 0.04),
                    Expanded(
                      child: CustomInputField(
                        controller: _timeController,
                        label: 'Preferred Time',
                        placeholder: 'Select a time',
                        leadingIcon: Icons.access_time_outlined,
                        readOnly: true,
                        onTap: _pickTime,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please select a time'
                            : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                CustomInputField(
                  controller: _notesController,
                  label: 'Additional Notes (Optional)',
                  placeholder: 'e.g., Any specific instructions?',
                  leadingIcon: Icons.notes_outlined,
                  maxLines: 4,
                  // No validator needed for an optional field
                ),
                SizedBox(height: size.height * 0.05),
                PrimaryButton(
                  onTap: _submitRequest,
                  buttonTitle: "Submit Request",
                  titleColor: ColorPack.white,
                  height: 50,
                  width: double.infinity,
                  buttonColor: ColorPack.iconOrange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
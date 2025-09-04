import 'package:flutter/material.dart';
import 'package:fumigation_app/utils/colors.dart';
import 'package:fumigation_app/utils/typography.dart';
import 'package:fumigation_app/widgets/components/buttons/primary_button.dart';

class RequestedServiceCheckoutPage extends StatelessWidget {
  // Data passed from the request form
  final String serviceTitle;
  final String name;
  final String phone;
  final String address;
  final String date;
  final String time;
  final String notes;

  const RequestedServiceCheckoutPage({
    super.key,
    required this.serviceTitle,
    required this.name,
    required this.phone,
    required this.address,
    required this.date,
    required this.time,
    required this.notes,
  });

  // Function to show the success dialog
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap button to close
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Booking Confirmed!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Your request for "$serviceTitle" has been successfully submitted.'),
                const SizedBox(height: 10),
                const Text('Our team will contact you shortly to confirm.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:  Text('OK', style: TextStyle(color: ColorPack.iconOrange)),
              onPressed: () {
                // Pop until we get back to the home screen
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Confirm Your Request",
          style: tTextStyleBold.copyWith(
            color: ColorPack.black,
            fontSize: size.width * 0.035,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please review your service details before confirming.",
                style: tTextStyle600.copyWith(
                  color: ColorPack.darkGray,
                  fontSize: size.width * 0.04,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorPack.iconOrange.withOpacity(0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorPack.boxShadow.withOpacity(0.1),
                      blurRadius: 5.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(
                      icon: Icons.miscellaneous_services,
                      title: "Service",
                      value: serviceTitle,
                    ),
                    const Divider(),
                    _buildDetailRow(
                      icon: Icons.person_outline,
                      title: "Name",
                      value: name,
                    ),
                     const Divider(),
                    _buildDetailRow(
                      icon: Icons.phone_outlined,
                      title: "Phone",
                      value: phone,
                    ),
                     const Divider(),
                    _buildDetailRow(
                      icon: Icons.location_on_outlined,
                      title: "Address",
                      value: address,
                    ),
                     const Divider(),
                    _buildDetailRow(
                      icon: Icons.calendar_today_outlined,
                      title: "Date & Time",
                      value: "$date at $time",
                    ),
                    if (notes.isNotEmpty) ...[
                      const Divider(),
                      _buildDetailRow(
                        icon: Icons.notes_outlined,
                        title: "Notes",
                        value: notes,
                      ),
                    ]
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              PrimaryButton(
                onTap: () {
                  // On tap, show the success dialog
                  _showSuccessDialog(context);
                },
                buttonTitle: "Confirm & Book Service",
                titleColor: ColorPack.white,
                height: 50,
                width: double.infinity,
                buttonColor: ColorPack.iconOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for a consistent detail row
  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: ColorPack.iconOrange, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: tTextStyle600.copyWith(color: ColorPack.darkGray, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: tTextStyleBold.copyWith(color: ColorPack.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:remotesol/screens/easypaisa_payment_screen.dart';
import 'package:remotesol/screens/jazzcash_payment_screen.dart';

class PaymentScreen extends StatelessWidget {
  final String courseName;

  const PaymentScreen({
    super.key,
    required this.courseName,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          width: width * 0.35,
          height: 45,
          fit: BoxFit.contain,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Buy Course: $courseName",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Select Payment Method:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            // JazzCash Option
            ListTile(
              leading: Image.asset(
                "assets/images/jazzcash.png",
                width: 40,
              ),
              title: const Text("JazzCash"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => JazzCashPaymentScreen(courseName: courseName),
    ),
  );
},

            ),
            const Divider(),

            // EasyPaisa Option
            ListTile(
              leading: Image.asset(
                "assets/images/easypaisa.png",
                width: 40,
              ),
              title: const Text("EasyPaisa"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => EasyPaisaPaymentScreen(courseName: courseName),
    ),
  );
},

            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

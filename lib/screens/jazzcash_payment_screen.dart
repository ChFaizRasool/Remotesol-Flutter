import 'package:flutter/material.dart';
import 'package:remotesol/screens/jazzcash_payment_process.dart';

class JazzCashPaymentScreen extends StatelessWidget {
  final String courseName;

  const JazzCashPaymentScreen({
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
              "JazzCash Payment - $courseName",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Enter your JazzCash details:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),

            // Phone Number
            TextField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "JazzCash Mobile Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // CNIC
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "CNIC (without dashes)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => JazzCashPaymentProcess(courseName: courseName),
    ),
  );
},

                child: const Text(
                  "Proceed to Pay",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

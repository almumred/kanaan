//import 'package:car_rental/bookings_screen.dart';
//import 'package:car_rental/database.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/bookings_screen.dart';
import 'package:helloworld/database.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final Map<String, dynamic> car;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  BookingConfirmationScreen({super.key, required this.car});

  void confirmBooking(BuildContext context) async {
    if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
      await DatabaseHelper.instance.addBooking({
        'name': nameController.text,
        'phone': phoneController.text,
        'carName': car['name'],
        'price': car['price'],
        'image': car['image'],
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookingsScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('يرجى ملء جميع الحقول')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تأكيد الحجز')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'الاسم',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'رقم الهاتف',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => confirmBooking(context),
              child: Text('تأكيد الحجز'),
            ),
          ],
        ),
      ),
    );
  }
}

//import 'package:car_rental/booking_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/booking_confirmation_screen.dart';

class CarDetailScreen extends StatelessWidget {
  final Map<String, dynamic> car;
  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(car['name'])),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  "${car['image'].toString().split("_").first}_${index + 1}.jpg",
                );
              },
            ),
          ),

          Center(child: Text(car['name'], style: TextStyle(fontSize: 24))),
          Center(child: Text('السعر اليومي: \$${car['price']}')),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingConfirmationScreen(car: car),
                ),
              );
            },
            child: Text('إتمام الحجز'),
          ),
        ],
      ),
    );
  }
}

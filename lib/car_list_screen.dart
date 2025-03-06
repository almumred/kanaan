//import 'package:car_rental/bookings_screen.dart';
//import 'package:car_rental/car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/bookings_screen.dart';
import 'package:helloworld/car_detail_screen.dart';

class CarListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cars = [
    {'image': 'assets/car1_1.jpg', 'name': 'Toyota Corolla', 'price': 100},
    {'image': 'assets/car2_1.jpg', 'name': 'Honda Civic', 'price': 120},
    {'image': 'assets/car3_1.jpg', 'name': 'Ford Mustang', 'price': 200},
    {'image': 'assets/car4_1.jpg', 'name': 'Toyota Corolla', 'price': 100},
    {'image': 'assets/car5_1.jpg', 'name': 'Honda Civic', 'price': 120},
  ];

  CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('السيارات المتاحة'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingsScreen()),
              );
            },
            child: Text("حجوزاتي"),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              trailing: Image.asset(
                cars[index]['image'],
                width: 100,
                height: 100,
              ),
              title: Text(cars[index]['name']),
              subtitle: Text('السعر اليومي: \$${cars[index]['price']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailScreen(car: cars[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

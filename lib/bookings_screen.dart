//import 'package:car_rental/database.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/database.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  List<Map<String, dynamic>> bookings = [];

  @override
  void initState() {
    super.initState();
    fetchBookings();
  }

  void fetchBookings() async {
    List<Map<String, dynamic>> data =
        await DatabaseHelper.instance.getBookings();
    setState(() {
      bookings = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('حجوزاتي')),
      body:
          bookings.isEmpty
              ? Center(child: Text("لا يوجد حجوزات حتى الان"))
              : ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(bookings[index]['carName']),
                      subtitle: Text(
                        'السعر: \$${bookings[index]['price']}\nالاسم: ${bookings[index]['name']}\nالهاتف: ${bookings[index]['phone']}',
                      ),
                      trailing: Image.asset(bookings[index]['image']),
                    ),
                  );
                },
              ),
    );
  }
}

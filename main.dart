import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hi-Kod',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Hi-Kod"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
              },
            ),
          ],
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Buton arka plan rengi
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)), // Oval köşeler
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            ),
            onPressed: () {
            },
            child: const Text(
              'Hello World',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.lightBlueAccent, // Gövde arka plan rengi
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/user_page.dart'; // Mengimpor halaman user

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter REST API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserPage(), // Menyesuaikan dengan halaman yang ingin ditampilkan
    );
  }
}

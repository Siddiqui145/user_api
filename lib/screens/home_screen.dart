import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchusers();
  }

  void fetchusers() async {
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;

    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter REST API"),
        centerTitle: true,
        backgroundColor: Colors.red.shade300,
      ),
      body: ListView.builder(itemCount: users.length, itemBuilder: (context, index) {
        final user = users[index];
        final email = user['email'];
        return ListTile(
          title: Text(email),
        );

      }),
    );
  }
}
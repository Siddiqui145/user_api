import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_api/models/api_service.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> users = [];

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
    final results = json['results'] as List<dynamic>;

    final transformed = results.map((e) {

      final name = UserName(title: e['name']['title'] ?? 'N/A',
       first: e['name']['first'] ?? 'N/A',
        last: e['name']['last'] ?? 'N/A');

        final address1 = Street(number: e['location']['street']['number'],
         name: e['location']['street']['name']);

      final address = Location(address: address1,
       city: e['location']['city'],
        country: e['location']['country'],
         postcode: e['location']['postcode'],
          state: e['location']['state']);

      return Data(
        email : e['email'],
        gender: e['gender'],
        phone: e['phone'],
        cell: e['cell'],
        name: name,
        location: address,
      );
    }).toList();

    setState(() {
      users = transformed;
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
        final email = user.email;
        final gender = user.gender;
        final phone = user.phone;
        final cell = user.cell;
        final name = user.name.last;
        final city = user.location.city;
        return ListTile(
          title: Text(email),
          subtitle: Text(name),
          leading: Text(phone),
          trailing: Column(
            children: [
              Text(cell),
              Text(city),
            ],
          ),
          
        );

      }),
    );
  }
}
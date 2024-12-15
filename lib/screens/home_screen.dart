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

        final street = Street(number: e['location']['street']['number'].toString(),
         name: e['location']['street']['name']);

         final coordinates = Coordinates(latitude: e['location']['coordinates']['latitude'], 
         longitude: e['location']['coordinates']['longitude']);

         final timezone = Timezone(description: e['location']['timezone']['description'].toString(),
         offset: e['location']['timezone']['offset'].toString());

      final location = Location(street: street,
      coordinates: coordinates,
      timezone: timezone,
       city: e['location']['city'],
        country: e['location']['country'],
         postcode: e['location']['postcode'],
          state: e['location']['state']);

          final dob = Dob(date: DateTime.parse(e['dob']['date']),
           age: e['dob']['age']);

           final registered = Registered(date: DateTime.parse(e['registered']['date']), age: e['registered']['age']);
           final picture = Picture(large: e['picture']['large'], medium: e['picture']['medium'], thumbnail: e['picture']['thumbnail']);
      return Data(
        email : e['email'],
        gender: e['gender'],
        phone: e['phone'],
        cell: e['cell'],
        name: name,
        location: location,
        dob: dob,
        registered: registered,
        picture: picture,
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
        final fullName = user.fullName;
        final city = user.location.city;
        final number = user.location.street.number;
        final name = user.location.street.name;
        final desc = user.location.timezone.description;
        final age = user.dob.age;
        final dob = user.dob.date;
        final picture = user.picture.thumbnail;
        
        return ListTile(
          leading: ClipRRect( 
            //borderRadius: BorderRadius.circular(16),
           // child: Text((index+1).toString()),
           child: Image.network(picture),
            ),

            title: Text(fullName),
            
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              
              Text("Gender => $gender"),
              Text("Email => $email"),
              Text("Age => $age"),
              Text("DOB => $dob"),
              Text("Ring on => $phone"),
              Text("Cell Number => $cell"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Street Number : $number"),
                  Text("Street Name : $name")
                ],
              ),
              Text("City => $city"),
              Text("Description => $desc"),
              const SizedBox(height: 25,)
            ],
          ),
          
        );

      }),
    );
  }
}
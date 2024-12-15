class Data{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final UserName name;
  final Location location;

  

  Data({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.name,
    required this.location,

  });
}

class UserName{
  final String title;
  final String first;
  final String last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });
}

class Location{
  final Street address;
  final String city;
  final String state;
  final String country;
  final String postcode;

  Location({
    required this.address,
    required this.city,
    required this.country,
    required this.postcode,
    required this.state,
  });
}


class Street{
  final String number;
  final String name;

  Street({
    required this.number,
    required this.name
  });
}

class Data{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final UserName name;
  final Location location;
  final Dob dob;
  final Picture picture;
  final Registered registered;

  

  Data({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.name,
    required this.location,
    required this.dob,
    required this.registered,
    required this.picture,

  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
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
  final Street street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final Coordinates coordinates;
  final Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.country,
    required this.postcode,
    required this.state,
    required this.coordinates,
    required this.timezone,
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

class Coordinates{
  final String latitude;
  final String longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });
}

class Timezone{
  final String offset;
  final String description;

  Timezone({
    required this.description,
    required this.offset,
  });
}

class Dob{
  final DateTime date;
  final int age;

  Dob({
    required this.date,
    required this.age,
  });

}

class Registered{
  final DateTime date;
  final int age;

  Registered({
    required this.date,
    required this.age,
  });
}

class Picture{
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });
}
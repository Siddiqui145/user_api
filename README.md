# REST API User Data Fetcher

This project is a trial implementation of a REST API integration in a Flutter app. The goal was to successfully fetch and display user data from an external API, demonstrating proficiency in handling HTTP requests and managing JSON data in Flutter.

## Features

- Fetches user details such as name, email, location, date of birth, and more from a REST API.
- Parses JSON data into Dart objects for easy manipulation.
- Successfully displays all the retrieved data within the app.

## Screenshots

![REST_API_1](https://github.com/user-attachments/assets/451755bc-5f27-429d-9006-68122c7401ef)

![REST_API_2](https://github.com/user-attachments/assets/654852c2-534b-4526-9989-2f1a119d6ec0)



## Tech Stack

- **Flutter**: Frontend framework for building the mobile app.
- **Dart**: Programming language used for app development.
- **REST API**: Source of user data.

## Key Implementation Highlights

1. **HTTP Request**:
   - Used the `http` package to make a GET request to fetch data.
   - API Endpoint: [Random User API](https://randomuser.me/).

2. **Data Parsing**:
   - Converted the JSON response into Dart objects using custom data models.
   - Managed complex nested JSON structures for fields like name, address, and picture.

3. **Error Handling**:
   - Included exception handling to manage API failures or invalid data formats.

4. **Date Parsing**:
   - Converted string dates into `DateTime` objects using `DateTime.parse()`.

## Folder Structure

```
lib/
├── models/         # Contains data model classes
├── screens/        # UI screens displaying fetched data
├── services/       # API-related logic (e.g., HTTP requests)
└── main.dart       # App entry point
```

## How to Run

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Siddiqui145/user_api.git
   cd user_api
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

   Ensure you have an emulator or a connected device ready.

## Lessons Learned

- Gained hands-on experience with REST API integration in Flutter.
- Learned how to parse complex JSON data structures.
- Improved understanding of handling date formats and converting them to Dart `DateTime`.

## Future Improvements

- Enhance UI to make the displayed data more visually appealing.
- Add functionality to filter and search the fetched user data.
- Implement caching for offline access.

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Random User API Documentation](https://randomuser.me/)
- [Dart DateTime Class](https://api.dart.dev/stable/2.19.0/dart-core/DateTime-class.html)

## License

This project is for educational purposes and does not include a specific license. Feel free to fork and modify for your own learning.

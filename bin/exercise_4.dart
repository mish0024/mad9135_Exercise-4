import 'dart:convert';
import 'package:http/http.dart' as http;

// Main entry point for the console application
void main() async {
  // API URL for fetching random user data

  try {
    final url = Uri.parse('https://random-data-api.com/api/v2/users?size=11');

    // Send an asynchronous GET request to fetch data
    final response = await http.get(url);

    // Check if the response was successful
    if (response.statusCode == 200) {

      // Decode the JSON response into a List of Maps
      var users = jsonDecode(response.body) as List<dynamic>;

      // Loop through each user and print uid, first_name, and last_name
      for (var user in users) {
        print('${user['uid']}: ${user['first_name']} ${user['last_name']}');
      }
    } else {
      // Handle non-200 status codes here
      print('Failed to fetch user data with Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any errors during the request
    print('An error occurred: $e');
  }
}


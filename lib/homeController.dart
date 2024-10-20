import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeController extends GetxController {
 RxList<DateTime?> dates = <DateTime?>[].obs;
 String date='';
 /// Fetch Notes
 Future<void> fetchData() async {
  // Convert the list of DateTime? to a list of formatted strings


  // Combine all the converted dates into a single string separated by commas


  // Define your API key
  String _key = '18QBwoiRpbFgeYBSl3PxFHi2aoJjrt7lIindJfng';

  // Define the base URL
  String url = 'https://api.nasa.gov/planetary/apod';

  // Set the query parameters
  Map<String, String> queryParams = {
   'date':date ,  // Pass the formatted dates as a query parameter
   'api_key': _key,
  };

  // Combine the URL and the query parameters
  Uri uri = Uri.parse(url).replace(queryParameters: queryParams);

  try {
   // Send the GET request
   final response = await http.get(uri);
   print("---------$response");


   if (response.statusCode == 200) {
    // Parse and print the response body
    var data = jsonDecode(response.body);
    print('Response data: $data');
   } else {
    print('-------------------$response');
    print('Failed to fetch data. Status code: ${response.statusCode}');
   }
  } catch (e) {
   print('Error: $e');
  }
 }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entities/apod.dart';

Future<List<Apod>?> getImages() async {
  const url ='https://api.nasa.gov/planetary/apod?api_key=vEVhtDL5NJJq5F6Y3X3HY7gpaFeMLHK92t9AfShP&count=20';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
			final images = data.map((item) => Apod.fromJson(item as Map<String, dynamic>)).toList();
      return images;
    }
  } catch (error) {
    // ignore: avoid_print
    print('Error fetching APOD images: $error');
  }

  return null;
}
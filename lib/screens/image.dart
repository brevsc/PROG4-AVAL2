import 'package:flutter/material.dart';
import '../entities/apod.dart';
import '../widgets/bottom_navigation.dart';

class ImageScreen extends StatelessWidget {
  final Apod apod;

  const ImageScreen({super.key, required this.apod});

  @override
  Widget build(BuildContext context) {
    final copyright = apod.copyright ?? 'Unknown Author';

    return Scaffold(
      appBar: AppBar(title: const Text('Image')),
      body: ListView(
        children: [
          Image.network(apod.imageUrl, fit: BoxFit.fitWidth),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  apod.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  apod.date,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  apod.explanation,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  copyright,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

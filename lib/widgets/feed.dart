import 'package:flutter/material.dart';
import '../utils/get_images.dart';
import '../entities/apod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APOD Images'),
      ),
      body: FutureBuilder<List<Apod>?>(
        future: getImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final images = snapshot.data!;
            return ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                final apod = images[index];
                return ListTile(
                  title: Text(apod.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(apod.date),
                      Text(apod.copyright ?? 'Unknown'),
                    ],
                  ),
                  leading: Image.network(apod.imageUrl),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No images available.'),
            );
          }
        },
      ),
    );
  }
}

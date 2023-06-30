import 'package:flutter/material.dart';
import '../entities/apod.dart';
import '../screens/image.dart';

class FeedBuilder extends StatelessWidget {
  final int? quantity;
  final Future<List<Apod>?> imagesFuture;

  const FeedBuilder({super.key, this.quantity, required this.imagesFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Apod>?>(
      future: imagesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final images = snapshot.data!;
          return ListView.builder(
              itemCount: quantity ?? 20,
              itemBuilder: (context, index) {
                final apod = images[index];
                return ListTile(
                    title: Text(apod.title),
                    subtitle: Text(apod.date),
                    leading: Image.network(apod.imageUrl),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageScreen(apod: apod))));
              });
        } else {
          return const Center(
            child: Text('No images available.'),
          );
        }
      },
    );
  }
}

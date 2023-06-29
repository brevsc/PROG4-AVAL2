import 'package:flutter/material.dart';
import '../entities/apod.dart';
import '../screens/image.dart';
import '../utils/get_images.dart';

class FeedBuilder extends StatelessWidget {
  const FeedBuilder({
    super.key,
    required int? quantity,
  }) : _quantity = quantity;

  final int? _quantity;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Apod>?>(
      future: getImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final images = snapshot.data!;
          return ListView.builder(
              itemCount: _quantity,
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

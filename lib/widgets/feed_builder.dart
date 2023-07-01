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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    color: const Color.fromARGB(255, 245, 221, 248),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                        title: Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 300,
                                child: Image.network(
                                  apod.imageUrl,
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(apod.title),
                            Text(apod.date),
                          ],
                        ),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageScreen(apod: apod)))),
                  ),
                );
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

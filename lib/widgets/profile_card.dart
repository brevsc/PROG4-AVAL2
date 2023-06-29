import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  const ProfileCard(
      {super.key,
      required this.name,
      required this.description,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Image(
                  image: AssetImage(imageUrl),
                ),
                title: Text(name, style: const TextStyle(fontSize: 24)),
                subtitle:
                    Text(description, style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

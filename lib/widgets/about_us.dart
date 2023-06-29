import 'package:flutter/material.dart';
import '../entities/profile.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Profile> profiles = [
      Profile('Heron Nepomuceno', 'Github: HeronNepomuceno', 'assets/images/heron.jpeg'),
      Profile('Breno Vasconcelos', 'Github: brevsc', 'assets/images/breno.jpeg'),
      Profile('Dymas Cunha', 'Github: dymas', 'assets/images/dymas.jpeg'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre nós'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              Profile profile = profiles[index];
              return ProfileCard(
                name: profile.name,
                description: profile.description,
                imageUrl: profile.imageUrl,
              );
            },
          ),
        ),
      ),
    );
  }
}

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

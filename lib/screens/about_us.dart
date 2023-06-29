import 'package:flutter/material.dart';
import '../entities/profile.dart';
import '../widgets/profile_card.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Profile> profiles = [
      Profile('Heron Nepomuceno', 'Github: HeronNepomuceno',
          'assets/images/heron.jpeg'),
      Profile(
          'Breno Vasconcelos', 'Github: brevsc', 'assets/images/breno.jpeg'),
      Profile('Dymas Cunha', 'Github: dymas', 'assets/images/dymas.jpeg'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('About the team'),
      ),
      body: Padding(
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
    );
  }
}

import 'package:flutter/material.dart';
import '../utils/get_images.dart';
import '../widgets/choose_quantity.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/feed_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _quantity;

  Future<void> _refreshData() async {
    setState(() async {
      await getImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APOD Images'),
        actions: [
          ChooseQuantity(
              quantity: _quantity ?? 20,
              onChanged: (int? value) => setState(() {
                    _quantity = value;
                  }))
        ],
      ),
      body: RefreshIndicator(
          onRefresh: _refreshData, child: FeedBuilder(quantity: _quantity)),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

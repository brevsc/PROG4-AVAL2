import 'package:flutter/material.dart';

class ChooseQuantity extends StatefulWidget {
  final int quantity;
  final void Function(int?) onChanged;

  const ChooseQuantity(
      {super.key, required this.quantity, required this.onChanged});

  @override
  State<ChooseQuantity> createState() => _ChooseQuantityState();
}

class _ChooseQuantityState extends State<ChooseQuantity> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        value: widget.quantity,
        items: const <DropdownMenuItem<int>>[
          DropdownMenuItem<int>(
            value: 1,
            child: Text('1'),
          ),
          DropdownMenuItem<int>(
            value: 5,
            child: Text('5'),
          ),
          DropdownMenuItem<int>(
            value: 10,
            child: Text('10'),
          ),
          DropdownMenuItem<int>(
            value: 20,
            child: Text('20'),
          ),
        ],
        onChanged: widget.onChanged);
  }
}

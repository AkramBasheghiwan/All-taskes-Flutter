import 'package:flutter/material.dart';
import 'package:flutter_home_works/core/utils/constant.dart';

class CardReset extends StatelessWidget {
  final VoidCallback resetCounter;
  const CardReset({Key? key, required this.resetCounter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        child: ElevatedButton.icon(
          onPressed: resetCounter,
          icon: const Icon(Icons.refresh, color: Colors.white),
          label: const Text(
            Constant.resetButtonText,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}

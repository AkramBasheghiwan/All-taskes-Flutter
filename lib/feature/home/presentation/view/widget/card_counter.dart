import 'package:flutter/material.dart';
import 'package:flutter_home_works/core/utils/constant.dart';

class CardCounter extends StatelessWidget {
  final int counter;
  final VoidCallback incrementCounter;
  const CardCounter({
    Key? key,
    required this.counter,
    required this.incrementCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          children: [
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: incrementCounter,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 60,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                Constant.tapToCountButtonText,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_home_works/core/utils/constant.dart';

class CustomCardThikr extends StatelessWidget {
  final String currentZikr;
  const CustomCardThikr({Key? key, required this.currentZikr})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            const Text(
              Constant.currentZikrText,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              currentZikr,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

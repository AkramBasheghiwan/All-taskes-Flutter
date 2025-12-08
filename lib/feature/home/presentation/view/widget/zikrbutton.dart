import 'package:flutter/material.dart';

class ZikrButton extends StatelessWidget {
  final Function(String) changeZikr;
  final String text;
  const ZikrButton({Key? key, required this.text, required this.changeZikr})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 50,
      child: ElevatedButton(
        onPressed: () => changeZikr(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

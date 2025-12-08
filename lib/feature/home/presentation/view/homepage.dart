import 'package:flutter/material.dart';
import 'package:flutter_home_works/core/theme/colore.dart';
import 'package:flutter_home_works/core/utils/constant.dart';

import 'package:flutter_home_works/feature/home/presentation/view/widget/card_counter.dart';
import 'package:flutter_home_works/feature/home/presentation/view/widget/card_reset.dart';
import 'package:flutter_home_works/feature/home/presentation/view/widget/custom_card_thikr.dart';
import 'package:flutter_home_works/feature/home/presentation/view/widget/zikrbutton.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int counter = 0;
  String currentZikr = 'سبحان الله';

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  void changeZikr(String newZikr) {
    setState(() {
      currentZikr = newZikr;
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colore.blueAccent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          Constant.appName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //بطاقه الذكر الحالي
            CustomCardThikr(currentZikr: currentZikr),
            const SizedBox(height: 20),

            //بطاقه العداد
            CardCounter(counter: counter, incrementCounter: incrementCounter),

            const SizedBox(height: 20),
            // بطاقه تحتوي على قاىمه لاذكار
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      Constant.chooseZikrText,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ZikrButton(
                          text: Constant.subhanAllah,
                          changeZikr: changeZikr,
                        ),
                        ZikrButton(
                          text: Constant.alhamdulillah,
                          changeZikr: changeZikr,
                        ),
                        ZikrButton(
                          text: Constant.alahUoakber,
                          changeZikr: changeZikr,
                        ),
                        ZikrButton(
                          text: Constant.lailahilaAllah,
                          changeZikr: changeZikr,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // زر اعادة تعين العداد
                    CardReset(resetCounter: resetCounter),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

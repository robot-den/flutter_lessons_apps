import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int diceSide = 1;
  int rolled = 0;

  void rollDice() {
    setState(() {
      diceSide = randomizer.nextInt(6) + 1;
      rolled++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(child: Text('Rolled $rolled times')),
            const SizedBox(height: 5),
            SvgPicture.asset(
              'assets/images/svg/dice-$diceSide.svg',
              semanticsLabel: 'Dice',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 237, 30, 23),
              ),
              child: const Text('Roll'),
            ),
          ]),
    );
  }
}

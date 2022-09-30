import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.account_circle,
          size: 50,
        ),
        Column(
          children: const [
            Text(
              'Flutter Mcflutter',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Text(
              'Experienced App Developer',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

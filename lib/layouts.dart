import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          const Icon(
            Icons.account_circle,
            size: 60,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Flutter Mcflutter',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                'Experienced App Developer',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ],
      ),
      Row(
        children: const [
          Text(
            '123 Main Street',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            '(415) 555-0198',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    ]);
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

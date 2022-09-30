import 'package:flutter/material.dart';
import 'package:my_app/animated_progress_indicator.dart';

import 'home.dart';

//How to fix the website / line 40 and line 79 line 70
void main() {
  runApp(const NameGeneratorApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Business Name Generator',
//       theme: ThemeData(
//           appBarTheme: const AppBarTheme(
//             backgroundColor: Colors.lightBlue,
//             foregroundColor: Colors.white,
//           ),
//           primarySwatch: Colors.blueGrey,
//           textTheme: const TextTheme(
//             bodyLarge: TextStyle(
//               fontSize: 18,
//             ),
//           )),
//       home: const RandomWords(),
//     );
//   }
// }

//Sign Up screen
class NameGeneratorApp extends StatelessWidget {
  const NameGeneratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SignUpScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
  //'/welcome': (context) => const MyApp();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _userName = TextEditingController();

  double _formProgress = 0.0;

  //Shows the Name Generator scree after logging in
  void _showNameGenerator() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return const Home();
    }));
  }

  //progress tracking bar for the sign in page
  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [_firstName, _lastName, _userName];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }
    setState(() {
      _formProgress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text(
            'Sign Up',
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstName,
              decoration: const InputDecoration(hintText: 'First Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastName,
              decoration: const InputDecoration(hintText: 'Last Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _userName,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.blue;
              }),
            ),
            onPressed: _formProgress == 1 ? _showNameGenerator : null,
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}

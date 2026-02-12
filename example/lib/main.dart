import 'package:flutter/material.dart';
import 'package:smooth_avatar/smooth_avatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AvatarDemo(),
    );
  }
}

class AvatarDemo extends StatelessWidget {
  const AvatarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smooth Avatar Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Network Image Example
            SmoothAvatar(
              image: NetworkImage(
                'https://randomuser.me/api/portraits/women/68.jpg',
              ),
              radius: 50,
              borderColor: Colors.blue,
              borderWidth: 3,
            ),
            SizedBox(height: 20),

            // Asset Example (optional usage)
            SmoothAvatar(
              image: AssetImage('assets/sample_avatar.png'),
              radius: 40,
            ),
          ],
        ),
      ),
    );
  }
}

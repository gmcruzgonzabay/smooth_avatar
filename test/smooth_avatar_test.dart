import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smooth_avatar/smooth_avatar.dart';

void main() {
  testWidgets('SmoothAvatar renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SmoothAvatar(
            image: NetworkImage('https://example.com/avatar.png'),
            radius: 40,
          ),
        ),
      ),
    );

    expect(find.byType(SmoothAvatar), findsOneWidget);
  });
}

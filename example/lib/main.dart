import 'package:flutter/material.dart';
import 'package:flutter_native_text_view/flutter_native_text_view.dart';
import 'package:flutter_native_text_view_example/demo_item.dart';

void main() {
  runApp(const MyApp());
}

const exampleText =
    'Lorem ipsum dolor sit amet, 👍 consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ☺️👍. Ut enim ad minim veniam, quis nostrud 😊 exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Native Text View Demo'),
        ),
        body: ListView(
          children: const [
            DemoItem(
              title: 'Flutter SelectableText',
              child: SelectableText(
                exampleText,
                minLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            DemoItem(
              title: 'Native TextView',
              child: NativeTextView(
                exampleText,
                minLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

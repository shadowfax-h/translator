import 'package:flutter/material.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:screen_text_extractor/screen_text_extractor.dart';
import 'package:http/http.dart';

void main() async {
  // 必须加上这一行。
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });

    HotKey _hotKey = HotKey(
      KeyCode.keyQ,
      modifiers: [KeyModifier.alt],
      // 设置热键范围（默认为 HotKeyScope.system）
      scope: HotKeyScope.system, // 设置为应用范围的热键。
    );

    await hotKeyManager.register(
      _hotKey,
      keyDownHandler: (hotKey) {
        screenTextExtractor
            .extract(mode: ExtractMode.screenSelection)
            .then((value) => print("selection ：${value?.text}"));

        screenTextExtractor
            .extract(mode: ExtractMode.clipboard)
            .then((value) => print("clipboard: ${value?.text}"));




      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

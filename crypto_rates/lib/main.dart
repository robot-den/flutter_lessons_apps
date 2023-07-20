import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoDogApp());
}

class CryptoDogApp extends StatelessWidget {
  const CryptoDogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 47, 60, 67),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          scaffoldBackgroundColor: const Color.fromARGB(255, 47, 60, 67),
          // useMaterial3: true, // TODO: investigate what it means
          textTheme: TextTheme(
              bodyMedium: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
              labelSmall: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w700,
                  fontSize: 14)),
          dividerColor: Colors.white10,
          listTileTheme: const ListTileThemeData(iconColor: Colors.white30)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Crypto dogs';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final MaterialColor _red = Colors.red;
  final MaterialColor _green = Colors.green;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10,
          itemBuilder: (context, i) => ListTile(
                leading: SvgPicture.asset(
                  'assets/svg/bitcoin_logo.svg',
                  height: 48,
                  width: 48,
                ),
                title: Text(
                  'Bitcoin',
                  style: theme.textTheme.bodyMedium,
                ),
                subtitle: Text(
                  "\$20000",
                  style: theme.textTheme.labelSmall,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              )),
    );
  }
}

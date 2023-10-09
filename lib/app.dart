import 'package:flutter/material.dart';
import 'package:harry_potter_from_api/pages/home_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true
      ),
      home: const HomePage(),
    );
  }
}

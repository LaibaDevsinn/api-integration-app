import 'package:flutter/material.dart';
import 'package:my_flutter_app/view/sent_email_screen.dart';
import 'package:provider/provider.dart';

import 'controller/provider/email_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmailProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        ),
       home: const SendEmailScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_session_management/homepage.dart';
import 'package:provider_session_management/dataclass.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //ChangeNotifierProvider is a class provided by the provider 
    //commonly used for state management when you want to notify the UI of 
    //changes to a specific piece of data and rebuild widgets that depend on that data.
    return ChangeNotifierProvider(
      create: (context) => DataClass(),
      //GetMaterialAppGetMaterialApp is a replacement for the standard MaterialApp widget and is 
      //typically used as the root widget for GetX-based applications
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
  }
}

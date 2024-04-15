import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_model_crud/db/db_connection.dart';
import 'package:provider_model_crud/provider/todo_provider.dart';
import 'package:provider_model_crud/screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) =>  TodoProvider(proDB: DBConnection.db),
        child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

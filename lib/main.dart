import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moviesandtvs/core/network/remote/dio_helper.dart';
import 'package:moviesandtvs/core/shared/blocObserver/blocObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
 await DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ,
      debugShowCheckedModeBanner: false,
    );
  }
}

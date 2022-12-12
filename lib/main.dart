import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/services/services_locator.dart';
import 'package:social_app/core/utils/constants/bloc_observer.dart';
import 'package:social_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/presentation/screens/login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    home:LoginScreen(),
    );
  }
}


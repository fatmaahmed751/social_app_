import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/services/services_locator.dart';
import 'package:social_app/core/utils/constants/bloc_observer.dart';
import 'package:social_app/core/utils/constants/cache_helper.dart';
import 'package:social_app/core/utils/constants/constants.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/presentation/controllers/social_bloc.dart';
import 'package:social_app/presentation/controllers/social_login_bloc.dart';
import 'package:social_app/presentation/controllers/social_register_bloc.dart';
import 'package:social_app/presentation/controllers/states.dart';
import 'package:social_app/presentation/screens/social_login_screen.dart';
import 'package:social_app/presentation/screens/social_layout.dart';

import 'presentation/screens/on_boarding_screen.dart';
import 'presentation/screens/register_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   User? auth;
  @override
  void initState(){
    super.initState();
    auth=FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
        BlocProvider(create:(context)=> SocialBloc(sl())),
          BlocProvider(create:(context)=> SocialLoginBloc(sl())),
          BlocProvider(create:(context)=> SocialRegisterBloc(sl())),
         ],
         child:BlocConsumer<SocialBloc,SocialStates> (
           listener: (context,state){},
           builder: (context,state){
             return MaterialApp(
                 debugShowCheckedModeBanner: false,
                 home:auth!=null?SocialLayout():const SocialLoginScreen(),

             );
           },
         ),


    );

  }
}


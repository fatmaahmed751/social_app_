import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/services/services_locator.dart';
import 'package:social_app/core/utils/constants/bloc_observer.dart';
import 'package:social_app/core/utils/constants/cache_helper.dart';
import 'package:social_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/presentation/screens/social_login_screen.dart';
import 'package:social_app/presentation/screens/social_layout.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  Widget widget;
  var uId=CacheHelper.getData(key: 'uId');


 /* if(uId!= null){
    widget=SocialLayout();
  }else{
    widget=SocialLoginScreen(uId!);
  }*/
  runApp( const MyApp(
   // startWidget:widget,
  ));
}

class MyApp extends StatelessWidget {
 // final Widget startWidget;
  const  MyApp();


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    home:SocialLoginScreen(),
    );
  }
}


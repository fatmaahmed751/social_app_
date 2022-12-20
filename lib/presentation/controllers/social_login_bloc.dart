import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/data/social_models/userlogin.dart';
import 'package:social_app/domain/use_cases/social_login_usecase.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/states.dart';

class SocialLoginBloc extends Bloc<SocialLoginEvent,SocialStates>{

final GetSocialLoginUseCase getSocialLoginUseCase;
//UserLogin userLogin;

static SocialLoginBloc get(context)=>BlocProvider.of(context);
  SocialLoginBloc(this.getSocialLoginUseCase,):super(const SocialStates()){
    on<SocialLoginEvent>((event, emit)async {

   final result=  await getSocialLoginUseCase.execute(event.userLogin);
emit(const SocialStates(socialLoginState:RequestState.loaded));
   //print(result);
  print(event.userLogin.uId);
  // print(state);
    });
  }
 // static SocialLoginBloc get(context)=>BlocProvider.of(context);
}

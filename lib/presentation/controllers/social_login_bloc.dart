import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/data/repository/social_repository.dart';
import 'package:social_app/data/social_data_source/social_remote_data_source.dart';
import 'package:social_app/data/social_models/social_login_model.dart';
import 'package:social_app/data/social_models/userlogin.dart';
import 'package:social_app/domain/base_social_repository/base_social_repository.dart';
import 'package:social_app/domain/use_cases/social_login_usecase.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/states.dart';

class SocialLoginBloc extends Bloc<SocialLoginEvent,SocialStates>{
//  var emailController = TextEditingController();
//  var passwordController = TextEditingController();

UserLogin userLogin;
  SocialLoginBloc(this.userLogin):super(const SocialStates()){
    on<SocialLoginEvent>((event, emit)async {
      BaseSocialRemoteDataSource baseSocialRemoteDataSource=SocialRemoteDataSource();
     BaseSocialRepository baseSocialRepository=SocialRepository(baseSocialRemoteDataSource);
   final result=  await GetSocialLoginUseCase(baseSocialRepository).execute(userLogin);
emit(const SocialStates(socialLoginState:RequestState.loaded));
   print(result);
   print(state);
    });
  }
 // static SocialLoginBloc get(context)=>BlocProvider.of(context);
}

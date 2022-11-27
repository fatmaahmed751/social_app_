import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/presentation/controllers/events.dart';

import 'package:social_app/presentation/controllers/social_register_states.dart';

class SocialRegisterBloc extends Bloc<SocialRegisterEvent,SocialRegisterStates> {
  SocialRegisterBloc() :super(SocialRegisterInitialState()) {
    //static SocialRegisterBloc get(context)=>BlocProvider.of(context);

    on<SocialRegisterEvent>((event, emit) {
      emit(SocialRegisterLoadingState());
    });
    /*void UserRegister({

      required String name,
      required String phone,
      required String email,
      required String password,
    }) {
     // emit(SocialRegisterLoadingState());

      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password).
      then((value) {
        emit(SocialRegisterSuccessState());
      });
    }
  }*/
  }
}
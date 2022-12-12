import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/domain/use_cases/social_register_usecase.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/states.dart';

class SocialRegisterBloc extends Bloc<SocialRegisterEvent,SocialStates> {
  final GetSocialRegisterUseCase getSocialRegisterUseCase;
  static SocialRegisterBloc get(context)=>BlocProvider.of(context);
  SocialRegisterBloc(this.getSocialRegisterUseCase):super(const SocialStates()){
    on<SocialRegisterEvent>((event, emit)async {

      final result=  await getSocialRegisterUseCase.execute(event.socialRegisterModel);
      emit( const SocialStates(socialRegisterState:RequestState.loaded));
      print(result);
      print(state);
    });
  }
// static SocialLoginBloc get(context)=>BlocProvider.of(context);
}
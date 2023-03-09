
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/domain/use_cases/social_register_usecase.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/states.dart';

class SocialRegisterBloc extends Bloc<SocialRegisterEvent,SocialStates> {
  final GetSocialRegisterUseCase getSocialRegisterUseCase;

  static SocialRegisterBloc get(context) => BlocProvider.of(context);

  SocialRegisterBloc(this.getSocialRegisterUseCase
      ) :super(const SocialStates()) {
    on<SocialRegisterEvent>((event, emit) async {
      final result = await getSocialRegisterUseCase.execute(
          event.socialCreateUser);
      emit(const SocialStates(socialRegisterState: RequestState.loaded));
      print(result);
      print(state);
    });



  }
}
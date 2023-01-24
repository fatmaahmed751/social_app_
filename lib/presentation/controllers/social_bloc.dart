import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/domain/use_cases/social_get_data.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/states.dart';

class SocialBloc extends Bloc<SocialEvents,SocialStates>{

final GetSocialUserDataUseCase getSocialUserDataUseCase;
//SocialCreateUser socialCreateUser;
  static SocialBloc get(context)=>BlocProvider.of(context);

  SocialBloc(this.getSocialUserDataUseCase,):super(const SocialStates()){

   on<GetSocialDataEvent>((event, emit)async {

  final result=  await getSocialUserDataUseCase.execute(event.socialCreateUser);
  emit( const SocialStates(getSocialDataState:RequestState.loaded));
  print(result);
  print('helllllllo');
  print(event.socialCreateUser.uId);
// print(state);
});
}
//SocialCreateUser socialCreateUser;
}

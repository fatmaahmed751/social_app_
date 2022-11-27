import 'package:equatable/equatable.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/domain/entities/entities.dart';

class SocialStates extends Equatable{
 final List<UserData>socialLoginData;
 final RequestState socialLoginState;
final String socialLoginMessage;

 const SocialStates(
      {this.socialLoginData=const[],
      this.socialLoginState=RequestState.loading,
      this.socialLoginMessage=''
      });


  @override

  List<Object?> get props => [socialLoginData,socialLoginState,socialLoginMessage];

}
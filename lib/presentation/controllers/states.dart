import 'package:equatable/equatable.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/domain/entities/entities.dart';

class SocialStates extends Equatable{
 final List<UserData>socialLoginData;
 final RequestState socialLoginState;
final String socialLoginMessage;
 final List<UserData>socialRegisterData;
 final RequestState socialRegisterState;
 final String socialRegisterMessage;

 const SocialStates({
      this.socialRegisterData=const[],
      this.socialRegisterState=RequestState.loading,
      this.socialRegisterMessage='',
      this.socialLoginData=const[],
      this.socialLoginState=RequestState.loading,
      this.socialLoginMessage=''
      });


  @override
  List<Object?> get props => [
    socialLoginData,socialLoginState,socialLoginMessage,
    socialRegisterData,socialRegisterState,socialRegisterMessage,
  ];

}
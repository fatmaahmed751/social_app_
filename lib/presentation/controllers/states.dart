import 'package:equatable/equatable.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/data/social_models/userlogin.dart';
import 'package:social_app/domain/entities/entities.dart';

class SocialStates extends Equatable{
 final List<UserLogin>socialLoginData;
 final RequestState socialLoginState;
final String socialLoginMessage;
 final List<SocialRegisterModel>socialRegisterData;
 final RequestState socialRegisterState;
 final String socialRegisterMessage;
 final List<SocialCreateUser>socialCreateUser;
 final RequestState socialCreateUserState;
 final String socialCreateUserMessage;
 const SocialStates({
     this.socialCreateUser=const [],
     this.socialCreateUserState=RequestState.loading,
     this.socialCreateUserMessage='',
      this.socialRegisterData=const[],
      this.socialRegisterState=RequestState.loading,
      this.socialRegisterMessage='',
      this.socialLoginData=const[],
      this.socialLoginState=RequestState.loading,
      this.socialLoginMessage=''
      });


  @override
  List<Object?> get props => [
    socialCreateUser,socialCreateUserState,socialCreateUserMessage,
    socialLoginData,socialLoginState,socialLoginMessage,
    socialRegisterData,socialRegisterState,socialRegisterMessage,
  ];

}
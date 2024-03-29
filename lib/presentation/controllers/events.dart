import 'package:equatable/equatable.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/data/social_models/userlogin.dart';

abstract class SocialEvents extends Equatable{

  @override

  List<Object?> get props =>[];
}
class SocialLoginEvent extends SocialEvents{
  final UserLogin userLogin;
  SocialLoginEvent(this.userLogin);
}

class SocialRegisterEvent extends SocialEvents{
  final SocialCreateUser socialCreateUser;
  SocialRegisterEvent(this.socialCreateUser);
}


class SocialUserCreateEvent extends SocialEvents{
  final SocialCreateUser socialCreateUser;
  SocialUserCreateEvent(this.socialCreateUser);
}

class GetSocialDataEvent extends SocialEvents{
 final SocialCreateUser socialCreateUser;
  GetSocialDataEvent(this.socialCreateUser);
}

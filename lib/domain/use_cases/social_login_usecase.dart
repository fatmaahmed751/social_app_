//import 'package:social_app/data/social_models/social_login_model.dart';
import 'package:social_app/domain/base_social_repository/base_social_repository.dart';
import 'package:social_app/domain/entities/entities.dart';
import 'package:social_app/data/social_models/userlogin.dart';

class GetSocialLoginUseCase{
  final BaseSocialRepository baseSocialRepository;
  GetSocialLoginUseCase(this.baseSocialRepository);

Future <UserLogin>execute(UserLogin userLogin){
    return baseSocialRepository.getUserLoginData(userLogin);
  }
}
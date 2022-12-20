import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/domain/base_social_repository/base_social_repository.dart';

class SocialCreateUserUseCase{
  final BaseSocialRepository baseSocialRepository;
  SocialCreateUserUseCase(this.baseSocialRepository);

  Future<SocialCreateUser>execute(SocialCreateUser socialCreateUser)
  {
    return baseSocialRepository.getUserCreated(socialCreateUser);
  }
}
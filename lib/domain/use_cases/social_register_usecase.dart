import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/domain/base_social_repository/base_social_repository.dart';

class GetSocialRegisterUseCase {
  final BaseSocialRepository baseSocialRepository;

  GetSocialRegisterUseCase(this.baseSocialRepository);

  Future <SocialRegisterModel> execute(
      SocialRegisterModel socialRegisterModel) {
    return baseSocialRepository.getUserRegisterData(socialRegisterModel);
  }
}

import 'package:social_app/data/social_data_source/social_remote_data_source.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/domain/base_social_repository/base_social_repository.dart';
import 'package:social_app/data/social_models/userlogin.dart';

class SocialRepository extends BaseSocialRepository{
  final BaseSocialRemoteDataSource baseSocialRemoteDataSource;
  SocialRepository(this.baseSocialRemoteDataSource);

  @override
  Future<UserLogin> getUserLoginData(UserLogin userLogin) async=>
      baseSocialRemoteDataSource.getUserLoginData(userLogin);

  @override
  Future<SocialRegisterModel> getUserRegisterData(SocialRegisterModel socialRegisterModel) async=>
    baseSocialRemoteDataSource.getUserRegisterData(socialRegisterModel);

  @override
  Future<SocialCreateUser> getUserCreated(SocialCreateUser socialCreateUser)async=>
   baseSocialRemoteDataSource.getUserCreated(socialCreateUser);





}
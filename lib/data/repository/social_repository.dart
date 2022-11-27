import 'package:social_app/data/social_data_source/social_remote_data_source.dart';
import 'package:social_app/data/social_models/social_login_model.dart';
import 'package:social_app/domain/base_social_repository/base_social_repository.dart';
import 'package:social_app/domain/entities/entities.dart';
import 'package:social_app/data/social_models/userlogin.dart';

class SocialRepository extends BaseSocialRepository{
  final BaseSocialRemoteDataSource baseSocialRemoteDataSource;
  SocialRepository(this.baseSocialRemoteDataSource);

  @override
  Future<UserLogin> getUserLoginData(UserLogin userLogin) async=>
      baseSocialRemoteDataSource.getUserLoginData(userLogin);



  @override
  Future<UserData> getUserRegisterData() {
    // TODO: implement getUserRegisterData
    throw UnimplementedError();
  }



}
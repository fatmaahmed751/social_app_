import 'package:social_app/data/social_models/social_login_model.dart';
import 'package:social_app/domain/entities/entities.dart';
import 'package:social_app/data/social_models/userlogin.dart';

abstract class BaseSocialRepository{
 Future <UserLogin>getUserLoginData(UserLogin userLogin);

 Future<UserData> getUserRegisterData();
}
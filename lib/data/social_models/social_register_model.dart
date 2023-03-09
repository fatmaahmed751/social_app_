import 'package:social_app/domain/entities/entities.dart';

class SocialRegisterModel{
  late String name;
  late String phone;
  late String email;
  late String password;
  SocialRegisterModel({
       this.name='',  this.phone='',  this.email='',  this.password=''
    });
}

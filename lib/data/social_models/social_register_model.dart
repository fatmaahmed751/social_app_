import 'package:social_app/domain/entities/entities.dart';

class SocialRegisterModel{
  late String name;
  late String phone;
  late String email;
  late String password;
  SocialRegisterModel({
      required this.name, required this.phone, required this.email, required this.password
    });
}

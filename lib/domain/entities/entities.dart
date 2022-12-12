import 'package:equatable/equatable.dart';

class UserData extends Equatable {
 final String name;
 final  String phone;
 final String email;
 final String password;


  const UserData({
   required this.name,
  required  this.phone,
   required this.email,
  required  this.password,

  });

  @override

  List<Object?> get props => [name,phone,email,password];
}
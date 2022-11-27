import 'package:equatable/equatable.dart';

class UserData extends Equatable {
 final String? name;
 final  String? phone;
 final String? email;
 final String? password;


  const UserData({
    this.name,
    this.phone,
    this.email,
    this.password,

  });

  @override

  List<Object?> get props => [name,phone,email,password];
}
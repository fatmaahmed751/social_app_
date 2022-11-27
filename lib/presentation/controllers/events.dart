import 'package:equatable/equatable.dart';

abstract class SocialEvents extends Equatable{

  @override

  List<Object?> get props =>[];
}
class SocialLoginEvent extends SocialEvents{}

class SocialRegisterEvent extends SocialEvents{}

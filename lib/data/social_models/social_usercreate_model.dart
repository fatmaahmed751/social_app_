class SocialCreateUser{
  late String name;
  late String email;
  late String phone;
   String? uId;
 late  bool isEmailVerified;

  SocialCreateUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.isEmailVerified,
  });

  SocialCreateUser.fromJson(Map<String,dynamic>json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uId=json['uId'];
    isEmailVerified=json['isEmailVerified'];

  }

  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'isEmailVerified':isEmailVerified,
    };
  }
}
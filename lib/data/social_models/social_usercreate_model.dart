class SocialCreateUser{
  late String name;
  late String email;
  late String phone;
  late String uId;
   late String image;
   late String bio;
   late String password;
 late  bool isEmailVerified;
 late String cover;

  SocialCreateUser({
required this.name,
    this.email='',
    this.phone="",
    this.uId='',
    this.image='https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=740&t=st=1675466919~exp=1675467519~hmac=6be1881e4980926154b3c3bd0d7890facd0e0a1a99751a603e37d820745e0b06',
    required this.bio,
    this.isEmailVerified=false,
    this.cover='https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=740&t=st=1675466919~exp=1675467519~hmac=6be1881e4980926154b3c3bd0d7890facd0e0a1a99751a603e37d820745e0b06',
    this.password=''
  });

  SocialCreateUser.fromJson(Map<String,dynamic>json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uId=json['uId'];
    image=json['image'];
    bio=json['bio'];
    cover=json['cover'];
    isEmailVerified=json['isEmailVerified'];

  }

  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'email':email,
      'uId':uId,
      'image':image,
      'cover':cover,
      'phone':phone,
      'password':password,
      'bio':bio,
      'isEmailVerified':isEmailVerified,
    };
  }
}
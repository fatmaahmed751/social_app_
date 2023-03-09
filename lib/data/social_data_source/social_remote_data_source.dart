import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/core/error/exceptions.dart';
import 'package:social_app/core/utils/constants/constants.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/data/social_models/userlogin.dart';

abstract class BaseSocialRemoteDataSource{
  final FirebaseAuth auth=FirebaseAuth.instance;
 Future <UserLogin> getUserLoginData(UserLogin userLogin);
  Future <SocialCreateUser> getSocialUserData(SocialCreateUser socialCreateUser);
  Future<SocialCreateUser>getUserRegisterData(SocialCreateUser socialCreateUser);
Future<SocialCreateUser> getUserCreated(SocialCreateUser socialCreateUser);
  Future<SocialCreateUser> updateUser(SocialCreateUser socialCreateUser);
}
class SocialRemoteDataSource extends BaseSocialRemoteDataSource{

@override
  Future <UserLogin>getUserLoginData(UserLogin userLogin)async {
 // @override
  final response = await auth.signInWithEmailAndPassword(
     email: userLogin.email,password: userLogin.password);
  if (response.user !=null) {
    return UserLogin(email:userLogin.email,password:userLogin.password);
  }
  else {
    throw const ServerException(message: '');

  }

}

  @override
  Future<SocialCreateUser> getUserRegisterData(SocialCreateUser socialCreateUser)async {
   final response = await auth.createUserWithEmailAndPassword(
        email: socialCreateUser.email,password: socialCreateUser.password, );
    if (response.user !=null) {
      getUserCreated(SocialCreateUser (
        bio:socialCreateUser.bio,
       // "jjjjjjjjjjjjj",
          cover:'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1675468830~exp=1675469430~hmac=e0013d2202071e7b5b433488e4b03272c13736aed7812adf7ab7d0289fe213c4',
          name: socialCreateUser.name,
          email: socialCreateUser.email,phone: socialCreateUser.phone,uId:response.user!.uid,
          isEmailVerified: false,
      image:'https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=740&t=st=1675466919~exp=1675467519~hmac=6be1881e4980926154b3c3bd0d7890facd0e0a1a99751a603e37d820745e0b06'));

      return SocialCreateUser(
        bio: socialCreateUser.bio,
        email:socialCreateUser.email,password:socialCreateUser.password, name:socialCreateUser.name, phone:socialCreateUser.phone,);

    }
    else {
      throw ServerException(message:response.toString());

    }
  }


  @override
 Future< SocialCreateUser> getUserCreated(SocialCreateUser socialCreateUser)async {
  await FirebaseFirestore.instance.collection('users').
   doc(socialCreateUser.uId).set(socialCreateUser.toMap()).then((value) {
    print(socialCreateUser.uId);
  return
    SocialCreateUser (
        name:socialCreateUser.name,
        email: socialCreateUser.email,
        phone: socialCreateUser.phone,
        uId: socialCreateUser.uId,
        isEmailVerified: socialCreateUser.isEmailVerified,
    cover: socialCreateUser.cover,
    bio:socialCreateUser.bio,
    image:socialCreateUser.image
    );

  }).catchError((error){
  print(error.toString());
  return throw ServerException(message: error.toString());
   });
  return throw const ServerException(message:'');
    }


  @override
  Future<SocialCreateUser> getSocialUserData(SocialCreateUser socialCreateUser) async{
  await FirebaseFirestore.instance.
    collection('users').
    doc(socialCreateUser.uId).get().then((value) {
      socialCreateUser=SocialCreateUser.fromJson(value.data()!);

    }).catchError((error){
      print(error);
      return throw ServerException(message: error.toString());
      print(error);
    });
    return throw const ServerException(message: '');
  }




  @override
Future<SocialCreateUser> updateUser(SocialCreateUser socialCreateUser)

async {
  getUserCreated(SocialCreateUser (
      bio:socialCreateUser.bio,
      cover:socialCreateUser.cover,
         // "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1675468830~exp=1675469430~hmac=e0013d2202071e7b5b433488e4b03272c13736aed7812adf7ab7d0289fe213c4",

      name: socialCreateUser.name,
      email: socialCreateUser.email,phone: socialCreateUser.phone,uId:socialCreateUser.uId,
      isEmailVerified: false,
      image:socialCreateUser.image));
     // 'https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=740&t=st=1675466919~exp=1675467519~hmac=6be1881e4980926154b3c3bd0d7890facd0e0a1a99751a603e37d820745e0b06'));
  await FirebaseFirestore.instance.collection('users')
      .doc(socialCreateUser.email).update(socialCreateUser.toMap()).then((value){
    if (uId==null) {
      print('uiiiiiiiiiiiiiiiiii');
    } else{
      //getUserRegisterData(socialCreateUser as SocialRegisterModel);
      print('uiiiiiiiiiiiiiiiiiigggggggggggggggggggggggg');
    }
  }).catchError((error){
    return throw ServerException(message: error.toString());
  });
  return throw const ServerException(message: '');

}

}


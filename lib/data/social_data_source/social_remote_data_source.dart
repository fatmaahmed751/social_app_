import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/core/error/exceptions.dart';
import 'package:social_app/core/network/error_message_model.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/data/social_models/social_login_model.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/domain/entities/entities.dart';
import 'package:social_app/data/social_models/userlogin.dart';

abstract class BaseSocialRemoteDataSource{
  final FirebaseAuth auth=FirebaseAuth.instance;
 Future <UserLogin> getUserLoginData(UserLogin userLogin);
  Future <SocialCreateUser> getSocialUserData(SocialCreateUser socialCreateUser);
  Future<SocialRegisterModel>getUserRegisterData(SocialRegisterModel socialRegisterModel);
Future<SocialCreateUser> getUserCreated(SocialCreateUser socialCreateUser);
}
class SocialRemoteDataSource extends BaseSocialRemoteDataSource{

@override
  Future <UserLogin>getUserLoginData(UserLogin userLogin)async {
 // @override
  final response = await auth.signInWithEmailAndPassword(
     email: userLogin.email,password: userLogin.password);
  if (response.user !=null) {
  //  print('ppppppppppppppppppp');
    return UserLogin(email:userLogin.email,password:userLogin.password);
  }
  else {
    throw const ServerException(message: '');

  }

}

  @override
  Future<SocialRegisterModel> getUserRegisterData(SocialRegisterModel socialRegisterModel)async {

//  SocialCreateUser socialCreateUser=SocialCreateUser(name:'', email: '', phone: '',uId: '',isEmailVerified: false);
    final response = await auth.createUserWithEmailAndPassword(
        email: socialRegisterModel.email,password: socialRegisterModel.password, );
    if (response.user !=null) {
    //  print('oooooooooooooooooooo');
      getUserCreated(SocialCreateUser(
          name: socialRegisterModel.name,
          email: socialRegisterModel.email,phone: socialRegisterModel.phone,uId: response.user!.uid,
          isEmailVerified: false));

      return SocialRegisterModel(email:socialRegisterModel.email,password:socialRegisterModel.password, name:'', phone: '');

      //getUserCreated(socialCreateUser);
    }
    else {
    //  print(error.toString());
      throw ServerException(message:response.toString());

    }
  }

  @override
 Future< SocialCreateUser> getUserCreated(SocialCreateUser socialCreateUser)async {
  await FirebaseFirestore.instance.collection('users').
   doc(socialCreateUser.uId).

   set(socialCreateUser.toMap()).then((value) {
  //   print('uuuuuuuuuuuuuuu');
   print(socialCreateUser.uId);
   // print(value.data());
  return
    SocialCreateUser (name: socialCreateUser.name,email: socialCreateUser.email,phone: socialCreateUser.phone,uId: socialCreateUser.uId,isEmailVerified: socialCreateUser.isEmailVerified);

  }).catchError((error){
  print(error.toString());
  return throw ServerException(message: error.toString());
   });
  return throw const ServerException(message:'');
 // return null;
  // else {
    // throw ServerException();
    }





  @override
  Future<SocialCreateUser> getSocialUserData(SocialCreateUser socialCreateUser) async{
  await FirebaseFirestore.instance.
    collection('users').
    doc(uId).get().then((value) {
      //print('jjjjjjjjjjjjj');
      socialCreateUser=SocialCreateUser.fromJson(value.data()!);
     // print(value.data());

    }).catchError((error){
      print(error);
      return throw ServerException(message: error.toString());
      print(error);
    });
    return throw const ServerException(message: '');
  }

}


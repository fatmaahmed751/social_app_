import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/error/exceptions.dart';
import 'package:social_app/core/utils/constants/constants.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/data/social_data_source/social_remote_data_source.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' ;
import 'package:social_app/data/social_models/post_model.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/data/social_models/social_register_model.dart';

import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/domain/use_cases/social_get_data.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/states.dart';
import 'package:social_app/presentation/screens/chats/chats_screen.dart';
import 'package:social_app/presentation/screens/feeds/feeds_screen.dart';
import 'package:social_app/presentation/screens/new_post/new_post_screen.dart';
import 'package:social_app/presentation/screens/settings/settingsScreen.dart';
import 'package:social_app/presentation/screens/users/users_screen.dart';
import 'package:image_picker/image_picker.dart';
class SocialBloc extends Bloc<SocialEvents,SocialStates> {

  final GetSocialUserDataUseCase getSocialUserDataUseCase;
  static SocialBloc get(context) => BlocProvider.of(context);
  SocialCreateUser user=SocialCreateUser(name: '', bio: '');
  SocialBloc(this.getSocialUserDataUseCase) :super(const SocialStates()) {
    on<GetSocialDataEvent>((event, emit) async {
      final user = await getSocialUserDataUseCase.execute(
          event.socialCreateUser);
      emit(const SocialStates(getSocialDataState: RequestState.loaded));
print(user.cover);
    });
  }
   Future<SocialCreateUser> getSocialUserData(SocialCreateUser socialCreateUser) async{
    await FirebaseFirestore.instance.
    collection('users').
    doc(socialCreateUser.uId).get().then((value) {
      socialCreateUser=SocialCreateUser.fromJson(value.data()!);
      print(socialCreateUser.name);
    }).catchError((error){
      print(error);
      return throw ServerException(message: error.toString());
      print(error);
    });
    return throw const ServerException(message: '');
  }

  List<Widget>screens = [
    const FeedsScreen(),
    const ChatsScreen(),
     NewPostScreen(),
    const UsersScreen(),
     SettingsScreen(),
  ];
  List<String>titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings'

  ];

int currentIndex=0;
  void changeBottomNav(int index) {
    if (index == 2)
      emit(SocialNewPostState());
    else {
      currentIndex = index;
      emit(ChangeBottomNavState());
    }
  }

  File? profileImage;
  File? coverImage;
  String profileImageUrl='';
  String coverImageUrl='';
  var picker=ImagePicker();

  Future<void>getProfileImage()async{
    final pickedFile=await picker.pickImage(
        source: ImageSource.gallery);
  if(pickedFile !=null){
    profileImage=File(pickedFile.path);
    emit(SocialProfileImagePickedSuccess());
  }
  else{
    print('No image selected');
    emit(SocialProfileImagePickedError());
  }
  }

  Future<void>getCoverImage()async{
    final pickedFile=await picker.pickImage(
        source: ImageSource.gallery);
    if(pickedFile !=null){
      coverImage=File(pickedFile.path);
      emit(SocialCoverImagePickedSuccess());
    }
    else{
      print('No image selected');
      emit(SocialCoverImagePickedError());

    }
  }

  void uploadProfileImage(){
   FirebaseStorage storage =FirebaseStorage.instance;
  storage.ref().child('users/${Uri.file(profileImage!.path).pathSegments.last}')
      .putFile(profileImage!).then((value){
        value.ref.getDownloadURL().then((value){
          emit(SocialUploadProfileImageSuccess());
          debugPrint(value);
          profileImageUrl=value;
        }).catchError((error){
          emit(SocialUploadProfileImageError());
          debugPrint(error.toString());
        });
  }).catchError((error){
    emit(SocialUploadProfileImageError());
    debugPrint(error.toString());
  });
  }

  void uploadCoverImage(){
    FirebaseStorage storage =FirebaseStorage.instance;
     storage = FirebaseStorage.instanceFor(bucket: "gs://social-app-abad6.appspot.com");
    //FirebaseStorage storage =FirebaseStorage.instance;
    storage.ref().child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!).then((value){
      value.ref.getDownloadURL().then((value){
        emit(SocialUploadCoverImageSuccess());
        debugPrint(value);
        coverImageUrl=value;
      }).catchError((error){
        emit(SocialUploadCoverImageError());
        debugPrint(error.toString());
      });
    }).catchError((error){
      emit(SocialUploadCoverImageError());
      debugPrint(error.toString());
    });
  }

  Future<SocialCreateUser> updateUser(SocialCreateUser socialCreateUser)

  async {
   /* getUserCreated(SocialCreateUser (
        bio:socialCreateUser.bio,
        cover:socialCreateUser.cover,
        // "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1675468830~exp=1675469430~hmac=e0013d2202071e7b5b433488e4b03272c13736aed7812adf7ab7d0289fe213c4",

        name: socialCreateUser.name,
        email: socialCreateUser.email,phone: socialCreateUser.phone,uId:socialCreateUser.uId,
        isEmailVerified: false,
        image:socialCreateUser.image));
     'https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=740&t=st=1675466919~exp=1675467519~hmac=6be1881e4980926154b3c3bd0d7890facd0e0a1a99751a603e37d820745e0b06'));
   */
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


 //
  File? postImage;
  Future<void>getPostImage()async{
    final pickedFile=await picker.pickImage(
        source: ImageSource.gallery);
    if(pickedFile !=null){
      postImage=File(pickedFile.path);
      emit(SocialPostImagePickedSuccess());
    }
    else{
      print('No image selected');
      emit(SocialPostImagePickedError());

    }
  }
void uploadPostImage({
  required String dateTime,
  required String text,
})
{
emit(SocialCreatePostLoading());
FirebaseStorage storage =FirebaseStorage.instance;
storage.ref().child('posts/${Uri.file(postImage!.path).pathSegments.last}')
    .putFile(postImage!).then((value){
  value.ref.getDownloadURL().then((value){
    debugPrint(value);
    createPost(dateTime: dateTime, text: text, postImage: value);
  }).catchError((error){
    emit(SocialCreatePostError());
    debugPrint(error.toString());
  });
}).catchError((error){
  emit(SocialCreatePostError());
  debugPrint(error.toString());
});
}

void createPost({
  required String dateTime,
  required String text,
  String? postImage,
}){
PostModel model=PostModel(
  name:user.name,
  image:user.image ,
    uId:user.uId,
    dateTime:dateTime,
    text:text,
    postImage:postImage??"",
);
FirebaseFirestore.instance.collection('posts')
.add(model.toMap()).then((value){
emit(SocialCreatePostSuccess());
}).catchError((error){
  emit(SocialCreatePostError());
});

}



}




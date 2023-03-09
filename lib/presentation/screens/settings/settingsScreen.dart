import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/error/exceptions.dart';
import 'package:social_app/core/services/services_locator.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/presentation/controllers/social_bloc.dart';
import 'package:social_app/presentation/controllers/social_register_bloc.dart';
import 'package:social_app/presentation/controllers/states.dart';
import 'package:social_app/presentation/screens/edit_profile/edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var bioController = TextEditingController();


  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialBloc(sl()),
      child: BlocConsumer<SocialRegisterBloc, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SocialBloc bloc = SocialBloc.get(context);
          nameController.text=bloc.user.name;
          bioController.text=bloc.user.bio;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 10.0,
                              child: Image(
                                image: NetworkImage(
                                    SocialBloc.get(context).user.cover),
                                fit: BoxFit.cover,
                                height: 150.0,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 46,
                              backgroundImage: NetworkImage(
                                SocialBloc.get(context).user.image,
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      bloc.user.name,
                      style: TextStyle(
                          height: 1.4,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                    bloc.user.bio,
                      style: const TextStyle(
                          height: 1.4,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Column(
                                children: const [
                                  Text(
                                    '100',
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Posts',
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                children: const [
                                  Text(
                                    '260',
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Photos',
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                children: const [
                                  Text(
                                    '10k',
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Followers',
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                children: const [
                                  Text(
                                    '100',
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                        height: 1.4,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(

                            onPressed: () {},
                            child: const Text('EDIT PROFILE',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 5.8,
                        ),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      EditProfileScreen()));
                            }, child: const Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.blue,
                        ))
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
/* getUserCreated(SocialCreateUser (
          bio:socialCreateUser.bio,
          cover:'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1675468830~exp=1675469430~hmac=e0013d2202071e7b5b433488e4b03272c13736aed7812adf7ab7d0289fe213c4',
          name: socialRegisterModel.name,
          email: socialRegisterModel.email,phone: socialRegisterModel.phone,uId:response.user!.uid,
          isEmailVerified: false,
          image:'https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=740&t=st=1675466919~exp=1675467519~hmac=6be1881e4980926154b3c3bd0d7890facd0e0a1a99751a603e37d820745e0b06'));*/
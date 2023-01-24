import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/constants/components.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/social_bloc.dart';
import 'package:social_app/presentation/controllers/states.dart';

class SocialLayout extends StatefulWidget {
  @override
  State<SocialLayout> createState() => _SocialLayoutState();
}

class _SocialLayoutState extends State<SocialLayout> {
  SocialCreateUser socialCreateUser=SocialCreateUser(
      name: '',
      email: '',
      phone: '',
      uId: '',
      isEmailVerified: false);
  late SocialBloc bloc;

  @override
  void initState() {
    bloc = SocialBloc.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialBloc, SocialStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        SocialBloc  bloc= SocialBloc.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('News Feed',
            textAlign: TextAlign.start,
            style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w700,
            ),),
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: ConditionalBuilder(
            condition:socialCreateUser.uId!=null ,
            fallback: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
            },
            builder: (BuildContext context) {

              return Column(
                children: [

                ],
              );
            },

          ),

        );
      },
    );
  }
}
/*
if(!socialCreateUser.isEmailVerified)
Padding(
padding: const EdgeInsets.all(8.0),
child: Container(
color: Colors.orange[300],
padding: const EdgeInsets.all(7.0),
child: Row(
children: [
const Text('Please verify your email '),
const Spacer(),
TextButton(onPressed: (){
FirebaseAuth.instance.currentUser!.sendEmailVerification()
    .then((value)  {
showToast(
text:'Check Your Email' ,
state: ToastStates.SUCCESS,
);
}).catchError((error)
{});
}, child: const Text('Send')),
],
),
),
),*/
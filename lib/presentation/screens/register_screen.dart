import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/services/services_locator.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/core/utils/enum.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/presentation/controllers/social_bloc.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/social_register_bloc.dart';
import 'package:social_app/presentation/controllers/states.dart';
import 'package:social_app/presentation/controllers/states.dart';
import 'package:social_app/presentation/screens/on_boarding_screen.dart';
import 'package:social_app/presentation/screens/social_layout.dart';

import '../../core/utils/enum.dart';


class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
 // SocialCreateUser socialCreateUser=SocialCreateUser(name:'', email: email, phone: phone, uId: uId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialRegisterBloc(sl()),
      child: BlocConsumer<SocialRegisterBloc, SocialStates>(
        listener: (context, state) {
       if(state.socialRegisterState==RequestState.loaded ){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>OnBoardingScreen()
         ));
       }
        },
        builder: (context, state) {
          SocialRegisterBloc bloc = SocialRegisterBloc.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('REGISTER',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,

                    ),),
                  const SizedBox(height: 20.0,),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                   /* onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },*/
                    decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: TextStyle(
                            color: Colors.grey[500]
                        ),
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                   /* onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },*/
                    decoration: InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                            color: Colors.grey[500]
                        ),
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                   /* onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },*/
                    decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(
                            color: Colors.grey[500]
                        ),
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    /*onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },*/
                    decoration: InputDecoration(
                        hintText: 'Phone',
                        hintStyle: TextStyle(
                            color: Colors.grey[500]
                        ),
                        prefixIcon: const Icon(Icons.phone_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.deepOrange,
                    ),
                    width: double.infinity,
                    //color: Colors.deepOrange,
                    child: TextButton(
                      onPressed: () {
                        bloc.add(SocialRegisterEvent(SocialRegisterModel(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                            password: passwordController.text)));
                         // SocialCreateUser(name: '', email: '', phone: '', uId: ''),

                      }, child: const Text('REGISTER',
                      style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
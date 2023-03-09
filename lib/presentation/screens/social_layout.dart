import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/constants/components.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/social_bloc.dart';
import 'package:social_app/presentation/controllers/states.dart';
import 'package:social_app/presentation/screens/chats/chats_screen.dart';
import 'package:social_app/presentation/screens/feeds/feeds_screen.dart';
import 'package:social_app/presentation/screens/new_post/new_post_screen.dart';
import 'package:social_app/presentation/screens/search/search_screen.dart';
import 'package:social_app/presentation/screens/settings/settingsScreen.dart';
import 'package:social_app/presentation/screens/users/users_screen.dart';

class SocialLayout extends StatefulWidget {
  @override
  State<SocialLayout> createState() => _SocialLayoutState();
}

class _SocialLayoutState extends State<SocialLayout> {
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
        if(state is SocialNewPostState){
          Navigator.push(context,
              MaterialPageRoute(builder:(context)=>NewPostScreen(),
              ),
          );
        }

      },
      builder: (context, state) {
        SocialBloc bloc = SocialBloc.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title:  Text(
              bloc.titles[bloc.currentIndex],
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Colors.black
              ),
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            actions:[
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(icon:const Icon(Icons.notifications_none,
                color: Colors.black,
                  size: 22.0,),
                    onPressed:(){}),
              ),
              SizedBox(width: 9),
              CircleAvatar(
                radius: 21,
                backgroundColor: Colors.grey[200],
                child: IconButton(icon:const Icon(Icons.search_sharp,
                size: 22.0,
                color: Colors.black,),
                    onPressed:(){}),
              ),
              SizedBox(width: 9),
            ],
          ),
          body: bloc.screens[bloc.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            elevation: 20.0,
            unselectedItemColor: Colors.black87,
            currentIndex: bloc.currentIndex,
            onTap: (index) {
              bloc.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.home,
                    size: 17.0,
                  ),
                  onPressed: () {
                     Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FeedsScreen (),));
                  },

                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.chat_outlined,
                    size: 17.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatsScreen(),
                        ));
                  },
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.paste_rounded,
                    size: 17.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  NewPostScreen(),
                        ));
                  },
                ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                  icon: IconButton(
                icon: const Icon(
                  Icons.perm_identity,
                  size: 17.0,
                ),
                onPressed: () {

           Navigator.push(context, MaterialPageRoute(
            builder: (context) => const UsersScreen()));
                },
              ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    size: 17.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SettingsScreen()));
                  },
                ),
                label: 'Settings',
              ),
            ],
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/constants/components.dart';
import 'package:social_app/presentation/controllers/social_bloc.dart';
import 'package:social_app/presentation/controllers/states.dart';

class NewPostScreen extends StatelessWidget {

var textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialBloc, SocialStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: defaultAppBar(
              context: context,
              title: 'Create Post',
              actions: [
                TextButton(
                    onPressed: () {
                   var now=DateTime.now();
                  if(SocialBloc.get(context).postImage==null){
                    SocialBloc.get(context).createPost(
                        dateTime: now.toString(),
                        text: textController.text,
                    );
                  }else{
                    SocialBloc.get(context).uploadPostImage(
                        dateTime: now.toString(),
                        text: textController.text);
                  }
                }, child:
                const Text('Post')),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1675468830~exp=1675469430~hmac=e0013d2202071e7b5b433488e4b03272c13736aed7812adf7ab7d0289fe213c4'),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Abdullah Ahmed',
                                style: TextStyle(
                                    height: 1.4,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.blue,
                                ),

                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                        hintText: 'What is on your mind...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: (){},
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.image_outlined),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Text('add photo'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){},
                          child:const Text('# tags') ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

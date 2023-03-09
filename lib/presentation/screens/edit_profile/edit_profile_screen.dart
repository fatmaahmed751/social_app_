import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/constants/components.dart';
import 'package:social_app/data/social_models/social_usercreate_model.dart';
import 'package:social_app/presentation/controllers/social_bloc.dart';
import 'package:social_app/presentation/controllers/states.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    SocialBloc bloc =SocialBloc.get(context);
    return BlocConsumer<SocialBloc, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {

      bloc= SocialBloc.get(context);
        nameController.text=bloc.user.name;
        bioController.text=bloc.user.bio;
        phoneController.text=bloc.user.phone;
        var profileImage = SocialBloc.get(context).profileImage;
        var coverImage = SocialBloc.get(context).coverImage;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: defaultAppBar(
              context: context,
              title: 'Edit Profile',
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextButton(
                    onPressed: (){},
                   /* bloc.updateUserImages(
                        name: bloc.user.name,
                        phone: bloc.user.phone,
                        bio: bloc.user.bio,
                        email: bloc.user.email);
                    },*/
                    child: Text(
                      'Update',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  ),

              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (state is SocialUpdateUserLoading)
                  const LinearProgressIndicator(),
                if (state is SocialUpdateUserLoading)
                  SizedBox(height: 7.0),
                Container(
                  height: 190,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 10.0,
                              child: Image(
                                image: coverImage == null
                                    ? NetworkImage(bloc.user.cover,
                                       )
                                    : FileImage(coverImage) as ImageProvider,
                                fit: BoxFit.cover,
                                height: 150.0,
                                width: double.infinity,
                              ),
                            ),
                            CircleAvatar(
                              radius: 18.0,
                              child: IconButton(
                                onPressed: () {
                                  SocialBloc.get(context).getCoverImage();
                                },
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 46,
                              backgroundImage: profileImage == null
                                  ? NetworkImage(bloc.user.image
                               )
                                  : FileImage(profileImage) as ImageProvider,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              SocialBloc.get(context).getProfileImage();
                            },
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      label: const Text('Name'),
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      prefixIcon: const Icon(Icons.perm_identity),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: bioController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Your bio',
                      label: Text('Bio'),
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      prefixIcon: const Icon(Icons.edit),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: 'phone',
                      label: const Text('phone'),
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      prefixIcon: const Icon(Icons.phone_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                const SizedBox(
                  height: 10.0,
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}

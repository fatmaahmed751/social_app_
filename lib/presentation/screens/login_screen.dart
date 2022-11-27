import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/presentation/controllers/bloc.dart';
import 'package:social_app/presentation/controllers/events.dart';
import 'package:social_app/presentation/controllers/social_login_bloc.dart';
import 'package:social_app/presentation/controllers/states.dart';
import 'package:social_app/presentation/screens/register_screen.dart';
import 'package:social_app/data/social_models/userlogin.dart';

class LoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLoginBloc()..add(SocialLoginEvent()),
      child: BlocConsumer<SocialLoginBloc, SocialStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: TextFormField(
                        controller:emailController,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
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
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          ),
                          // labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: const Icon(Icons.visibility_off_sharp),
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

                          print(emailController.text);
                          print(passwordController.text);
                        }, child: const Text('LOGIN',
                        style: TextStyle(
                            color: Colors.white
                        ),),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context)=>RegisterScreen()));
                         }, child: Text('Register',
                          style: TextStyle(
                              color: Colors.cyan.shade800
                          ),
                        ),
                        ),
                      ],
                    )

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
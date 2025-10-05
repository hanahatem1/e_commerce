import 'package:e_commerce/pages/login.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email;

  String? pass;

  bool isLoading= false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Color(0xffc5f0e1),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextField(hintText: 'Enter your username:'),
                    const SizedBox(
                      height: 30,
                    ),
                    customTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Enter Your Email:'),
                    const SizedBox(
                      height: 30,
                    ),
                    customTextField(
                        onChanged: (data) {
                          pass = data;
                        },
                        hintText: 'Enter Your Password:'),
                    const SizedBox(height: 30),
                    customButton(
                        onTap: () async {

                          if (formkey.currentState!.validate()) {
                            isLoading=true;
                            setState(() {
                              
                            });
                            try {
                              UserCredential user = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: email!, password: pass!);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Register Successed')));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'The password provided is too weak.')));
                              } else if (e.code == 'email-already-in-use') {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'The account already exists for that email.')));
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('there is an error here')));
                            }
                            isLoading=false;
                            setState(() {
                              
                            });
                          
                          } else {}
                        },
                        text: 'Register'),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => loginPage()));
                            },
                            child: Text(
                              '  Sign In',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

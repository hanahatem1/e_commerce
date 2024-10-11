import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/register.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class loginPage extends StatefulWidget {
   loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                customTextField(
                  onChanged: (data){
                    email=data;
                  },
                  hintText: 'Enter Your Email:'
                  ),
                const SizedBox(height:30,),
                customTextField(
                  obscureText: true,
                  onChanged: (data){
                   pass=data;
                  },
                  hintText: 'Enter Your Password:'
                  ),
                const SizedBox(height: 30),
               customButton(
                onTap: () async {
              
                              if (formkey.currentState!.validate()) {
                                isLoading=true;
                                setState(() {
                                  
                                });
                                try {
                                  UserCredential user = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: email!, password: pass!);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Login Successed')));
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            'No user found for that email.')));
                                  } else if (e.code == 'wrong-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            'Wrong password provided for that user.')));
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('there is an error')));
                                }
                                isLoading=false;
                                setState(() {
                                  
                                });
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homePage()));
                              } else {}
                            },
                text: 'Sign in'
                ),
                 const SizedBox(height:50 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    GestureDetector(
                      onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage() ));
                      },
                      child: Text('  Sign Up',style: TextStyle(fontWeight: FontWeight.bold),))
                  ],
                )
                ],
              ),
            )
          ),
        ),
      ),
    );
   }
}
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/pages/checkout.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/login.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create:(context) {
        return Cart();
      },
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home:loginPage() ,
      ),
    );
  }
}
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/auth/signupPage.dart';
import 'package:myapp/bloc/productBloc.dart';
import 'package:myapp/pages/productsview.dart';
import 'package:myapp/pages/test.dart';
import 'package:myapp/pages/test_bloc.dart';
import 'package:myapp/pages/userview.dart';
import 'package:myapp/service/FirestoreService.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyAVENcdWnZluOBw9QTrj-LbKnCeatIXOzk",
      authDomain: "mypractice-8dc0e.firebaseapp.com",
      projectId: "mypractice-8dc0e",
      storageBucket: "mypractice-8dc0e.firebasestorage.app",
      messagingSenderId: "743921703863",
      appId: "1:743921703863:web:794d9fe14f0fa4b6556632",
      measurementId: "G-TQ7569EMP9"));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(FirestoreService()),
      child: MaterialApp(
        home: const Scaffold(
          body: SignUpScreen(),
        ),
        routes: {

          '/products': (context) => MyTest2(),
          // Add more routes as needed
        },
      ),
    );
  }
}

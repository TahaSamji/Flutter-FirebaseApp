import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/auth/loginpage.dart';
import 'package:flutter/material.dart';

void main(){
  testWidgets("golden tests", (WidgetTester tester)async{
    await tester.pumpWidget( const MaterialApp(
      home: LoginScreen(),
    ),);
    await expectLater(find.byType(LoginScreen ),matchesGoldenFile("login.PNG"));

  });
}
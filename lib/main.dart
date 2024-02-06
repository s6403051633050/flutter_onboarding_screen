import 'package:flutter/material.dart';
import 'package:onboarding_screen/screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';//packageเก็บไว้ใน mobile memory
import 'screen/home_screen.dart';


bool show = true;//ใช้ global var(ทุกclassเรียกได้)ใช้ในการเปิดปิด onboarding_screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance(); //final runtimeหรือcompile time prefsให้สร้างข้อมูล
  show = prefs.getBool('ON_BOARDING') ?? true; //ถ้ายังไม่หน้าสุดท้าย ON_BOARDING อ้างถึง
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: IntroScreen(),//runหน้าแรก ใส่ constหลังจาก import home_screen.dart
    );
  }
}
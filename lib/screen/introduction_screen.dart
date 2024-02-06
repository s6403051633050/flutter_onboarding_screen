import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key}); //ขัดแย้งconst ให้ลบ const ทิ้ง

  final List<PageViewModel> pages = [
    PageViewModel(
      //Fix String กำหนดเป็น widget text กำหนด style ไม่ได้ ต้องมี title,body,footer
      title: 'Connect With Everyone',
      body:
          'Here you can have whatever description you would you like to have, you can type it all in here.',
      footer: SizedBox(
        // ใส่ constไม่ได้ errorปุ่ม
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            //Widget ปุ่มกด
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text("Let's Go"),
        ),
      ),
      image: Image.network('https://www.itd.kmutnb.ac.th&#39;'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Page NO.2',
      body:
          'Here you can have whatever description you would you like to have, you can type it all in here.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text("Let's Go"),
        ),
      ),
      image: Image.network('https://www.itd.kmutnb.ac.th&#39;'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Page NO.3',
      body:
          'Here you can have whatever description you would you like to have, you can type it all in here.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text("Let's Go"),
        ),
      ),
      image: Image.network('https://www.itd.kmutnb.ac.th&#39;'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ]; //เมื่อ run program

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(  'On Boarding'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        //ต้องการ list เราก็ให้ pages var ไป
        pages: pages,
        showSkipButton: true, //ปุ่มskip
        skip: const Text('Skip'),
        showDoneButton: true, //showปุ่มdoneเมื่อถึงหน้าสุดท้ายของlist pages var
        done: const Text('Done'),
        showNextButton: true, //ปุ่มnextมีicon หัวลูกศร
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(
            context), //ถ้าหน้าสุดท้ายกระโดดไปหน้า home_screen OnDone properties ต้องการ function onDone ซึ่งต้องไปสร้างเองก่อน โดยสร้างอยู่ในclassแต่นอกWidget
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.blue,
          activeColor: Colors.orange,//หน้าที่ใช้อยู่
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          //ใน flutterหน้าจะเป็นstackต้องออกถึงหน้าที่pushเข้าไป
          builder: (context) => const HomeScreen()
      ),
    );
  }
}

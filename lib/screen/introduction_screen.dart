import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key}); //ขัดแย้งconst ให้ลบ const ทิ้ง

  final List<PageViewModel> pages = [
    PageViewModel(
      //Fix String กำหนดเป็น widget text กำหนด style ไม่ได้ ต้องมี title,body,footer
      title: 'Step 1 Filling Your Data',
      body:
          'สิ่งต่างๆ ที่จำเป็นต้องใช้ในกระบวนการหรือโครงการต่างๆ เช่น ในระบบการเรียนการสอนในชั้นเรียน อาจได้แก่ ครู นักเรียน ชั้นเรียน หลักสูตร ตารางสอน วิธีการสอน เป็นต้น ถ้าในเรื่องระบบหายใจ อาจได้แก่ จมูก ปอด กระบังลม อากาศ เป็นต้น',
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
          child: const Text("Let's Get Started!"),
        ),
      ),
    image: const CircleAvatar(
      radius: 100, 
      backgroundImage: AssetImage(
        '../../assets/images/smartphone_man.png',
      ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFFB24D3E),
        ),
        pageColor: Color(0xFFF9705A),
        bodyTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black, // Change color as needed
        ),      
      ),
    ),
    PageViewModel(
      title: 'Step 2 Data Processing',
      body:
          'การนำเอาสิ่งที่ป้อนเข้าไป มาจัดกระทำให้เกิดผลบรรลุตามวัตถุประสงค์ที่ต้องการ เช่น การสอนของครู หรือการให้นักเรียนทำกิจกรรม เป็นต้น',
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
          child: const Text("Let's Get Started!"),

        ),
      ),
    image: const CircleAvatar(
      radius: 100, 
      backgroundImage: AssetImage(
        '../../assets/images/smartphone_app.png',
      ),
      ),      
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFFB6616B),
        ),
         pageColor: Color(0xFFEE828F),
         bodyTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black, // Change color as needed
        ),        
      ),
    ),
    PageViewModel(
      title: 'Step 3 Get Results!',
      body:
          'ผลที่ได้จากการกระทำในขั้นที่สอง ได้แก่ ผลสัมฤทธิ์ทางการเรียนของนักเรียน หรือผลงานของนักเรียน เป็นต้น',
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
          child: const Text("Let's Get Started!"),
        ),
      ),
    image: const CircleAvatar(
      radius: 100, 
      backgroundImage: AssetImage(
        '../../assets/images/programming_group.png',
      ),
    ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFFA89D82),
        ),
        pageColor: Color(0xFFFFEEC8),
        bodyTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black, 
          ),      
      ),
    ),
  ]; //เมื่อ run program

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Boarding'),
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
        dotsDecorator: DotsDecorator(
          size: const Size(15, 15),
          color: Colors.grey.shade300,
          activeColor: Colors.grey.shade400,//หน้าที่ใช้อยู่
          activeSize: const Size.square(20),
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

import 'package:althaqafy/features/GetApp/app_get.dart';
import 'package:althaqafy/features/ui/screens/donation.dart';
import 'package:althaqafy/features/ui/screens/tabs/about_me.dart';
import 'package:althaqafy/features/ui/screens/tabs/contact_us_tab.dart';
import 'package:althaqafy/features/ui/screens/tabs/home_tab_screen.dart';
import 'package:althaqafy/values/colors.dart';
import 'package:althaqafy/values/constant.dart';
import 'package:althaqafy/values/images_name.dart';
import 'package:althaqafy/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppGet controllerUserGet = Get.find();
  // int selectedIndex = 2;

  // @override
  // void initState() {
    
  //   super.initState();
  //   init();
  // }

  // init() async {
  //   controllerUserGet.getAllBooks();
  //   controllerUserGet.getAllAboutMe();

  //  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOptions = <Widget>[
    AboutMeScreen(),
    HomeTabScreen(),
    ContactUsTab()
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppGet>(
      id: "selectedIndex",
      init: AppGet(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: greenColor,
            centerTitle: true,
            title: Text(controllerUserGet.selectedIndex == 0
                ? "السيرة الذاتية"
                : controllerUserGet.selectedIndex == 1
                    ? "الرئيسية"
                    : controllerUserGet.selectedIndex == 2
                        ? "تواصل معنا"
                        : "الرئيسية"),
          ),
          body: Center(
            child: widgetOptions.elementAt(controller.selectedIndex),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(50),
                  height: getHeightMedia(200, context),
                  // color: whiteColor,
                  child: Center(child: SvgPicture.asset(logosplashSvgsName)),
                ),
                ListTile(
                  title: Text("الرئيسية"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    controllerUserGet.setSelectedIndex(1);
                    Get.back();
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("تواصل معنا"),
                  trailing: Icon(Icons.arrow_forward),
                   onTap: () {
                    controllerUserGet.setSelectedIndex(2);
                    Get.back();
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("السيرة الذاتية"),
                  trailing: Icon(Icons.arrow_forward),
                   onTap: () {
                    controllerUserGet.setSelectedIndex(0);
                    Get.back();
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("تبرع لجمعيات خيرية"),
                  trailing: Icon(Icons.arrow_forward),
                   onTap: () {
                     Get.back();
                    Get.to(Donations());
                   // Get.back();
                  },
                ),
                Container(
                  height: getHeightMedia(300, context),
                  child: Align(
                     alignment: Alignment.bottomCenter,
                  child: Text("جميع الحقوق محفوظة لدي وكالة شنان للدعاية والإعلان" ,
                  textAlign: TextAlign.center,
                   style: getStyle(9, true, grayBottomColor),),
              ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: whiteColor,
            unselectedItemColor: orangeOpacityColor,
            items: const <BottomNavigationBarItem>[
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.local_offer_outlined),
              //   label: 'offer',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.notifications_none),
              //   label: 'notification',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.description),
                label: 'السيرة الذاتية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_support_sharp),
                label: 'تواصل معنا',
              ),
            ],
            currentIndex: controller.selectedIndex,
            selectedItemColor: greenOpactyColor,
            onTap: (value) {
              controller.setSelectedIndex(value);
            },
          ),
        );
      },
    );
  }
}

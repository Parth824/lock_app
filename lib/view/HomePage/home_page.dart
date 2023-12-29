import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lock_screen/main.dart';
import 'package:lock_screen/utils/ad_manager.dart';
import 'package:lock_screen/view/HomePage/home_controll.dart';
import 'package:lock_screen/view/NewPage/new_page.dart';
import 'package:lock_screen/view/UnlockPage/unlock_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.Lock1.value = sharedPreferences.getBool("Lock1") ?? false;
    print(homeController.Lock1);
    homeController.Lock2.value = sharedPreferences.getBool("Lock2") ?? false;
    print(homeController.Lock2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => InkWell(
                  onTap: () async {
                    if (homeController.Lock1.value) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UnLockPage(),
                        ),
                      );
                    } else {
                      await AdManager().loadAd(context, "1");
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage("assets/images/image1.jpg"),
                      ),
                    ),
                    child: Visibility(
                      visible: !homeController.Lock1.value,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.white.withOpacity(0.0),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 50,
                                child: Image.asset("assets/images/lock.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Obx(
                () => InkWell(
                  onTap: () async {
                    if (homeController.Lock2.value) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UnLockPage(),
                        ),
                      );
                    } else {
                      await AdManager().loadAd(context, "2");
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/image2.jpg"),
                      ),
                    ),
                    child: homeController.Lock2.value == false
                        ? BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 2),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.white.withOpacity(0.0)),
                                ),
                                Center(
                                  child: Container(
                                    height: 50,
                                    child:
                                        Image.asset("assets/images/lock.png"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

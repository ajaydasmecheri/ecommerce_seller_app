

import 'package:easybuyseller/routers.dart';
import 'package:easybuyseller/screens/addproductdetails.dart';
import 'package:easybuyseller/screens/homepage.dart';
import 'package:easybuyseller/screens/loginpage.dart';
import 'package:easybuyseller/screens/orderedproducts.dart';
import 'package:easybuyseller/screens/registerpage.dart';
import 'package:easybuyseller/screens/sellerproducts.dart';
import 'package:easybuyseller/screens/splashscreen.dart';
import 'package:easybuyseller/screens/updateproduct.dart';
import 'package:flutter/material.dart';

class Rootpage extends StatelessWidget {
  const Rootpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.splashpage,
      routes:  {
        Routers.splashpage:(context) => const Splashpage(),
        Routers.loginpage:(context) => const Loginpage(),
        Routers.registerpage:(context) => const Registerpage(),
        Routers.homepage:(context) => const Homepage(),
        Routers.addproduct:(context) => const Addproduct(),
        Routers.sellerproducts:(context) => const Sellerproducts(),
        Routers.orderedproduct:(context) => const Orderedproduct(),
        Routers.updateproduct:(context) => const Updateproduct(),

        


      },
    );
  }
}
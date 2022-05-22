import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ura_cash_back/screens/main_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ura_cash_back/screens/sign_up_page.dart';
import 'package:ura_cash_back/widgets/loader.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 24),
            child: SvgPicture.asset('assets/logo.svg',)
          ),
          const SizedBox(height: 30),
          const Loader()
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    openNextPage(context);
  }

  openNextPage(BuildContext context) async {
    Timer(const Duration(seconds: 2), () async {
      await GetStorage().initStorage;
      bool hasProfile = GetStorage().read('hasProfile') ?? false;
      if (hasProfile) {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MainPage()));
      } else {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
      }
    });
  }
}

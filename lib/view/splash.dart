import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void GoToHome() async{
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GoToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 300,),


          FadeInImage(

            placeholder : AssetImage("assets/images/logo.png"),
            image: AssetImage("assets/images/logo.png") ,

            height: 230 , width: 230,),

          Spacer(),
          Text("Developed By\nANANTA" ,textAlign: TextAlign.center ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
        ],
      )),
    );
  }
}

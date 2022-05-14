import 'package:flutter/material.dart';
import 'package:services/view/sign_in_screen.dart';
import 'package:services/view/sing_up_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(

          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black87, Colors.orange]),),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset('assets/images/PassengER.png',height: 350,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return SignInScreen();
                          }));
                        }, child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5,fontSize: 18),),
                        style: ElevatedButton.styleFrom(primary: Color(0xffFAF9F5),onPrimary: Color(0xffF4BE78)),
                        ),
                      ),


                    ],
                  ),

                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(children: [
                  Expanded(child: Divider(color: Colors.white70,)),
                  Text('OR',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),
                   Expanded(child: Divider(color: Colors.white70,)),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(

                        child: Container(

                          height: 37,
                          decoration: BoxDecoration(
                            color: Color(0xffFC9C2B),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: OutlinedButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return SignUpScreen();
                            }));
                          }, child: Text('Register Now',style: TextStyle(color: Color(0xffFEE9CC),letterSpacing: 0.5,fontSize: 18 ),

                          ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
          backgroundColor: Colors.transparent,
      ),
    );
  }
}

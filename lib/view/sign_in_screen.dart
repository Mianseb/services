import 'package:flutter/material.dart';

import 'package:services/view/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey, Colors.white]),),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Form(
            key: formKey,
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                              return HomeScreen();
                            }), (route) => false);
                          },
                            icon: Icon(Icons.arrow_back),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/1.png',
                        height: 200,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Mian@gmail.com',
                          prefixIcon: Icon(Icons.email),
                          label: Text('Email'),
                        ),
                        validator: (value) {
                          return value!.isEmpty ? 'Provide Email' : null;
                        },
                      ),
                      TextFormField(
                        obscureText: pass,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: '**********',
                          prefixIcon: Icon(Icons.security),
                          label: Text('Password'),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                    () {
                                  pass = !pass;
                                },
                              );
                            },
                            icon: Icon(
                                pass ? Icons.visibility_off : Icons.visibility),
                          ),
                        ),
                        validator: (value) {
                          return value!.isEmpty ? 'Provide Password' : null;
                        },
                      )
                    ],
                  ),
                ),
//************************** Sign In Button Code *****************************
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                print('Successfully');
                              }
                            },
                            child: Text('Sign In')),
                      ),
                    ],
                  ),
                ),

//************************** Forget Password Code ****************************

                GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Forget Password',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    )),

//************************** Sign in Text Code    ****************************

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(children: [
                    Expanded(child: Divider(color: Colors.blueGrey,)),
                    Text('Sign in with',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                    Expanded(child: Divider(color: Colors.blueGrey,)),
                  ],),
                ),

//************************** Google And FaceBook Code ************************

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          margin:EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Image.asset('assets/images/googleIcon.png',height: 50,),
                              Text('  Google',style: TextStyle(color: Colors.red),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          margin:EdgeInsets.only(left: 20),

                          child: Row(

                            children: [
                              Image.asset('assets/images/facebook.png',height: 50,),
                              Text('Facebook',style: TextStyle(color: Colors.blue),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
              ],
            ),
          )),
        ),
        backgroundColor: Colors.transparent
      ),
    );
  }
}

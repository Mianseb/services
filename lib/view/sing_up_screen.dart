import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:services/view/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpassword = TextEditingController();
  var nameController = TextEditingController();
  var contactController = TextEditingController();
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
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/signUp.png',
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'userName',
                            prefixIcon: Icon(Icons.person),
                            label: Text('Name'),
                          ),
                          validator: (value) {
                            return value!.isEmpty ? 'Provide Name' : null;
                          },
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
                          ),
                          validator: (value) {
                            return value!.isEmpty ? 'Provide Password' : null;
                          },
                        ),
                        TextFormField(
                            obscureText: pass,
                            controller: confirmpassword,
                            decoration: InputDecoration(
                              hintText: '**********',
                              prefixIcon: Icon(Icons.security),
                              label: Text('Confirm Password'),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      pass = !pass;
                                    },
                                  );
                                },
                                icon: Icon(pass
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) return 'Empty';

                              return null;
                            }),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: contactController,
                          decoration: InputDecoration(
                            hintText: '03159223522',
                            prefixIcon: Icon(Icons.phone_android),
                            label: Text('Contact'),
                          ),
                          validator: (value) {
                            return value!.isEmpty ? 'Provide Number' : null;
                          },
                        ),
                      ],
                    ),
                  ),
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

                                  if(passwordController.text !=confirmpassword.text){
                                    Fluttertoast.showToast(msg: 'Password does not match');
                                    return ;
                                  }
                                  Fluttertoast.showToast(
                                      msg: 'Successfully Registered');
                                }
                              },
                              child: Text('Sign Up')),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(children: [
                      Expanded(child: Divider(color: Colors.blueGrey,)),
                      Text('Sign Up with',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                      Expanded(child: Divider(color: Colors.blueGrey,)),
                    ],),
                  ),
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
            ),
          ),
        ),
          backgroundColor: Colors.transparent
      ),
    );
  }
}

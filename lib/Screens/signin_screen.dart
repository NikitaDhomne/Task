import 'package:bynry_task/Screens/dashboard.dart';
import 'package:bynry_task/Screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool loader = false;

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  void login() {
    setState(() {
      loader = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passController.text.toString())
        .then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
      setState(() {
        loader = false;
      });
    }).catchError((e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 250,
                width: 300,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            'images/warning.png',
                            fit: BoxFit.cover,
                          )),
                      Text(
                        'Invalid Credentials',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF1FB141), // background color
                          foregroundColor: Colors.white, // text color
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      )
                    ]),
              ),
            );
          });
      setState(() {
        loader = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff5100E1),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 16, top: 80),
              alignment: Alignment.topLeft,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Log into your account',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color(0xffEBEBEB),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 350,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Enter the Email ID',
                                ),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '* Email is required.';
                                  }
                                  if (!value.contains('@')) {
                                    return '* Must contain @.';
                                  }
                                  if (!value.endsWith('.com') &&
                                      !value.endsWith('.in') &&
                                      !value.endsWith('.co') &&
                                      !value.endsWith('.gov') &&
                                      !value.endsWith('.edu')) {
                                    return '* Enter valid email id';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: passController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: hidePassword
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                  ),
                                  labelText: 'Password',
                                ),
                                obscureText: hidePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '* Password is required';
                                  }
                                  if (value.length < 6) {
                                    return '* Password should have atleast 6 characters long';
                                  }
                                  if (value.length > 15) {
                                    return '* Password should not be greater than 15 characters';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color(0xff5100E1),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a Snackbar.
                                    login();
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffF6501E),
                                  ),
                                  height: 40,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an Account ? ',
                              style: TextStyle(fontSize: 16),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Color(0xff5100E1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ])),
          Container(
            height: 10,
          )
        ],
      ),
    );
  }
}

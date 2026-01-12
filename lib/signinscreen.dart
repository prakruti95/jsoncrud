import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsoncrud/main.dart';
import 'package:jsoncrud/signupscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signinscreen extends StatefulWidget
{
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen>
{

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late SharedPreferences sharedPreferences;
  var newuser;

  @override
  void initState()
  {
    checkvalue();

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Signin Here"),),
      body: Center
        (
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column
            (
            children:
            [


              TextFormField(controller:email,decoration: InputDecoration(hintText: "Enter Email")),
              SizedBox(height: 10,),
              TextFormField(controller:password,decoration: InputDecoration(hintText: "Enter Password")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()
              {


                String myemail = email.text.toString();
                String mypass = password.text.toString();
                sharedPreferences.setBool("tops", false);
                sharedPreferences.setString("email", myemail);

                login(email: myemail,pass: mypass);

                //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ViewScreen()));



              }, child: Text("Signin")),

              TextButton(onPressed: ()
              {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignupScreen()));
              }, child: Text("Do you want to signup?"))


            ],
          ),
        ),
      ) ,
    );
  }

  void login({var email,var pass}) async
  {
    var url = Uri.parse("https://prakrutitech.xyz/krish/signin.php");
    var resp = await http.post(url,body:
    {

      "email":email,
      "password":pass

    });
    var data = json.decode(resp.body);
    if(data==0)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Fail")));
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));

      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ViewScreen()));
    }
  }

  checkvalue()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    newuser = sharedPreferences.getBool("tops")??true;

    if(newuser==false)
    {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ViewScreen()));

    }
  }
}

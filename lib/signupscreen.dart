import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsoncrud/main.dart';

import 'signinscreen.dart';
class SignupScreen extends StatefulWidget
{
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
{
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Signup Here"),),
      body: Center
        (
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column
            (
            children:
            [

              TextFormField(controller:name,decoration: InputDecoration(hintText: "Enter Name"),),
              SizedBox(height: 10,),
              TextFormField(controller:mobile,decoration: InputDecoration(hintText: "Enter Mobile")),
              SizedBox(height: 10,),
              TextFormField(controller:email,decoration: InputDecoration(hintText: "Enter Email")),
              SizedBox(height: 10,),
              TextFormField(controller:password,decoration: InputDecoration(hintText: "Enter Password")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()
              {

                String myname = name.text.toString();
                String myemail = email.text.toString();
                String mymob = mobile.text.toString();
                String mypass = password.text.toString();

                signup(name: myname,email: myemail,mob: mymob,pass: mypass);

                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Signinscreen()));



              }, child: Text("Signup")),

              TextButton(onPressed: ()
              {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Signinscreen()));
              }, child: Text("Do you want to login?"))



            ],
          ),
        ),
      ) ,
    );
  }

  void signup({var name,var mob,var email,var pass}) async
  {
    var url = Uri.parse("https://prakrutitech.xyz/krish/signup.php");
    var resp = await http.post(url,body:
    {
      "name":name,
      "mobile":mob,
      "email":email,
      "password":pass

    });
    print(resp.statusCode);
    print("Executed");
  }
}

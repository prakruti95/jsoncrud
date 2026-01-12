import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsoncrud/main.dart';
class Updatescreen extends StatefulWidget
{
  var id;
  var pname;
  var pprice;
  var pdes;
  Updatescreen({required this.id,required this.pname,required this.pprice,required this.pdes});

  @override
  State<Updatescreen> createState() => _UpdatescreenState();
}

class _UpdatescreenState extends State<Updatescreen>
{
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    pname.text  =widget.pname;
    pprice.text  =widget.pprice;
    pdes.text  =widget.pdes;


  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Update Data : ${widget.id}"),),
      body: Center
        (
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column
            (
            children:
            [

              TextFormField(controller:pname,decoration: InputDecoration(hintText: "Enter Product Name"),),
              SizedBox(height: 10,),
              TextFormField(controller:pprice,decoration: InputDecoration(hintText: "Enter Product Price")),
              SizedBox(height: 10,),
              TextFormField(controller:pdes,decoration: InputDecoration(hintText: "Enter Product Description")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()
              {

                String product_name = pname.text.toString();
                String product_price = pprice.text.toString();
                String product_des = pdes.text.toString();

                updatedata(product_name,product_price,product_des);

                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ViewScreen()));



              }, child: Text("Update"))


            ],
          ),
        ),
      ) ,
    );
  }

  void updatedata(String product_name, String product_price, String product_des) async
  {
    var url = Uri.parse("https://prakrutitech.xyz/krish/update.php");
    var resp = await http.post(url,body:
    {
      "p_name":product_name,
      "p_price":product_price,
      "p_des":product_des,
      "id":widget.id
    });
    print(resp.statusCode);
    print("Executed");
  }
}

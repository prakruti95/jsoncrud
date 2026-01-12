import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsoncrud/UpdateScreen.dart';
import 'package:jsoncrud/main.dart';
class MyModel extends StatelessWidget
{
     var list;
    MyModel({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(itemCount:list.length,itemBuilder:(context,index)
    {
        return ListTile
          (
            title: Column
              (
                children:
                [
                    Text(list[index]["p_name"]),
                    Text(list[index]["p_price"])
                ],
              
              ),
            subtitle: Text(list[index]["p_des"]) ,
            trailing: Wrap
              (
                children:
                [
                    IconButton(onPressed: ()
                    {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Updatescreen(id:list[index]["id"],pname:list[index]["p_name"],pprice:list[index]["p_price"],pdes:list[index]["p_des"])));
                    }, icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: ()
                      {
                        deletedata(list[index]["id"]);
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ViewScreen()));
                        }, icon: Icon(Icons.delete)),

                ],
              ),
          );
    });
  }

  void deletedata(var id) async
  {
    var url = Uri.parse("https://prakrutitech.xyz/krish/delete.php");
    var resp = await http.post(url,body:
    {
      "id":id,

    });
    print(resp.statusCode);

  }
}

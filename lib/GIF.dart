import 'dart:convert';
import 'package:MemeLand/DataFunctionAPI.dart';
import 'package:MemeLand/Notes.dart';
import 'package:MemeLand/UserID.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'HTTPFunction.dart';

class GIF extends HTTPFunction
{
  List<Widget> listGif;
  List<Widget> listGif2;
  bool isCorrect;
  String userID;

  GIF(UserID user)
  {
    listGif = [];
    listGif2 =[];
    userID = user.id;
    name = 'MemeLand';
    limit = 10;
  }

  @override
  void connection(DataFunctionAPI function,context) async
  {
    Response response = await get(function.dataFunction());
    if(response.statusCode ==200)
      {
        Provider.of<NotesGif>(context,listen: false).activeAPI();
        decodeInJason(response.body);
      }
    else
      {
        print(response.statusCode);
      }
  }

  @override
  void decodeInJason(String response)
  {
      dynamic data = jsonDecode(response);

      if(name!='MemeLand') {
        listObjects(data);
      }
      else
        listRandomObjects(data);
  }

  void searchNewResults(String name,context,DataFunctionAPI function)
  {
    this.name = name;
    connection(function,context);
  }

  void visualizeGifResponse(dynamic data, int index) async
  {
    int datetime = DateTime.now().millisecond;
    Response response = await get(data['data'][index]['analytics']['onload']['url']+'&ts=$datetime'+'&random_id=$userID');
    if(response.statusCode!=200)
      {
        print(response.statusCode);
      }
  }

  void listObjects(dynamic data)
  {
    listGif.clear();
    listGif2.clear();
    for(int i =0; i < limit; i++)
    {
      if(i<limit/2)
      {
        listGif.add(Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.network(
                data['data'][i]['images']['downsized_large']['url'])
        ));
        visualizeGifResponse(data, i);
      }
      else
        {
        listGif2.add(Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.network(
                data['data'][i]['images']['downsized_large']['url'])
        ));
        visualizeGifResponse(data, i);
        }

    }
  }

  void listRandomObjects(dynamic data)
  {
    listGif.clear();
    listGif2.clear();
    for(int i =0; i < limit; i++)
    {
      if(i<limit/2)
      {
        listGif.add(Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.network(
                data['data']['images']['downsized_large']['url'])
        ));
      }
      else
      {
        listGif2.add(Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.network(
                data['data']['images']['downsized_large']['url'])
        ));
      }

    }
  }

}
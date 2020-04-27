import 'dart:convert';
import 'package:MemeLand/DataFunctionAPI.dart';
import 'package:MemeLand/HTTPFunction.dart';
import 'package:MemeLand/Notes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class UserID extends HTTPFunction
{
  String id;

  UserID()
  {
    id = '';
  }

  @override
  Future<void> connection(DataFunctionAPI function,BuildContext context)async
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
    id = data['data']['random_id'];
  }

}
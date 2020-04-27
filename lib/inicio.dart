import 'dart:ui';
import 'package:MemeLand/DataFunctionAPI.dart';
import 'package:MemeLand/DialogDescription.dart';
import 'package:MemeLand/FunctionIDAleatory.dart';
import 'package:MemeLand/FunctionRandomSearchGif.dart';
import 'package:MemeLand/FunctionSearchGif.dart';
import 'package:MemeLand/GIF.dart';
import 'package:MemeLand/Notes.dart';
import 'package:MemeLand/UserID.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowGif extends StatefulWidget
{
  @override
  _ShowGifState createState() => _ShowGifState();
}

class _ShowGifState extends State<ShowGif>
{

  UserID user = new UserID();
  GIF gif;
  bool isSearch = true;
  List<Widget> iconsSearch,iconsScreen;
  DataFunctionAPI function;
  static const String description = 'Description';
  static const List<String> choices = [description];

  void choiceAction(String value)
  {
      DialogDescription.dialogShow(context);
  }

  Future<void> wait() async
  {
    user = new UserID();
    function = new FunctionIDAleatory(user);
    await user.connection(function,context);
    gif = new GIF(user);
    function = new FunctionRandomSearchGif(gif, user);
    gif.connection(function,context);
  }

  @override
  void initState()
  {
    wait();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    iconsScreen =
    [
      IconButton(icon: Icon(Icons.search), onPressed: (){isSearch=false; setState(() {});}),
      PopupMenuButton<String>(onSelected: choiceAction,
          itemBuilder: (BuildContext context) {return choices.map((String choice){
            return PopupMenuItem<String>(value: choice,child: Text(choice));
          }).toList();})
    ];

    iconsSearch = [
      IconButton(icon:Icon(Icons.cancel),onPressed: (){
        isSearch=true;setState(() {});}),
      IconButton(icon:Icon(Icons.arrow_forward), onPressed:()
      {
        if(gif.name!=null && gif.name!='MemeLand')
        {
          function = new FunctionSearchGif(gif);
          gif.searchNewResults(gif.name,context,function);
          setState(() {});
        }
        isSearch=true;
      })];

    if(Provider.of<NotesGif>(context).isCorrect) {
      return Scaffold(
          appBar: AppBar(
              title: isSearch?  Text(gif.name,style: TextStyle(fontSize: 30),) :
              TextFormField(decoration:
              InputDecoration(icon: Icon(Icons.search,color: Colors.white,),
                  hintText: 'Search your Gifs',
                  hintStyle: TextStyle(color: Colors.white)),onChanged: (String value){gif.name = value;setState(() {});},
                style: TextStyle(color:Colors.white)),
              backgroundColor: Color(0xFFB74093),
            actions: isSearch ? iconsScreen:iconsSearch
          ),backgroundColor: Color(0xFFB323232),
        body: SingleChildScrollView(child: Column(
          children:<Widget>[
            Row(children: <Widget>[
              Flexible(child: Column(children: gif.listGif,)),
              Flexible(child: Column(children: gif.listGif2,crossAxisAlignment: CrossAxisAlignment.stretch,),)]),
            Container(child: Image(image: AssetImage('assets/images/logo2.png')),width: 150,)],
        ),

      ));
    }
    else
    return Scaffold(
      body: Center(child: CircularProgressIndicator(backgroundColor: Colors.blue)),
    );
  }


}



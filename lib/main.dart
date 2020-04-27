import 'package:MemeLand/Notes.dart';
import 'package:MemeLand/inicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create:(context)=>NotesGif())],
        child:MaterialApp(home: ShowGif(),theme: ThemeData(fontFamily: 'DORAEMON'),
            debugShowCheckedModeBanner: false));

  }
}

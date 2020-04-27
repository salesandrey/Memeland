import 'package:flutter/material.dart';

class DialogDescription
{
    static void dialogShow(BuildContext context)
    {
      showDialog(context: context, builder: (BuildContext context){ return AlertDialog(
          title: Text('Sobre o Aplicativo'),actions: <Widget>[Text('Trabalho academico sobre o uso do padrao de projetos GOF Brigde e utilizando API de gifs animados',
        style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Developer: Andrey Sales', style: TextStyle(fontSize: 15),textAlign: TextAlign.end,),
          )],);});
    }
}

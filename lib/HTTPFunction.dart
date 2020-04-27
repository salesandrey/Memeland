
import 'package:MemeLand/DataFunctionAPI.dart';
import 'package:flutter/cupertino.dart';

abstract class HTTPFunction
{
  String keyAP = 'KBJxythG3nhYN2XQPLFsYrDtb7znPFnK';
  int limit;
  String name;

  void connection(DataFunctionAPI function, BuildContext context);

  void decodeInJason(String response);

  String removerSpaceCharacter(String name)
  {
    String current = name;
    current.replaceAll(' ', '-');
    return current;
  }

}





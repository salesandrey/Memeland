

import 'package:MemeLand/DataFunctionAPI.dart';
import 'package:MemeLand/GIF.dart';

class FunctionSearchGif extends DataFunctionAPI
{

  String nameKey;
  String keyAP;
  int limit;

  FunctionSearchGif(GIF gif)
  {
   keyAP = gif.keyAP;
   limit = gif.limit;
   nameKey = gif.removerSpaceCharacter(gif.name);
  }

  @override
  String dataFunction()
  {
    return 'http://api.giphy.com/v1/gifs/search?q=$nameKey&api_key=$keyAP&limit=$limit';
  }
}
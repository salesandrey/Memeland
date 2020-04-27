

import 'package:MemeLand/GIF.dart';
import 'package:MemeLand/UserID.dart';
import 'DataFunctionAPI.dart';

class FunctionRandomSearchGif extends DataFunctionAPI
{

  String tag;
  String keyAP;
  String randomId;

  FunctionRandomSearchGif(GIF gif,UserID user)
  {
    keyAP = gif.keyAP;
    randomId = user.id;
    tag = 'Memes';
  }


  @override
  String dataFunction()
  {
    return 'http://api.giphy.com/v1/gifs/random?api_key=$keyAP&tag=$tag&random_id=$randomId';
  }

}
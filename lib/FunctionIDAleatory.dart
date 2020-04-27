

import 'package:MemeLand/DataFunctionAPI.dart';
import 'package:MemeLand/UserID.dart';

class FunctionIDAleatory extends DataFunctionAPI
{

  String apiKey;

  FunctionIDAleatory(UserID user)
  {
    apiKey = user.keyAP;
  }

  @override
  String dataFunction()
  {
    return 'http://api.giphy.com/v1/randomid?api_key=$apiKey';
  }

}
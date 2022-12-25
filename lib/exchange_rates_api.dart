import 'dart:convert';

import 'package:http/http.dart' as http;

class ExchangeCurrency{
  String _apiKey = '67E16E4A-8726-4AF9-8626-054A152A42D8';
  String from;
  String to;
  
  Future getExchange(String from,String to) async {
    String url = 'https://rest.coinapi.io/v1/exchangerate/$to/$from?apikey=$_apiKey';
    try{
      http.Response data = await http.get(Uri.parse(url));
      if(data.statusCode == 200)
        return json.decode(data.body);
      else
        return data.statusCode;
    }
    catch(e){
      print(e);
    }

  }

  ExchangeCurrency({this.from,this.to});



}
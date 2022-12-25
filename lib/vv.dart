import 'dart:convert';
import 'exchange_rates_api.dart';
void main() {

  getData();

}

void getData() async{
  ExchangeCurrency ec = ExchangeCurrency();

  dynamic data = await ec.getExchange('USD', 'SOL');

  print(data['rate']+1);
}

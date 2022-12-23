import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String itemSelected = '';

  Widget AndroidPicker(){
    List<DropdownMenuItem<String>> items = [];
    for(final v in currenciesList){
      items.add(DropdownMenuItem(child:
      Text(v),value: v,));
    }

    return DropdownButton<String>(
      onChanged:(String? value){},
      items: items,
    );

  }

  Widget IOSPicker(){
    List<Text> items = [];
    for(final v in currenciesList)
      items.add(Text(v));

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (itemSelected){
        print(itemSelected);
      },
      children: items,

    );


  }

  Widget getPicker(){
    if(Platform.isIOS){
      return IOSPicker();
    }
    else{
      return AndroidPicker();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}

/*
DropdownButton<String>(
              onChanged:(String? value){},
              items: displayDropDownItems(),
            ),
 */
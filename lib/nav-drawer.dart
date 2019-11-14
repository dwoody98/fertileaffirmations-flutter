import 'dart:io';
import 'dart:math';

import 'package:fertile_affirmations/card-class.dart';
import 'package:fertile_affirmations/card-screen.dart';
import 'package:fertile_affirmations/custom-affirmation.dart';
import 'package:flutter/material.dart';
import 'package:fertile_affirmations/main.dart';
import 'card-screen-random.dart';
import 'select-goddess.dart';
import 'collection-screen.dart';
import 'package:flutter/foundation.dart';
import 'card-class.dart';
import 'main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';




class MyNavigationDrawer extends StatelessWidget {
  Widget routeTo2;
  

  Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset Application?'),
        content: const Text('Pressing "ok" will clear all favorites and created cards. Are you sure?')
        ,
        actions: <Widget>[
            FlatButton(
            child: Text('Cancel'),
            onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            routeTo2=null;

            },
          ),
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              resetApp();
              routeTo2=MyHomePage(preference: true,);

              
            
            Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        
        ],
      );
    },
  );
}

  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/noleaves2.png'), fit: BoxFit.cover),
          border: Border(top: BorderSide.none, bottom: BorderSide.none)
        ),
        child: ListView(
          
          children: <Widget>[
            Divider(),
            menuItem("Instructions", Icons.info, SelectGoddess(), context), 
            menuItem("Affirmation", Icons.photo_library, MyCardRandom(), context),
            menuItem("Collection", Icons.apps, Collection(fave:false), context), 
            menuItem("Custom Affirmation", Icons.add, CustomAffirmation(), context), 
            menuItem("Favorites", Icons.favorite, Collection(fave:true), context), 
            menuItem("Remind Me", Icons.alarm, MyHomePage(preference: true,), context), 
            menuItem("Reset", Icons.restore, null, context), 
            menuItem("Select Your Goddess", Icons.people, SelectGoddess(), context), 
            Divider(), 
            menuItem("Share", Icons.share, null, context), 
            menuItem("Learn More", Icons.mail, null, context), 
            menuItem("Purchase Deck", Icons.shopping_cart, null, context)
          ],
        ),
      ),
    );
  }
    Widget menuItem (String title, IconData icon, Widget routeTo, BuildContext context) { 
    return ListTile(
      dense: true,
              title: new Text(title, style: TextStyle(color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
              trailing: Icon(Icons.chevron_right),
              leading: Icon(icon),
              onTap: () async {
                if(title == "Reset"){
                  await _ackAlert(context);
                  routeTo = this.routeTo2;

                }
                
                else if (title == "Share"){
                  Share.share('Fertile Affirmations is a mindfullness based tool created to help motivate and support you during your family building journey. Check it out at:\nhttp://fertileaffirmations.com/');

                }
                else if(title =="Learn More"){
                  _launchURL("https://fertileaffirmations.com");
                
                }
                else if(title =="Purchase Deck"){
                  _launchURL("https://fertileaffirmations.com/shop");
                
                }

                if(routeTo != null){
                  Navigator.of(context).pop();
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => routeTo,)
                  );
              }
              },
            );
}
  _launchURL(url) async {
    
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}
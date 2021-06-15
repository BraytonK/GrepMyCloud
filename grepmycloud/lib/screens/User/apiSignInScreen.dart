import 'package:flutter/material.dart';

class APISignInPage extends StatefulWidget {
  @override
  APISignInPageState createState() => APISignInPageState();
}

class APISignInPageState extends State<APISignInPage> {
  @override
  Widget build(BuildContext context) {
    AssetImage appLogoAsset = AssetImage('lib/assets/transparentLogo.png');
    Image appLogoImage = Image(image: appLogoAsset, width: 32, height: 32);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          appLogoImage,
          Container(
              padding: const EdgeInsets.all(8.0), child: Text('Grep My Cloud'))
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 145),
              child: Center(
                child: Container(
                    height: 50,
                    width: 250,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Text('Enter Key: ',
                        style: TextStyle(color: Colors.black, fontSize: 25))),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid api key as {prefix}{hash}'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/bookshelf'),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}

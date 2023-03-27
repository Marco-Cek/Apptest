import 'dart:convert';

import 'package:apptest/screen/registrationName.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class LogInPage extends StatefulWidget {
  static const routeName = "login";

  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

   String? name, pass;
   bool loading=true;


  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((share) {
      name= share.getString("nomeSalvato");
      loading = false;
      setState(() {
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return loading?Container(color: Colors.white,
        child: Center(child: CircularProgressIndicator(),)):Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FlutterLogo(
                      size: 126.h,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: name),
                      onChanged: (value) async {
                        print("---SONO NEL ONCHENGE");
                        name = value;
                        if(name!=null)
                        await saveName(name!);
                      },
                      style: Theme.of(context).textTheme.bodyText2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "il campo e richiesto";
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "non è un email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        pass = value;
                      },
                      obscureText: true,
                      style: Theme.of(context).textTheme.bodyText2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "il campo e richiesto";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MaterialButton(
                        color: Theme.of(context).primaryColor,
                        disabledColor: Colors.yellowAccent,
                        child: const Text(
                          "login",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //fare le operazioni se i campi ci sono

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    title: Text('data',style: Theme.of(context).textTheme.bodyText2,),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("$name $pass",style: Theme.of(context).textTheme.bodyText2,)
                                     // name+" "+pass
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      MaterialButton(
                                          child: const Text("ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            // your code
                                          })
                                    ],
                                  );
                                });
                          }
                        }),
                    SizedBox(
                      height: 24.h,
                    ),
                    MaterialButton(
                        color: Theme.of(context).primaryColor,
                        disabledColor: Colors.yellowAccent,
                        child: const Text(
                          "api rest",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {


                          https://api.zippopotam.us/us/33162

                          var url =
                          Uri.https('api.zippopotam.us',"/us/90210",);
                          // Await the http get response, then decode the json-formatted response.
                          var response = await http.post(url,headers: {"Content-Type":"application/json"},
                          body:  {'name': 'doodle', 'color': 'blue'});

                          if (response.statusCode == 200) {

                            var body=jsonDecode(response.body);

                            print(body);


                          } else {
                            print('Request failed with status: ${response.statusCode}.');
                          }

                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: RichText(
                            text:  TextSpan(children: [
                              const TextSpan(
                                  text: "Non hai un account?",
                                  style: TextStyle(color: Colors.grey)),
                              TextSpan(
                                  text: "Vai alla pagina di registrazione!",
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      decorationThickness: 8,
                                      decorationStyle: TextDecorationStyle.wavy),
                                  recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(context, RegistrationName.routeName)

                                  ),

                            ], style: const TextStyle(color: Colors.yellow))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveName(String name) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    await share.setString("nomeSalvato", name);
  }
}

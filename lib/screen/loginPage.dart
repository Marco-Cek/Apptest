import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInPage extends StatefulWidget {
  static const routeName = "login";

  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late String name, pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  FlutterLogo(
                    size: 126.h,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      name = value;
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
                          //fare le iperazioni se i campi ci sono

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
                                        child: Text("ok"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          // your code
                                        })
                                  ],
                                );
                              });
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

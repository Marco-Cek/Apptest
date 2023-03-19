import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationName extends StatefulWidget {
  static const routeName = "registration";

  const RegistrationName({Key? key}) : super(key: key);

  @override
  State<RegistrationName> createState() => _RegistrationNameState();
}

class _RegistrationNameState extends State<RegistrationName> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late String name, pass;
  late String  number;
  late String? sex = "Male";

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
                    TextFormField(
                      onChanged: (value) {
                        number = value;
                      },
                      style: Theme.of(context).textTheme.bodyText2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "il campo e richiesto";
                        }
                        if (!RegExp(
                            r"(^(?:[+0]9)?[0-9]{10,12}$)")
                            .hasMatch(value)) {
                          return "non è un numero";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Inserisci qui il tuo numero',
                          hintText: 'Enter valid number'),
                      //style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    DropDown(
                      onChanged: (value) {
                        sex = value!;
                        print;
                      },
                      items: const ["Male", "Female", "Other"],
                      hint: const Text("Male"),
                      icon: const Icon(
                        Icons.expand_more,
                        color: Colors.blue,
                      ),

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
                                          Text("name: $name,\npassword: $pass,\nn. di telefono: $number,\ngenere: $sex",style: Theme.of(context).textTheme.bodyText2,)
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

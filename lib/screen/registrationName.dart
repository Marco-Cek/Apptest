import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
  late String number;
  late String? sex = "Male";
  late DateTime dateTime = DateTime.now();
  String? formattedDate;
    String peppe="";

  late TextEditingController controller;


  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text="peppe";
  }

  dynamic _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2099),
    ).then((value) {
      setState(() {
        dateTime = value!;
        formattedDate=DateFormat("dd-MM-yyyy").format(dateTime);
        peppe=formattedDate ?? "--";  // formattedDate!=null ? formattedDate : "--"
      });
    });
  }

  //text(perona!.email!)


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        key: _scaffoldKey,
      ),
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
                      controller: controller,
                      style: Theme.of(context).textTheme.bodyText2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "il campo e richiesto";
                        }
                        if (!RegExp(
                                r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "non è un email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Inserisci qui la tua mail',
                          hintText: 'Enter valid mail'),
                    ),
                    SizedBox(
                      height: 20.h,
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Inserisci qui la tua password',
                          hintText: 'Enter valid psw'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        number = value;
                      },
                      style: Theme.of(context).textTheme.bodyText2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "il campo e richiesto";
                        }
                        if (!RegExp(r"(^(?:[+0]9)?[0-9]{10,12}$)")
                            .hasMatch(value)) {
                          return "non è un numero";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Inserisci qui il tuo numero',
                          hintText: 'Enter valid number'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: TextEditingController()..text=formattedDate??"no date",
                      onTap: _showDatePicker,
                      style: Theme.of(context).textTheme.bodyText2,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DropDown(
                      onChanged: (value) {
                        sex = value!;
                        print;
                      },
                      items: const ["Male", "Female", "Other"],
                      hint: const Text("Sesso"),
                      icon: const Icon(
                        Icons.expand_more,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    MaterialButton(
                        minWidth: double.infinity,
                        height: 40.h,
                        color: Theme.of(context).primaryColor,
                        disabledColor: Colors.yellowAccent,
                        child: const Text(
                          "Iscriviti",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //fare le operazioni se i campi ci sono

                            String nome=controller.value.text;
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    title: Text(
                                      'Dati:',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Mail: $name,\nPsw: $pass,\nN. telefonico: $number,\nData di nascita: $formattedDate,\nGenere: $sex",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          )
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


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

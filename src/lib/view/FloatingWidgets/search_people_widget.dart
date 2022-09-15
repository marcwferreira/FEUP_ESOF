import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/controller/profile_info/profile_info_database.dart';
import 'package:uni/globals.dart';

import '../../model/entities/person.dart';
import '../../utils/peopleApi.dart';
import 'package:uni/globals.dart';

void search_people(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SearchProfileWindow(),
        );
      });
}

class SearchProfileWindow extends StatelessWidget {

  ValueNotifier<String> changeValue = ValueNotifier<String>('');
  final _formKey = GlobalKey<FormState>();

  SearchProfileWindow();

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: Key('search_people_popup'),
      overflow: Overflow.visible,
      children: <Widget>[
        SizedBox(
            width: 900,
            height: 225,
            child: Column(
              children: [
                ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 75),
                    child: Column(children: [
                      Container(
                        child: Text("Pesquisa",
                            key: Key('search_window_title'),
                            style: Theme.of(context).textTheme.headline1.apply(
                                fontSizeDelta: -53, fontWeightDelta: -3)),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 0.5),
                        margin: EdgeInsets.only(top: 0.5, bottom: 0.5),
                      ),
                    ])),
                ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 150),
                    child: Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          key: Key('search_windows_form'),
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                key: Key('search_window_form_text'),
                                autofocus: true,
                                decoration:
                                    InputDecoration(hintText: "Nome ou número UP"),
                                onChanged: (text) {
                                  changeValue = ValueNotifier<String>(text);
                                },
                              ),
                            ),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  key: Key('search_window_cancel_button'),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.redAccent,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  key: Key('search_window_search_button'),
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.redAccent,
                                  onPressed: () async {
                                    people = await PeopleApi.getPeople(changeValue.value);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Pesquisar",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              )
                            ])
                          ],
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 0.5, bottom: 0.5),
                    ))
              ].where((e) => e != null).toList(),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ))
      ],
    );
  }
}

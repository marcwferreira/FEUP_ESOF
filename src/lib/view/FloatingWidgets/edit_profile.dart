import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/controller/profile_info/profile_info_database.dart';
import 'package:uni/globals.dart';

void edit_popup(BuildContext context, String title, ProfileAttribute profileAttribute) {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: EditProfileWindow(title, profileAttribute),
          );
        });
}

class EditProfileWindow extends StatelessWidget {
  ProfileAttribute profileAttribute;
  String title;

  ValueNotifier<String> changeValue = ValueNotifier<String>('');
  final _formKey = GlobalKey<FormState>();

  EditProfileWindow(this.title, this.profileAttribute);

  @override
  Widget build(BuildContext context) {
      return Stack(
        key: Key('edit_window_popup'),
          overflow: Overflow.visible,

          children: <Widget>[
            SizedBox(
              width: 900,
              height: 225,
              child: Column(
              children: [

                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 75),
                   child : Column(
                    children: [
                      Container(
                      child:
                        Text(title,
                          key: Key('edit_window_title'),
                          style: Theme.of(context)
                          .textTheme
                          .headline1
                          .apply(
                          fontSizeDelta: -53,
                          fontWeightDelta: -3)),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 0.5),
                      margin: EdgeInsets.only(top: 0.5, bottom: 0.5),
                      ),
                      Container(
                      child:
                        Text(
                          profileAttribute.attribute+':',
                          key: Key('edit_window_attribute_title'),
                          ),
                      alignment: Alignment.centerLeft,
                      ),
                    ]

                  )
                  
                ),

                ConstrainedBox(
                   constraints: const BoxConstraints(maxHeight: 150),
                  child: Container(
                    child:
                      Form(
                        key: _formKey,
                        child: Column(
                          key: Key('edit_window_form'),
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                key: Key('edit_window_form_text'),
                                autofocus: true,
                                decoration: InputDecoration(hintText: profileAttribute.value),
                                onChanged: (text) {
                                 changeValue = ValueNotifier<String>(text);
                                },
                              ),
                            ),
                            

                            Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    key: Key('edit_window_cancel_button'),
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
                                    key: Key('edit_window_save_button'),
                                    color: Colors.green,
                                    textColor: Colors.white,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: Colors.redAccent,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      if(changeValue.value.length > 4){
                                        profileAttribute.changeTo(changeValue.value);
                                      }
                                      else{
                                        ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Alteração inválida')));
                                      }
                                    },
                                    child: const Text(
                                      "Guardar",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                )

                              ]
                            )
                            
                          ],
                          
                        ),
                      ),
                    alignment: Alignment.centerLeft,
                    //padding: EdgeInsets.symmetric(horizontal: 0.5),
                    margin: EdgeInsets.only(top: 0.5, bottom: 0.5),
                  )
                )

              ].where((e) => e != null).toList(),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ))
            
            
          ],


        );
  }
}

void edit_popup_nationality(BuildContext context, String title) {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: AddNationalityWindow(title),
          );
        });
}

class AddNationalityWindow extends StatelessWidget {
  String title;

  ValueNotifier<String> changeValue = ValueNotifier<String>('');
  final _formKey = GlobalKey<FormState>();

  AddNationalityWindow(this.title);

  @override
  Widget build(BuildContext context) {
      return Stack(
              key: Key('addNat_window_popup'),
              overflow: Overflow.visible,

              children: <Widget>[
                SizedBox(
                  width: 900,
                  height: 225,
                  child: Column(
                  children: [

                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 75),
                       child : Column(
                        children: [
                          Container(
                          child:
                            Text(title,
                              key: Key('addNat_window_title'),
                              style: Theme.of(context)
                              .textTheme
                              .headline1
                              .apply(
                              fontSizeDelta: -53,
                              fontWeightDelta: -3)),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 0.5),
                          margin: EdgeInsets.only(top: 0.5, bottom: 0.5),
                          ),
                          Container(
                          child:
                            Text(
                              'Nova nacionalidade:',
                              key: Key('addNat_window_attribute_title'),
                              ),
                          alignment: Alignment.centerLeft,
                          ),
                        ]

                      )
                      
                    ),

                    ConstrainedBox(
                       constraints: const BoxConstraints(maxHeight: 150),
                      child: Container(
                        child:
                          Form(
                            key: _formKey,
                            child: Column(
                              key: Key('addNat_window_form'),
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[

                                
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    key: Key('addNat_window_form_text'),
                                    autofocus: true,
                                    decoration: InputDecoration(hintText: "nacionalidade"),
                                    onChanged: (text) {
                                     changeValue = ValueNotifier<String>(text);
                                    },
                                  ),
                                ),
                                

                                Row(
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        key: Key('addNat_window_cancel_button'),
                                        color: Colors.red,
                                        textColor: Colors.white,
                                        padding: EdgeInsets.all(8.0),
                                        splashColor: Colors.redAccent,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          //changeMessage(message.value);
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
                                        key: Key('addNat_window_save_button'),
                                        color: Colors.green,
                                        textColor: Colors.white,
                                        padding: EdgeInsets.all(8.0),
                                        splashColor: Colors.redAccent,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          if(changeValue.value.length > 4){
                                            profileInfo.addNationality(changeValue.value);
                                          }
                                          else{
                                            ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Operação inválida')));
                                          }
                                        },
                                        child: const Text(
                                          "Guardar",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                    )

                                  ]
                                )
                                
                              ],
                              
                            ),
                          ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 0.5, bottom: 0.5),
                      )
                    )

                  ].where((e) => e != null).toList(),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ))
                
                
              ],


            );
  }
}
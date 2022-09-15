import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/globals.dart';

import '../../controller/profile_info/profile_info_database.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);
const Color _lightRed = Color.fromARGB(255, 190, 40, 40);

void pending_popup(ProfileAttribute pAttribute, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: PendingAlterationWindow(pAttribute),
        );
      });
}

class PendingAlterationWindow extends StatelessWidget {
  ProfileAttribute pAttribute;

  PendingAlterationWindow(this.pAttribute);

  @override
  Widget build(BuildContext context) {
      return Stack(
            key: Key('pending_window_popup'),
            overflow: Overflow.visible,
            children: [Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                const Text(
                  'Pedido de mudança\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _darkRed
                  ),
                ),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      
                      children: [
                        Text('Atributo: '),
                        Text(
                          pAttribute.attribute,
                          key: Key('pending_window_atributo_row'),
                          style: TextStyle(
                              color: _lightRed
                          ),
                        )
                      ]
                    ),
                    TableRow(
                      children: [
                        Text('Valor a mudar: '),
                        Text(
                          pAttribute.oldVal,
                          key: Key('pending_window_mudarValor_row'),
                          style: TextStyle(
                              color: _lightRed
                          ),
                        )
                      ]
                    ),
                    TableRow(
                       children: [
                        Text("Novo valor: "),
                        Text(
                          pAttribute.newVal,
                          key: Key('pending_window_novoValor_row'),
                          style: TextStyle(
                              color: _lightRed
                          ),
                        )
                      ]
                    ),
                    TableRow(
                      children: [
                        Text('Estado: '),
                        Text(
                          pAttribute.status.text,
                          key: Key('pending_window_estado_row'),
                          style: TextStyle(
                              color: _lightRed
                          ),
                        )
                      ]
                    )
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    key: Key('pending_window_cancel_button'),
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.redAccent,
                    onPressed: () {
                        Navigator.of(context).pop();
                        if (pAttribute.type == 'nationality') {
                            profileInfo.removeNacionality(int.parse(pAttribute.attribute)-1);
                        } else {
                            pAttribute.removeAlteration();
                        }
                    },
                    child: const Text(
                      "Cancelar alteração",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    key: Key('pending_window_return_button'),
                    color: Colors.white,
                    textColor: Color.fromRGBO(127, 23, 30, 1),
                    splashColor: Colors.grey,
                    onPressed: () {
                       Navigator.of(context).pop();
                    },
                    child: Text(
                      "Retornar",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17.0, decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            )],
          );
  }
}
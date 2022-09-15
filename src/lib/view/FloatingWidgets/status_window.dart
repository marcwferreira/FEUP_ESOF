import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/globals.dart';

import '../../controller/profile_info/profile_info_database.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);
const Color _lightRed = Color.fromARGB(255, 190, 40, 40);

void status_popup(ProfileAttribute pAttribute, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatusAlterationWindow(pAttribute),
        );
      });
}

class StatusAlterationWindow extends StatelessWidget {
  ProfileAttribute pAttribute;

  StatusAlterationWindow(this.pAttribute);

  @override
  Widget build(BuildContext context) {
      return Stack(
            overflow: Overflow.visible,
            children: [Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              const Text(
                'Pedido de mudança\n',
                key: Key('alteration_window_popup'),
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
                          Text('Atributo: '
                          ),
                          Text(
                            pAttribute.attribute,
                            key: Key('alteration_window_atributo_row'),
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
                            key: Key('alteration_window_mudarValor_row'),
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
                            key: Key('alteration_window_novoValor_row'),
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
                            key: Key('alteration_window_estado_row'),
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
                  key: Key('alteration_window_dismiss_button'),
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.redAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                    pAttribute.removeAlteration();
                  },
                  child: const Text(
                    "Eliminar notificação",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ]);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/controller/profile_info/get_profile_info.dart';
import 'package:uni/view/Widgets/page_transition.dart';
import 'package:uni/view/Pages/profile_info_page_view.dart';
import 'package:uni/view/navigation_service.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/globals.dart';

/// Manages the profile info and social demographics data(course name, biological sex, birthday, etc)
/// Has a buton to go to the full page containing all the information
class ProfileInfoCard extends GenericCard {

  ProfileInfoCard({Key key, Key key2, this.name, this.email});

  final String name;
  final String email;

  TableRow tableRow(String attribute, String value, BuildContext context) {
    return TableRow(children: [
      Container(
        key: Key('profile_info_$attribute'+'_row'),
        margin: const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 20.0),
        child: Text(attribute,
            style:
                Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4)),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20.0, bottom: 8.0, right: 20.0),
        child: getInfoText(value, context),
      ),
    ]);
  }

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(
      key: Key('dados_preview_card'),
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Table(
            columnWidths: {1: FractionColumnWidth(.4)},
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              tableRow('Nome:', profileInfo.nome.value, context),
              tableRow('Sexo:', profileInfo.sexo.value, context),
              tableRow('Data de nascimento:', profileInfo.dataNascimento.value, context),
            ]),
        Container(
          key: Key('key_info_preview'),
          margin: const EdgeInsets.only(
              top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
          child: RaisedButton(
            color: Color.fromRGBO(127, 23, 30, 1),
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.grey,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (__) =>
                          ProfileInfoPageView(name: name, email: email)));
            },
            child: Text(
              "Mais dados",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }

  @override
  String getTitle() {
    return 'Dados Sociodemográficos';
  }

  @override
  onClick(BuildContext context) {}
}

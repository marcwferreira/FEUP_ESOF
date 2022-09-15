import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/controller/profile_info/get_profile_info.dart';
import 'package:uni/view/Widgets/page_transition.dart';
import 'package:uni/view/Pages/profile_info_page_view.dart';
import 'package:uni/view/navigation_service.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/globals.dart';
import '../../controller/profile_info/profile_info_database.dart';
import 'package:uni/view/FloatingWidgets/edit_profile.dart';
import 'package:uni/view/FloatingWidgets/status_window.dart';
import 'package:uni/view/FloatingWidgets/pending_widget.dart';

/// Manages the profile info containing the infromation about student's nacionality
class ProfileInfoNationalityCard extends GenericCard {

  TableRow tableRow(ProfileAttribute pAttribute, BuildContext context) {

    String color;
    switch (pAttribute.status.text) {
      case 'Aceite': color = "green"; break;
      case 'Rejeitado': color = "red"; break;
      case 'Pendente': color = "yellow"; break;
      default:
        color = "grey";
    }

    return TableRow(children: [
      Container(
        key: Key('profile_info_'+pAttribute.attribute +'_row'),
        margin: const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 20.0),
        child: Text(pAttribute.attribute +':',
            style:
                Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4)),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20.0, bottom: 8.0, right: 20.0),
        child: getInfoText(pAttribute.value, context),
      ),
      Container(
          child: SizedBox(
              width: 15,
              height: 15,
              child: ElevatedButton(
                key: Key(color + "_button_" + pAttribute.attribute),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(pAttribute.alterationColor),
                    shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(
                      side: BorderSide(color: pAttribute.alterationColor),
                    ))),
                onPressed: () {
                  if(pAttribute.status == AlterationStatus.ACCEPTED || pAttribute.status == AlterationStatus.REJECTED){
                    status_popup(pAttribute, context);
                  }
                  else if(pAttribute.status == AlterationStatus.PENDING) {
                    pending_popup(pAttribute, context);
                  }
                }
              ))),
    ]);
  }

  @override
  Widget buildCardContent(BuildContext context) {
    var nationalities = getStudentNacionalities();

    return Column(
      key: Key('profile_info_nationality'),
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Table(
            columnWidths: {
              0: FlexColumnWidth(10),
              1: FlexColumnWidth(10),
              2: FlexColumnWidth(1),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              for (ProfileAttribute nationality in profileInfo.nacionalidades)
                tableRow(nationality,context),
            ]),
        Container(
          key: Key('key_info_preview'),
          margin: const EdgeInsets.only(
              top: 10.0, bottom: 5.0, left: 20.0, right: 20.0),
          child: FlatButton(
            key: Key("Add nationality"),
            color: Colors.white,
            textColor: Color.fromRGBO(127, 23, 30, 1),
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.grey,
            onPressed: () {
              edit_popup_nationality(context, getTitle());
            },
            child: Text(
              "Adicionar nacionalidade",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.0, decoration: TextDecoration.underline),
            ),
          ),
        ),
      ],
    );
  }

  @override
  String getTitle() {
    return 'Nacionalidades';
  }

  @override
  onClick(BuildContext context) {}
}

import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/controller/profile_info/get_profile_info.dart';
import 'package:uni/view/Widgets/page_transition.dart';
import 'package:uni/view/Pages/profile_info_page_view.dart';
import 'package:uni/view/navigation_service.dart';
import '../../controller/profile_info/profile_info_database.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/globals.dart';
import 'package:uni/view/FloatingWidgets/edit_profile.dart';
import 'package:uni/view/FloatingWidgets/status_window.dart';
import 'package:uni/view/FloatingWidgets/pending_widget.dart';
import '../../globals.dart';
import '../../controller/profile_info/profile_info_database.dart';

/// Manages the profile info and social demographics data(course name, biological sex, birthday, etc)
class ProfileInfoBasicCard extends GenericCard {
  ProfileInfoBasicCard({Key key, this.name});

  final String name;

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
                key: Key(color + "_button_" +pAttribute.attribute),
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
                  } else {
                    edit_popup(context, getTitle(), pAttribute);
                  }
                }
              ))),
    ]);
  }

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(
      key: Key('profile_info_basic'),
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
              tableRow(profileInfo.nome, context),
              tableRow(profileInfo.sexo, context),
              tableRow(profileInfo.dataNascimento, context),
              tableRow(profileInfo.estadoCivil, context),
              tableRow(profileInfo.pai, context),
              tableRow(profileInfo.mae, context),
              
            ]),
      ],
    );
  }

  @override
  String getTitle() {
    return 'Dados Básicos';
  }

  @override
  onClick(BuildContext context) {}

}
import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/controller/profile_info/get_profile_info.dart';
import 'package:uni/controller/profile_info/profile_info_database.dart';
import 'package:uni/view/Widgets/page_transition.dart';
import 'package:uni/view/Pages/profile_info_page_view.dart';
import 'package:uni/view/navigation_service.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/globals.dart';
import 'package:uni/view/FloatingWidgets/edit_profile.dart';
import 'package:uni/view/FloatingWidgets/status_window.dart';
import 'package:uni/view/FloatingWidgets/pending_widget.dart';
import 'package:uni/model/entities/person.dart';

/// Manages the profile info and contains student's documents saved to sigarra
class PeopleSearchedMoreCard extends GenericCard {

  Person searchedPerson; 

  PeopleSearchedMoreCard(this.searchedPerson);

  TableRow tableRow(String att, String value, BuildContext context) {
    return TableRow(children: [
      Container(
        key: Key('searched_person_'+att+'_row'),
        margin: const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 20.0),
        child: Text(att +':',
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
    return Column(key: Key('people_searched_info'),mainAxisSize: MainAxisSize.min, children: <Widget>[
      Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
            for (var key in searchedPerson.attributes.keys)
                tableRow( key, searchedPerson.attributes[key], context),
          
        ],
      )
    ]);
  }

  @override
  String getTitle() {
    return 'Mais dados';
  }

  @override
  onClick(BuildContext context) {}
}

import 'dart:io';
import 'package:uni/controller/load_info.dart';
import 'package:uni/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/view/Widgets/people_searched_more.dart';
import 'package:uni/model/entities/person.dart';
import 'package:uni/view/FloatingWidgets/search_people_widget.dart';

import 'package:uni/utils/peopleApi.dart';
import 'package:uni/globals.dart';

class PeopleSearchedPageView extends StatefulWidget {
    
  final Person searchedPerson;

  PeopleSearchedPageView(this.searchedPerson);
  
  @override
  State<StatefulWidget> createState() =>
      PeopleSearchedViewState(searchedPerson);
}

/// Manages the 'Personal user page' section.
class PeopleSearchedViewState extends UnnamedPageView {

  final Person searchedPerson; 
     
  PeopleSearchedViewState(this.searchedPerson);

  @override
  Widget getBody(BuildContext context) {
    return ListView(shrinkWrap: false, children: childrenList(context));
  }

  @override
  Widget getTopRightButton(BuildContext context) {
    return Container();
  }

  /// Returns a list with all the children widgets of this page.
  List<Widget> childrenList(BuildContext context) {
    final List<Widget> list = [];
    //top info
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(profileInfo(context));
    //More info
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(PeopleSearchedMoreCard(searchedPerson));

    return list;
  }

  /// Returns a widget with the user's profile info (Picture, name and email).
  Widget profileInfo(BuildContext context) {
    return StoreConnector<AppState, Future<File>>(
      converter: (store) => loadProfilePic(store),
      builder: (context, profilePicFile) => FutureBuilder(
        future: profilePicFile,
        builder: (BuildContext context, AsyncSnapshot<File> profilePic) =>
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                key: Key('searchedPerson_page_info'),              // To Test
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(searchedPerson.image)),
                ),
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
            Text(searchedPerson.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400)),
            Padding(padding: const EdgeInsets.all(5.0)),
            Text(searchedPerson.ranking,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
            Padding(padding: const EdgeInsets.all(5.0)),
            Text(searchedPerson.upNumber.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
            
            ],
        ),
      ),
    );
  }
}

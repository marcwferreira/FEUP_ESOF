import 'dart:io';
import 'package:uni/controller/load_info.dart';
import 'package:uni/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/view/Widgets/profile_info_basic_card.dart';
import 'package:uni/view/Widgets/profile_info_documents_card.dart';
import 'package:uni/view/Widgets/profile_info_nationality_card.dart';
import 'package:uni/view/Widgets/profile_info_contacts_card.dart';
import 'package:uni/view/Widgets/profile_info_address_card.dart';

class ProfileInfoPageView extends StatefulWidget {
  final String name;
  final String email;

  ProfileInfoPageView({
    Key key,
    @required this.name,
    @required this.email,
  });
  @override
  State<StatefulWidget> createState() =>
      ProfilePageInfoViewState(name: name, email: email);
}

/// Manages the 'Personal user page' section.
class ProfilePageInfoViewState extends UnnamedPageView {
  ProfilePageInfoViewState({
    Key key,
    @required this.name,
    @required this.email,
  });
  final String name;
  final String email;
  bool isEditing = false;

  @override
  Widget getBody(BuildContext context) {
    return ListView(shrinkWrap: false, children: childrenList(context));
  }

  Widget getBodyMock(int number) {

    switch (number) {
      case 1:
        return ListView(shrinkWrap: false, children: [ProfileInfoBasicCard(name: name)]);
        break;
      case 2:
        return ListView(shrinkWrap: false, children: [ProfileInfoNationalityCard()]);
        break;
      case 3:
        return ListView(shrinkWrap: false, children: [ProfileInfoDocumentsCard()]);
        break;
      case 4:
        return ListView(shrinkWrap: false, children: [ProfileInfoContactsCard()]);
        break;
      case 5:
        return ListView(shrinkWrap: false, children: [ProfileInfoAddressCard()]);
        break;
      default:
        break;
    }
    return ListView(shrinkWrap: false, children: [ProfileInfoBasicCard(name: name)]);
  }

  @override
  Widget getTopRightButton(BuildContext context) {
    return Container();
  }

  /// Returns a list with all the children widgets of this page.
  List<Widget> childrenList(BuildContext context) {
    final List<Widget> list = [];
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(profileInfo(context));
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(ProfileInfoBasicCard(name: name, ));
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(ProfileInfoNationalityCard());
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(ProfileInfoDocumentsCard());
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(ProfileInfoContactsCard());
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(ProfileInfoAddressCard());

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
                key: Key('profileInfo_page_info'),              // To Test
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: getDecorageImage(profilePic.data))),
            Padding(padding: const EdgeInsets.all(8.0)),
            Text(name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400)),
            Padding(padding: const EdgeInsets.all(5.0)),
            Text(email,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    );
  }
}

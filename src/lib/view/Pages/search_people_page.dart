import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni/utils/constants.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/model/entities/person.dart';
import 'package:uni/view/FloatingWidgets/search_people_widget.dart';
import 'package:uni/view/Pages/people_searched_view.dart';
import 'package:uni/utils/peopleApi.dart';
import 'package:uni/globals.dart';

class searchPageView extends StatefulWidget {

  searchPageView();

  @override
  State<StatefulWidget> createState() => searchPageState();
}

class searchPageState extends GeneralPageViewState {

  searchPageState();

  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    key: PageStorageKey<String>('searchPage');
    PageStorageKey<String>('SearchPage');
    return Scaffold(
      body:
        ListView(
          children: <Widget>[
            
            //title
            Container(key: Key("pesquisa"),
            child: PageTitle(name: 'Pesquisar Pessoal')),

            //People
            if(people.isEmpty) 
              ListTile(
                title: new Center(child: new Text("Sem Resultados"),),
              )
            else Column(
                children: List.generate(people.length, (index) {
                    return Card(
                      color: Color.fromARGB(255, 226, 222, 222),
                      child:
                      ListTile(
                        key: Key('searchTile_'+people[index].upNumber.toString()),
                        leading: Image.network(people[index].image),
                        title: Text(people[index].name),
                        subtitle: Text(people[index].ranking+"\n"+people[index].upNumber.toString()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (__) =>
                                  PeopleSearchedPageView(people[index])
                                )
                            );
                        },
                    ));
                  }
                ),
            ),
          ],
        ),

      //floating button
      floatingActionButton: FloatingActionButton(
        key: Key('key_search_button'),
        onPressed: () {
          search_people(context);
        },
        child: const Icon(Icons.search, color: Colors.white),
        backgroundColor: Colors.red,
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/person.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/utils/peopleApi.dart';
import '../testable_widget.dart';
import 'package:uni/globals.dart';

void main(){

  String api_mock = "https://raw.githubusercontent.com/marcwferreira/ESOF-json/master/.github/json/peopleTest.json";

  group('peopleSearching', () {

    test("Verify expected results when logged out", () async {
        isLogged = false;
        String query = "Jose";
        List<Person> peopleTest = await PeopleApi.getPeople(query, api_mock);
        expect(peopleTest.length, 2);
    });

    test("Verify expected results when logged in", () async {
        isLogged = true;
        String query = "Jose";
        List<Person> peopleTest = await PeopleApi.getPeople(query, api_mock);
        expect(peopleTest.length, 3);
    });

    test("Verify serch result when not logged in (professor info is correct)", () async {
        isLogged = false;
        String query = "Professor";
        List<Person> peopleTest = await PeopleApi.getPeople(query, api_mock);
        expect(peopleTest.length, 1);
        expect(peopleTest[0].name, "Jose Professor");
        expect(peopleTest[0].upNumber, 2);
        expect(peopleTest[0].ranking, "Professor");
        expect(peopleTest[0].attributes.isEmpty, false);
    });

    test("Verify that you can't search for students when logged out", () async {
        isLogged = false;
        String query = "Aluno";
        List<Person> peopleTest = await PeopleApi.getPeople(query, api_mock);
        expect(peopleTest.length, 0);
    });

    test("Verify that you can search for students when logged in (student info is also correct)", () async {
        isLogged = true;
        String query = "Aluno";
        List<Person> peopleTest = await PeopleApi.getPeople(query, api_mock);
        expect(peopleTest.length, 1);
        expect(peopleTest[0].name, "Jose Aluno");
        expect(peopleTest[0].upNumber, 1);
        expect(peopleTest[0].ranking, "Estudante");
        expect(peopleTest[0].attributes.isEmpty, false);
    });

  });
}
import 'dart:convert';
import 'package:uni/globals.dart';
import 'package:uni/model/entities/person.dart';
import 'package:http/http.dart' as http;

class PeopleApi {
  static Future<List<Person>> getPeople(String query, [String api_url = 'https://raw.githubusercontent.com/marcwferreira/ESOF-json/master/.github/json/people.json']) async {
    final url = Uri.parse(api_url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List people = json.decode(response.body);
      return people.map((json) => Person.fromJson(json)).where((people) {
        final nameLower = people.name.toLowerCase();
        final upNumberLower = people.upNumber.toString().toLowerCase();
        final searchLower = query.toLowerCase();

        bool match =  nameLower.contains(searchLower) ||
            upNumberLower.contains(searchLower);

        if (!isLogged) {
          match = match && people.ranking != "Estudante";
        }

        return match;
            
      }).toList();
    } else {
      throw Exception();
    }
  }
}

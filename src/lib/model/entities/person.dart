import 'dart:convert';

import 'package:flutter/material.dart';

class Person {
  
  final int upNumber;
  final String name;
  final String ranking;
  final String image;
  final Map<String,dynamic> attributes; 

  const Person({
    @required this.upNumber,
    @required this.name,
    @required this.ranking,
    @required this.image,
    @required this.attributes,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(

        upNumber: json['upNumber'],
        name: json['name'],
        ranking: json['ranking'],
        image: json['image'],
        attributes: json['attributes'],
  );

  Map<String, dynamic> toJson() => {
        'upNumber': upNumber,
        'name': name,
        'ranking': ranking,
        'image': image,
        'attributes': attributes,
      };
}

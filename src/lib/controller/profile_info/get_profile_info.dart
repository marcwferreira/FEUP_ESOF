import 'dart:collection';
import 'profile_info_database.dart';

String getStudentName(String name) {
  return name;
}

String getStudentSex() {
  return 'Masculino';
}

String getStudentBirthday() {
  return '1998-04-27';
}

String getStudentCivilStatus() {
  return 'Solteiro';
}

String getStudentFather() {
  return 'Luciano Madureira Fitas Aluno';
}

String getStudentMother() {
  return 'Samoa Leoa Aluno';
}

List<String> getStudentNacionalities() {
  var nationalities = ['Brasileiro', 'Portugues'];
  return nationalities;
}

Map<String, String> getStudentDocuments() {
  Map<String, String> documents = {
    'Cartão de Cidadão': '14750819',
    'Segurança Social': '580479345',
    'Passaporte': 'KD937303'
  };
  return documents;
}

String getStudentPhonenumber() {
  return '+351 928 154 528';
}

String getStudentEmail() {
  return 'joseAluno@mail.com';
}

String getStudentAddressSchool() {
  return '\tRua Alegria 51\n\t4575-360\n\tPortugal';
}

String getStudentAddressNormal() {
  return '\tRua Heróis Ultramar N 46\n\t4640-420\n\tPortugal';
}
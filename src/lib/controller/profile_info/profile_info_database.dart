import 'dart:collection';
import 'package:flutter/material.dart';

enum AlterationStatus{ACCEPTED,REJECTED,PENDING,NONE}

const Color _red = Color.fromARGB(255, 0xff, 0x0, 0xB);
const Color _yellow = Color.fromARGB(255, 0xff, 0xff, 0x66);
const Color _green = Color.fromARGB(255, 0x34, 0xC6, 0x3A);
const Color _white = Color.fromARGB(255, 0xC7, 0xC5, 0xC5);

extension AlterationColor on AlterationStatus{
    Color get color {
        switch(this){
            case AlterationStatus.ACCEPTED:
                return _green;
            case AlterationStatus.REJECTED:
                return _red;
            case AlterationStatus.PENDING:
                return _yellow;
            case AlterationStatus.NONE:
                return _white;
        }
    }

    String get text {
        switch(this){
            case AlterationStatus.ACCEPTED:
                return 'Aceite';
            case AlterationStatus.REJECTED:
                return 'Rejeitado';
            case AlterationStatus.PENDING:
                return 'Pendente';
            case AlterationStatus.NONE:
                return 'Nenhum';
        }
    }
}

class ProfileInfo { 
    
    var _nome = ProfileAttribute('Basic','Nome','Jose Aluno Qualquer');
    var _sexo = ProfileAttribute('Basic','Sexo','Masculino');
    var _dataNascimento = ProfileAttribute('Basic','Data de Nascimento','2021-02-30');
    var _estadoCivil = ProfileAttribute('Basic','Estado civil','Solteiro');
    var _pai = ProfileAttribute('Basic','Nome do pai','Jose Aluno Qualquer Pai');
    var _mae = ProfileAttribute('Basic','Nome da mãe','Joselina Aluna Qualquer Mãe');
    var _telemovel = ProfileAttribute('Basic','Telemóvel','220 413 508');
    var _email = ProfileAttribute('Basic','Email','JoseAlunoQualquer@email.com');
    var _residenciaOficial = ProfileAttribute('Address', 'Residência oficial', '\tRua Dr. Roberto Frias, S/N\t4200-465\n\tPorto\tPortugal');
    var _residenciaAulas = ProfileAttribute('Address','Residência em tempo de aulas','\tRua Alegria 51\n\t4575-360\n\tPortugal');

    var _nacionalidades = [];
    var _documentos = [];

    ProfileInfo(){
        _nacionalidades.add(ProfileAttribute('nationality','1','Português'));
        _nacionalidades.add(ProfileAttribute('nationality', '2', 'Brasileiro'));
        _documentos.add(ProfileAttribute('Doc','Cartão de cidadão','147508819'));
        _documentos.add(ProfileAttribute('Doc','Segurança social','580479345'));
        _documentos.add(ProfileAttribute('Doc','Passaporte','KD937303'));
        _sexo.changeTo("Feminino");
        _pai.changeTo("Firmino Alves das Alturas");
        _pai.acceptAlteration();
        _estadoCivil.changeTo("Casado");
        _estadoCivil.rejectAlteration();
    }

    get nome => _nome;

    get documentos => _documentos;

    get nacionalidades => _nacionalidades;

    get residenciaAulas => _residenciaAulas;

    get residenciaOficial => _residenciaOficial;

    get email => _email;

    get telemovel => _telemovel;

    get mae => _mae;

    get pai => _pai;

    get estadoCivil => _estadoCivil;

    get dataNascimento => _dataNascimento;

    get sexo => _sexo;

    void addNationality(String value){
        var newNacionality = new ProfileAttribute('nationality',(_nacionalidades.length+1).toString(),'~');
        _nacionalidades.add(newNacionality);
        newNacionality.changeTo(value);
    }

    void removeNacionality(int index){
        _nacionalidades.removeAt(index);
    }
}

class ProfileAttribute {

    String _attribute, _type, _oldVal = null, _value, _newVal = null;
    AlterationStatus _status = AlterationStatus.NONE;

    ProfileAttribute(this._type, this._attribute, this._value);

    void changeTo(String newVal){
        if(_status == AlterationStatus.NONE){
            _status = AlterationStatus.PENDING;
            this._oldVal = _value;
            this._newVal = newVal;
        }
    }

    void acceptAlteration(){
        if(_status == AlterationStatus.PENDING){
            _status = AlterationStatus.ACCEPTED;
            _oldVal = _value;
            _value = _newVal;
        }
    }

    void rejectAlteration(){
        if(_status == AlterationStatus.PENDING){
            _status = AlterationStatus.REJECTED;
            _oldVal = _value;
            _newVal = _value; 
        }
    }

    void removeAlteration(){
        _status = AlterationStatus.NONE;
        _oldVal = null;
        _newVal = null;
    }

    String get attribute => _attribute;

    Color get alterationColor => _status.color;

    get value => _value;

    get type => _type;

    get oldVal => _oldVal;

    get newVal => _newVal;

    AlterationStatus get status => _status;
}

import 'package:flutter/material.dart';

class Poi{
  var _id;
  var _foto;
  var _nombre;
  var _descripcion;
  var _puntuacion;
  var _latitud;
  var _longitud;

  Poi(this._id, this._foto, this._nombre, this._descripcion, this._puntuacion, this._latitud, this._longitud);

  Poi.fromJson(Map<String, dynamic> json)
    : _id=json['id'],
      _foto=json['foto'],
      _nombre=json['nombre'],
      _descripcion=json['descripcion'],
      _puntuacion=json['puntuacion'],
      _latitud=json['latitud'],
      _longitud=json['longitud'];

  Map<String, dynamic> toJson() => {
  'id':_id,
  'foto':_foto,
  'nombre':_nombre,
  'descripcion':_descripcion,
  'puntuacion':_puntuacion,
  'latitud':_latitud,
  'longitud':_longitud
  };

  get latitud => _latitud;

  set latitud(value) {
    _latitud = value;
  }

  get longitud => _longitud;

  set longitud(value) {
    _longitud = value;
  }

  get puntuacion => _puntuacion;

  set puntuacion(value) {
    _puntuacion = value;
  }

  get descripcion => _descripcion;

  set descripcion(value) {
    _descripcion = value;
  }

  get nombre => _nombre;

  set nombre(value) {
    _nombre = value;
  }

  get foto => _foto;

  set foto(value) {
    _foto = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }
}
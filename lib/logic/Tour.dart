import 'package:flutter/material.dart';
import 'package:tarot/logic/Contrat.dart';
import 'package:tarot/logic/Contrats.dart';
import 'package:tarot/logic/Joueur.dart';
import 'package:tarot/logic/Tarot.dart';

class Tour {
  /// Score de la partie.
  int _score;
  set score(value) => _score = value;
  int get score => _score;
  bool get victoireGagne => this._score - this.pointsBout >= 0;

  /// Nombre de bout que possède le preneur.
  int _nbOudlers;
  set nbOudlers(value) => _nbOudlers = value;
  int get pointsBout {
    int pointsBout;
    switch (this._nbOudlers) {
      case 1:
        pointsBout = 51;
        break;
      case 2:
        pointsBout = 41;
        break;
      case 3:
        pointsBout = 36;
        break;
      default:
        pointsBout = 56;
    }
    return pointsBout;
  }

  /// Vaut true si le preneur possède le petit.
  ValueNotifier<bool> _petit = new ValueNotifier(false);
  ValueNotifier<bool> get petitVN => _petit;
  bool get petit => _petit.value;
  set petit(value) => _petit.value = value;

  /// Permet de savoir qui a posé le petit au bout.
  String _petitQui = "Attaque";
  set petitQui(value) => _petitQui = value == "A" ? "Attaque" : "Défense";
  bool get petitAttaque => _petitQui == "Attaque";

  /// Vaut true si le preneur a une poignée.
  bool _poignee;
  bool get poignee => _poignee;
  set poignee(value) => _poignee = value;

  /// Joueur qui prend la donne.
  Joueur _preneur;
  set prenneur(value) => _preneur = value;

  /// Joueur qui va jouer avec le preneur quand on joue à 5.
  Joueur _partenaire;
  set partenaire(value) => _partenaire = value;

  /// Contrat choisi par le preneur.
  Contrat _contrat;
  set contrat(Contrat value) => this._contrat = value;

  Contrat get contrat => _contrat;

  Tour(
    this._nbOudlers,
    this._score,
    _petit,
    this._poignee,
    this._preneur,
    this._partenaire,
    this._contrat,
  ) {
    this._petit.value = _poignee;
  }

  Tour.voidTour() {
    this._nbOudlers = 0;
    this._score = 0;
    this._petit.value = false;
    this._poignee = false;
    this._preneur = null;
    this._partenaire = null;
    this._contrat = null;
  }

  Tour.fromJson(Map<String, dynamic> json, players) {
    _score = json['score'];
    _nbOudlers = json['nbOudlers'];
    _petit.value = json['petit'] == "true";
    _petitQui = json['petitQui'];
    _poignee = json['poignee'] == "true";
    for (Joueur joueur in players)
      if (joueur.name == json['preneur']) _preneur = joueur;
    if (json.containsValue('partenaire'))
      for (Joueur joueur in players)
        if (joueur.name == json['partenaire']) _partenaire = joueur;
    _contrat = Contrats.getContratByName(json['contrat']);
  }

  void calculerPoints() {
    int total = (this._score - pointsBout).abs() + 25;
    total += this.petit
        ? (this.victoireGagne
            ? (petitAttaque ? 10 : -10)
            : (petitAttaque ? -10 : 10))
        : 0;
    total *= this._contrat.coefficient;
    total += this._poignee ? 20 : 0;

    _repartirPoints(total);
  }

  void _repartirPoints(int points) {
    List players = Tarot.partieEnCours.players.value;

    if (players.length == 3) pointsPartie3(points);
    if (players.length == 4) pointsPartie4(points);
    if (players.length == 5) pointsPartie5(points);
  }

  void pointsPartie3(int points) {
    List players = Tarot.partieEnCours.players.value;

    for (Joueur j in players) {
      if (j == this._preneur)
        j.addScore(victoireGagne ? points * 2 : points * -2);
      else
        j.addScore(victoireGagne ? -points : points);
    }
  }

  void pointsPartie4(int points) {
    List players = Tarot.partieEnCours.players.value;

    for (Joueur j in players) {
      if (j == this._preneur)
        j.addScore(victoireGagne ? points * 3 : points * -3);
      else
        j.addScore(victoireGagne ? -points : points);
    }
  }

  void pointsPartie5(int points) {
    List players = Tarot.partieEnCours.players.value;

    for (Joueur j in players) {
      if (j == this._preneur)
        j.addScore(victoireGagne ? points * 2 : points * -2);
      else if (j == this._partenaire)
        j.addScore(victoireGagne ? points : -points);
      else
        j.addScore(victoireGagne ? -points : points);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'score': _score,
      'nbOudlers': _nbOudlers,
      'petit': _petit.value,
      'petitQui': _petitQui,
      'poignee': _poignee,
      'preneur': _preneur.name,
      if (_partenaire != null) 'partenaire': _partenaire.name,
      'contrat': _contrat.type
    };
  }
}

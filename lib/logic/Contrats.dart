import 'package:flutter/material.dart';
import 'package:tarot/logic/Contrat.dart';

/// Liste des contrats possibles.
class Contrats {
  /// Liste avec les contrats codé en dur (peu susceptible de changer.).
  static List<Contrat> _contrats = [
    Contrat("La Petite", 1),
    Contrat("La Garde", 2),
    Contrat("La Garde Sans", 4),
    Contrat("La Garde Avec", 6),
  ];
  static List get contrats => _contrats;
  static List get contratsNames {
    List<String> ctts = [];
    for (Contrat c in _contrats) ctts.add(c.type);
    return ctts;
  }

  static Contrat getContratByName(String name) {
    Contrat contrat;

    for (Contrat c in _contrats) if (c.type == name) contrat = c;

    return contrat;
  }
}

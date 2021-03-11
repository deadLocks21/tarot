import 'package:flutter/cupertino.dart';
import 'package:tarot/logic/Joueur.dart';
import 'package:tarot/logic/Tour.dart';

/// Une partie est un instace du jeu qui contient les joueurs et les tours
class Partie {
  /// Liste des joueurs participants.
  ValueNotifier<List<Joueur>> _joueurs;
  ValueNotifier<List<Joueur>> get players => _joueurs;
  Joueur getPlayerByName(String name) {
    Joueur j;

    for (Joueur joueur in _joueurs.value) if (joueur.name == name) j = joueur;

    return j;
  }

  List get playersNames {
    List<String> names = [];

    for (Joueur j in _joueurs.value) names.add(j.name);

    return names;
  }

  /// Variable permettant de savoir si on peut lancer le jeu ou non.
  ValueNotifier<bool> _launch = ValueNotifier(false);
  ValueNotifier<bool> get launch => _launch;

  /// Liste des tours de la partie.
  List<Tour> _tours; // TODO Add value notifier for scores table.
  List get tours => _tours;

  /// Constructeur d'une partie.
  Partie() {
    _joueurs = new ValueNotifier([]);
    _tours = [];
  }

  Partie.fromJson(Map<String, dynamic> json) {
    _joueurs = new ValueNotifier([]);
    _tours = [];

    _launch.value = true;
    for (var item in json['players'])
      _joueurs.value.add(new Joueur.fromJson(item));
    for (var item in json['turns'])
      _tours.add(
        new Tour.fromJson(item, _joueurs.value),
      );
  }

  /// Ajoute un joueur a la liste des joueurs.
  void addPlayer(player) {
    _joueurs.value.add(player);

    _launchCount();
    _joueurs.notifyListeners();
  }

  /// Supprime un joueur de la liste.
  void removePlayer(player) {
    Joueur p;

    for (var j in _joueurs.value) if (j.name == player) p = j;

    _joueurs.value.remove(p);

    _launchCount();
    _joueurs.notifyListeners();
  }

  /// Retourne le nombre de participants.
  int numberOfPlayers() => _joueurs.value.length;

  /// Met a jour la variable launch si besoin.
  _launchCount() {
    if (3 <= numberOfPlayers() && numberOfPlayers() <= 5)
      launch.value = true;
    else
      launch.value = false;

    launch.notifyListeners();
  }

  /// Ajoute un tour à la variable this._tour
  void addTour(Tour tour) {
    this._tours.add(tour);
    tour.calculerPoints();

    _joueurs.notifyListeners();
  }

  /// Nombre de tours dans la partie.
  int numberOfTours() => this._tours.length;

  Map<String, dynamic> toJson() {
    List players = [];
    List turns = [];

    for (Joueur j in this._joueurs.value) players.add(j.toJson());
    for (Tour t in this._tours) turns.add(t.toJson());

    return {
      'launch': _launch.value,
      'players': players,
      'turns': turns,
    };
  }
}

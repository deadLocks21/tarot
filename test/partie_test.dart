import 'package:flutter_test/flutter_test.dart';
import 'package:tarot/logic/Joueur.dart';
import 'package:tarot/logic/Partie.dart';

void main() {
  test('Partie : Ajout d\'un joueur', () {
    Partie p = new Partie();

    Joueur j1 = new Joueur("Tim");
    Joueur j2 = new Joueur("Flo");
    Joueur j3 = new Joueur("Rose");

    p.addPlayer(j1);
    p.addPlayer(j2);
    p.addPlayer(j3);

    expect(p.numberOfPlayers(), 3);
  });

  test('Suppression d\'un joueur', () {
    Partie p = new Partie();

    Joueur j1 = new Joueur("Tim");

    p.addPlayer(j1);
    p.removePlayer(j1);

    expect(p.numberOfPlayers(), 0);
  });

  test('Récupération du nom des joueurs', () {
    Partie p = new Partie();

    Joueur j1 = new Joueur("Tim");
    Joueur j2 = new Joueur("Flo");
    Joueur j3 = new Joueur("Rose");

    p.addPlayer(j1);
    p.addPlayer(j2);
    p.addPlayer(j3);

    expect(p.playersNames, equals(['Tim', 'Flo', 'Rose']));
  });
}

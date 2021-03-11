/// Représente un jour de tarot.
class Joueur {
  /// Nom du joueur, par exemple 'Timothé'
  String _name;
  String get name => _name;
  set name(String name) => this._name = name;

  List<int> _scores = [];
  List get scores => _scores;
  int get total {
    int total = 0;
    for (int i in _scores) total += i;
    return total;
  }

  addScore(int score) {
    _scores.add(score);
  }

  /// Constructeur d'un joueur permettant d'initialiser son nom.
  Joueur(this._name);

  Joueur.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _scores = [];

    for (var item in json['scores']) {
      _scores.add(item);
    }
  }

  Map<String, dynamic> toJson() => {
        'name': _name,
        'scores': _scores,
      };
}

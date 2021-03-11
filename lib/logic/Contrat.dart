/// Un contrat au tarot correspond à l'engagement d'un nombre de point à réaliser.
class Contrat {
  /// Le type correspond au nom du contrat, par exemple 'La Garde'
  String _type;
  String get type => _type;
  set type(String type) => this._type = type;

  /// Le coefficient permet de compter les points à la fin La Garde a un coefficient de 2.
  int _coefficient;
  int get coefficient => _coefficient;
  set coefficient(int coefficient) => this._coefficient = coefficient;

  /// Constructeur d'un contrat.
  Contrat(this._type, this._coefficient);
}

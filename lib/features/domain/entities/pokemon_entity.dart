// domain/entities/pokemon.dart
class Pokemon {
  final int id;
  final String name;
  final String detailUrl;
  final int height;
  final int weight;
  final List<String>? types;
  final List<String>? abilities;

  Pokemon({
    required this.id,
    required this.name,
    required this.detailUrl,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
  });
}

// To parse this JSON data, do
//
//     final pokemons = pokemonsFromJson(jsonString);

// data/models/pokemon_list_model.dart
class PokemonListModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonModel> results;

  PokemonListModel({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    return PokemonListModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((e) => PokemonModel.fromJson(e))
          .toList(),
    );
  }

  PokemonListModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonModel>? results,
  }) {
    return PokemonListModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}

class PokemonModel {
  int id;
  final String name;
  final String url;
  String urlImage;
  int height;
  int weight;
  List<String>? types = List.empty(growable: true);
  List<String>? abilities = List.empty(growable: true);

  PokemonModel({
    required this.id,
    required this.name,
    required this.url,
    this.urlImage = '',
    this.height = 0,
    this.weight = 0,
    this.types,
    this.abilities,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: json['name'], url: json['url'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'urlImage': urlImage,
      'height': height,
      'weight': weight,
      'types': types,
      'abilities': abilities,
    };
  }

  PokemonModel copyWith({
    int? id,
    String? name,
    String? url,
    String? urlImage,
    int? height,
    int? weight,
    List<String>? types,
    List<String>? abilities,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      urlImage: urlImage ?? this.urlImage,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? this.types,
      abilities: abilities ?? this.abilities,
    );
  }
}

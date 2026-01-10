// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final pokemonDetail = pokemonDetailFromJson(jsonString);

import 'dart:convert';

PokemonDetail pokemonDetailFromJson(String str) =>
    PokemonDetail.fromJson(json.decode(str));

String pokemonDetailToJson(PokemonDetail data) => json.encode(data.toJson());

class PokemonDetail {
  List<Ability> abilities;
  int id;
  String name;
  Sprites sprites;
  int height;
  int weight;
  List<TypeElement> types;

  PokemonDetail({
    required this.abilities,
    required this.id,
    required this.name,
    required this.sprites,
    required this.height,
    required this.weight,
    required this.types,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
    abilities: List<Ability>.from(
      json["abilities"].map((x) => Ability.fromJson(x)),
    ),
    id: json["id"],
    name: json["name"],
    sprites: Sprites.fromJson(json["sprites"]),
    height: json["height"],
    weight: json["weight"],
    types: List<TypeElement>.from(
      json["types"].map((item) => TypeElement.fromJson(item)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "id": id,
    "name": name,
    "sprites": sprites.toJson(),
    "height": height,
    "weight": weight,
  };
}

class Types {
  List<TypeElement> type;

  Types({required this.type});

  factory Types.fromJson(Map<String, dynamic> json) => Types(
    type: json["types"] == null
        ? []
        : json["types"].map((type) => TypeElement.fromJson(type)),
  );
}


class TypeElement {
  int slot;
  TypeInner type;

  TypeElement({required this.slot, required this.type});

  factory TypeElement.fromJson(Map<String, dynamic> json) =>
      TypeElement(slot: json["slot"], type: TypeInner.fromJson(json["type"]));

  Map<String, dynamic> toJson() => {"slot": slot, "type": type.toJson()};
}

class TypeInner {
  String name;
  String url;

  TypeInner({required this.name, required this.url});

  factory TypeInner.fromJson(Map<String, dynamic> json) =>
      TypeInner(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class Ability {
  Species? ability;
  bool isHidden;
  int slot;

  Ability({required this.ability, required this.isHidden, required this.slot});

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    ability: json["ability"] == null ? null : Species.fromJson(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

  Map<String, dynamic> toJson() => {
    "ability": ability?.toJson(),
    "is_hidden": isHidden,
    "slot": slot,
  };
}

class Species {
  String name;
  String url;

  Species({required this.name, required this.url});

  factory Species.fromJson(Map<String, dynamic> json) =>
      Species(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class Other {
  Home home;
  Sprites showdown;

  Other({required this.home, required this.showdown});

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    home: Home.fromJson(json["home"]),
    showdown: Sprites.fromJson(json["showdown"]),
  );

  Map<String, dynamic> toJson() => {
    "home": home.toJson(),
    "showdown": showdown.toJson(),
  };
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;
  Other? other;
  Sprites? animated;

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    this.other,
    this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    backDefault: json["back_default"],
    backFemale: json["back_female"],
    backShiny: json["back_shiny"],
    backShinyFemale: json["back_shiny_female"],
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
    other: json["other"] == null ? null : Other.fromJson(json["other"]),
    animated: json["animated"] == null
        ? null
        : Sprites.fromJson(json["animated"]),
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_female": backFemale,
    "back_shiny": backShiny,
    "back_shiny_female": backShinyFemale,
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
    "other": other?.toJson(),
    "animated": animated?.toJson(),
  };
}

class Home {
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
  };
}

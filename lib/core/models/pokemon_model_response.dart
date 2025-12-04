import 'package:loja/core/enums/types_enum.dart';

class PokemonModelResponse {
  final int id;
  final String name;
  final String imageUrl;
  final String pixelIconUrl;
  final List<String> types;

  PokemonModelResponse({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.pixelIconUrl,
    required this.types,
  });

  factory PokemonModelResponse.fromJson(Map<String, dynamic> json) {
    return PokemonModelResponse(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      pixelIconUrl:
          json['sprites']['versions']['generation-v']['black-white']['front_default'],
      types: List<String>.from(json['types'].map((t) => t['type']['name'])),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imageUrl': imageUrl,
    'pixelIconUrl': pixelIconUrl,
    'types': types,
  };

  List<TypesEnum> get typeEnums =>
      types.map((t) => TypesEnum.fromString(t)).toList();
}

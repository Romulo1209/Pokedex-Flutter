class PokemonBaseModelResponse {
  final String name;
  final String url;

  PokemonBaseModelResponse({required this.name, required this.url});

  factory PokemonBaseModelResponse.fromJson(Map<String, dynamic> json) {
    return PokemonBaseModelResponse(name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

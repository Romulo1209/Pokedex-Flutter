import 'package:flutter/material.dart';

enum TypesEnum {
  normal('Normal'),
  fire('Fire'),
  water('Water'),
  electric('Electric'),
  grass('Grass'),
  ice('Ice'),
  fighting('Fighting'),
  poison('Poison'),
  ground('Ground'),
  flying('Flying'),
  psychic('Psychic'),
  bug('Bug'),
  rock('Rock'),
  ghost('Ghost'),
  dragon('Dragon'),
  dark('Dark'),
  steel('Steel'),
  fairy('Fairy');

  final String nameString;

  const TypesEnum(this.nameString);

  static TypesEnum fromString(String value) {
    return TypesEnum.values.firstWhere(
      (e) => e.nameString.toLowerCase() == value.toLowerCase(),
      orElse: () => TypesEnum.normal,
    );
  }

  String get assetPath => 'assets/type_icons/${nameString.toLowerCase()}.svg';

  Color get color {
    switch (this) {
      case TypesEnum.normal:
        return Color(0xFFA9A481);
      case TypesEnum.fire:
        return Color(0xFFE96C8C);
      case TypesEnum.water:
        return Color(0xFF3099E1);
      case TypesEnum.electric:
        return Color(0xFFE49021);
      case TypesEnum.grass:
        return Color(0xFF439837);
      case TypesEnum.ice:
        return Color(0xFF64CFCF);
      case TypesEnum.fighting:
        return Color(0xFF9354CB);
      case TypesEnum.poison:
        return Color(0xFF6F4570);
      case TypesEnum.ground:
        return Color(0xFFA4733C);
      case TypesEnum.flying:
        return Color(0xFF74B0CB);
      case TypesEnum.psychic:
        return Color(0xFFE291E2);
      case TypesEnum.bug:
        return Color(0xFF9F9F28);
      case TypesEnum.rock:
        return Color(0xFFDFBC28);
      case TypesEnum.ghost:
        return Color(0xFF4F4747);
      case TypesEnum.dragon:
        return Color(0xFF576FBC);
      case TypesEnum.dark:
        return Color(0xFF4F4747);
      case TypesEnum.steel:
        return Color(0xFF828282);
      case TypesEnum.fairy:
        return Color(0xFFE18CE1);
    }
  }

  Color get backgroundColor => Color.lerp(color, Colors.white, 0.2)!;
}

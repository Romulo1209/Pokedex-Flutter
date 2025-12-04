import 'package:flutter/material.dart';

enum GridTypeEnum {
  verticalList('verticalList'),
  squareList('squareList');

  final String nameString;

  const GridTypeEnum(this.nameString);

  IconData get gridTypeIcon {
    switch (this) {
      case GridTypeEnum.verticalList:
        return Icons.view_agenda;
      case GridTypeEnum.squareList:
        return Icons.grid_view_rounded;
    }
  }

  GridTypeEnum get next {
    switch (this) {
      case GridTypeEnum.verticalList:
        return GridTypeEnum.squareList;
      case GridTypeEnum.squareList:
        return GridTypeEnum.verticalList;
    }
  }
}

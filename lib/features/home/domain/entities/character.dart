// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Character({
    required bool adult,
    required int gender,
    required int id,
    required String knownForDepartment,
    required String name,
    required String originalName,
    required double popularity,
    String? profilePath,
    required int castId,
    required String character,
    required String creditId,
    required int order,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

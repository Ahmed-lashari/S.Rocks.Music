import 'package:json_annotation/json_annotation.dart';

part 'cards.g.dart';

@JsonSerializable()
class MusicCardsModel {
  final String icon;
  final String title;
  final String subTitle;
  final String suffix;
  final String background;
  final String navigateRoute;

  const MusicCardsModel(
      {required this.icon,
      required this.title,
      required this.subTitle,
      required this.suffix,
      required this.background,
      required this.navigateRoute});

// it will always be Map<String, String> but following the convention fro , dynamic
  factory MusicCardsModel.fromJson(Map<String, dynamic> json) =>
      _$CardsFromJson(json);

// same for toJson method asw
  Map<String, dynamic> toJson() => _$CardsToJson(this);
}

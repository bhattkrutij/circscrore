import 'package:circ_scrorer/utils/keys.dart';

class TournamentModel {
  final String tournamentName;
  final String overs;
  final String type;
  final String startDate;
  final String endDate;
  final String imageUrl;

  TournamentModel({
    required this.tournamentName,
    required this.overs,
    required this.startDate,
    required this.type,
    required this.endDate,
    required this.imageUrl,
  });
  factory TournamentModel.fromJson(Map<String, dynamic> json) {
    return TournamentModel(
      tournamentName: json[keyName],
      overs: json[keyOvers],
      type: json[keyType],
      startDate: json[keyStartDate],
      endDate: json[keyEndDate],
      imageUrl: json[keyImageUrl],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[keyName] = tournamentName;
    data[keyOvers] = overs;
    data[keyType] = type;
    data[keyStartDate] = startDate;
    data[keyEndDate] = endDate;
    data[keyImageUrl] = imageUrl;
    return data;
  }
}
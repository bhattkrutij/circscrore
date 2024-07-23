class TournamentModel {
  final String tournamentName;
  final String overs;
  final String startDate;
  final String endDate;
  final String imageUrl;

  TournamentModel({
    required this.tournamentName,
    required this.overs,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
  });
  factory TournamentModel.fromJson(Map<String, dynamic> json) {
    return TournamentModel(
      tournamentName: json['name'],
      overs: json['overs'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      imageUrl: json['imageUrl'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tournamentName'] = tournamentName;
    data['overs'] = overs;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
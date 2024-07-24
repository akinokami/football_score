class TeamFixModel {
  List<SeasonList>? seasonList;
  List<MatchList>? matchList;

  TeamFixModel({this.seasonList, this.matchList});

  TeamFixModel.fromJson(Map<String, dynamic> json) {
    if (json['season_list'] != null) {
      seasonList = <SeasonList>[];
      json['season_list'].forEach((v) {
        seasonList!.add(SeasonList.fromJson(v));
      });
    }

    if (json['list'] != null) {
      matchList = <MatchList>[];
      json['list'].forEach((v) {
        matchList!.add(MatchList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (seasonList != null) {
      data['season_list'] = seasonList!.map((v) => v.toJson()).toList();
    }

    if (matchList != null) {
      data['list'] = matchList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeasonList {
  String? name;
  String? url;
  int? sort;
  bool? current;

  SeasonList({this.name, this.url, this.sort, this.current});

  SeasonList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    sort = json['sort'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['sort'] = sort;
    data['current'] = current;
    return data;
  }
}

class MatchList {
  String? relateType;
  int? relateId;
  String? matchId;
  String? competitionId;
  String? competitionName;
  String? gameweek;
  String? teamAId;
  String? teamBId;
  String? teamAName;
  String? teamBName;
  String? teamALogo;
  String? teamBLogo;
  String? fsA;
  String? fsB;
  String? psA;
  String? psB;
  String? startPlay;
  String? suretime;
  String? status;
  String? playingTime;
  String? scheme;
  String? roundName;
  String? minute;
  String? minuteExtra;
  String? scoreColor;
  String? matchTitle;

  MatchList(
      {this.relateType,
      this.relateId,
      this.matchId,
      this.competitionId,
      this.competitionName,
      this.gameweek,
      this.teamAId,
      this.teamBId,
      this.teamAName,
      this.teamBName,
      this.teamALogo,
      this.teamBLogo,
      this.fsA,
      this.fsB,
      this.psA,
      this.psB,
      this.startPlay,
      this.suretime,
      this.status,
      this.playingTime,
      this.scheme,
      this.roundName,
      this.minute,
      this.minuteExtra,
      this.scoreColor,
      this.matchTitle});

  MatchList.fromJson(Map<String, dynamic> json) {
    relateType = json['relate_type'];
    relateId = json['relate_id'];
    matchId = json['match_id'];
    competitionId = json['competition_id'];
    competitionName = json['competition_name'];
    gameweek = json['gameweek'];
    teamAId = json['team_A_id'];
    teamBId = json['team_B_id'];
    teamAName = json['team_A_name'];
    teamBName = json['team_B_name'];
    teamALogo = json['team_A_logo'];
    teamBLogo = json['team_B_logo'];
    fsA = json['fs_A'];
    fsB = json['fs_B'];
    psA = json['ps_A'];
    psB = json['ps_B'];
    startPlay = json['start_play'];
    suretime = json['suretime'];
    status = json['status'];
    playingTime = json['playing_time'];
    scheme = json['scheme'];
    roundName = json['round_name'];
    minute = json['minute'];
    minuteExtra = json['minute_extra'];
    scoreColor = json['score_color'];
    matchTitle = json['match_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['relate_type'] = relateType;
    data['relate_id'] = relateId;
    data['match_id'] = matchId;
    data['competition_id'] = competitionId;
    data['competition_name'] = competitionName;
    data['gameweek'] = gameweek;
    data['team_A_id'] = teamAId;
    data['team_B_id'] = teamBId;
    data['team_A_name'] = teamAName;
    data['team_B_name'] = teamBName;
    data['team_A_logo'] = teamALogo;
    data['team_B_logo'] = teamBLogo;
    data['fs_A'] = fsA;
    data['fs_B'] = fsB;
    data['ps_A'] = psA;
    data['ps_B'] = psB;
    data['start_play'] = startPlay;
    data['suretime'] = suretime;
    data['status'] = status;
    data['playing_time'] = playingTime;
    data['scheme'] = scheme;
    data['round_name'] = roundName;
    data['minute'] = minute;
    data['minute_extra'] = minuteExtra;
    data['score_color'] = scoreColor;
    data['match_title'] = matchTitle;
    return data;
  }
}

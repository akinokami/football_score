class TeamStatsModel {
  String? type;
  Season? season;
  ScoreBoard? scoreBoard;

  TeamStatsModel({
    this.type,
    this.season,
    this.scoreBoard,
  });

  TeamStatsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    scoreBoard = json['score_board'] != null
        ? ScoreBoard.fromJson(json['score_board'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (scoreBoard != null) {
      data['score_board'] = scoreBoard!.toJson();
    }

    return data;
  }
}

class Season {
  String? name;
  int? rank;
  String? clubRank;
  String? record;
  Matches? matches;
  Matches? fiveMatches;

  Season(
      {this.name,
      this.rank,
      this.clubRank,
      this.record,
      this.matches,
      this.fiveMatches});

  Season.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rank = json['rank'];
    clubRank = json['club_rank'];
    record = json['record'];
    matches =
        json['matches'] != null ? Matches.fromJson(json['matches']) : null;
    fiveMatches = json['five_matches'] != null
        ? Matches.fromJson(json['five_matches'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['rank'] = rank;
    data['club_rank'] = clubRank;
    data['record'] = record;
    if (matches != null) {
      data['matches'] = matches!.toJson();
    }
    if (fiveMatches != null) {
      data['five_matches'] = fiveMatches!.toJson();
    }
    return data;
  }
}

class Matches {
  String? name;
  int? win;
  int? draw;
  int? lose;

  Matches({this.name, this.win, this.draw, this.lose});

  Matches.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    win = json['win'];
    draw = json['draw'];
    lose = json['lose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['win'] = win;
    data['draw'] = draw;
    data['lose'] = lose;
    return data;
  }
}

class ScoreBoard {
  String? name;
  List<Teams>? teams;

  ScoreBoard({this.name, this.teams});

  ScoreBoard.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teams {
  String? rank;
  String? lastRank;
  String? teamId;
  String? clubName;
  String? teamLogo;
  String? matchesTotal;
  String? matchesWon;
  String? matchesDraw;
  String? matchesLost;
  String? goalsPro;
  String? goalsAgainst;
  String? points;
  int? groupId;
  int? curTeam;

  Teams(
      {this.rank,
      this.lastRank,
      this.teamId,
      this.clubName,
      this.teamLogo,
      this.matchesTotal,
      this.matchesWon,
      this.matchesDraw,
      this.matchesLost,
      this.goalsPro,
      this.goalsAgainst,
      this.points,
      this.groupId,
      this.curTeam});

  Teams.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    lastRank = json['last_rank'];
    teamId = json['team_id'];
    clubName = json['club_name'];
    teamLogo = json['team_logo'];
    matchesTotal = json['matches_total'];
    matchesWon = json['matches_won'];
    matchesDraw = json['matches_draw'];
    matchesLost = json['matches_lost'];
    goalsPro = json['goals_pro'];
    goalsAgainst = json['goals_against'];
    points = json['points'];
    groupId = json['group_id'];
    curTeam = json['cur_team'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rank'] = rank;
    data['last_rank'] = lastRank;
    data['team_id'] = teamId;
    data['club_name'] = clubName;
    data['team_logo'] = teamLogo;
    data['matches_total'] = matchesTotal;
    data['matches_won'] = matchesWon;
    data['matches_draw'] = matchesDraw;
    data['matches_lost'] = matchesLost;
    data['goals_pro'] = goalsPro;
    data['goals_against'] = goalsAgainst;
    data['points'] = points;
    data['group_id'] = groupId;
    data['cur_team'] = curTeam;
    return data;
  }
}

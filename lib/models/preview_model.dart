class PreviewModel {
  Team? team;
  List<Prevews>? preList;

  PreviewModel({this.team, this.preList});

  PreviewModel.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    if (json['data'] != null) {
      preList = <Prevews>[];
      json['data'].forEach((v) {
        preList!.add(Prevews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (preList != null) {
      data['data'] = preList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  Away? away;
  Away? home;

  Team({this.away, this.home});

  Team.fromJson(Map<String, dynamic> json) {
    away = json['away'] != null ? Away.fromJson(json['away']) : null;
    home = json['home'] != null ? Away.fromJson(json['home']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (away != null) {
      data['away'] = away!.toJson();
    }
    if (home != null) {
      data['home'] = home!.toJson();
    }
    return data;
  }
}

class Away {
  String? id;
  String? name;
  String? shortName;
  String? logo;
  String? scheme;
  String? teamAge;
  String? teamMarketValue;

  Away(
      {this.id,
      this.name,
      this.shortName,
      this.logo,
      this.scheme,
      this.teamAge,
      this.teamMarketValue});

  Away.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    logo = json['logo'];
    scheme = json['scheme'];
    teamAge = json['team_age'];
    teamMarketValue = json['team_market_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['short_name'] = shortName;
    data['logo'] = logo;
    data['scheme'] = scheme;
    data['team_age'] = teamAge;
    data['team_market_value'] = teamMarketValue;
    return data;
  }
}

class Prevews {
  String? template;
  String? title;
  PreData? preData;
  String? scheme;

  Prevews({this.template, this.title, this.preData, this.scheme});

  Prevews.fromJson(Map<String, dynamic> json) {
    template = json['template'];
    title = json['title'];
    preData = json['data'] != null ? PreData.fromJson(json['data']) : null;
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['template'] = template;
    data['title'] = title;
    if (this.preData != null) {
      data['data'] = this.preData!.toJson();
    }
    data['scheme'] = scheme;
    return data;
  }
}

class PreData {
  Statistic? statistic;
  List<Matches>? matches;
  List<Away>? away;
  List<Home>? home;
  //Team? rankings;
  String? url;
  //List<Odds>? odds;
  String? teamAScore;
  String? teamBScore;
  String? winner;
  List<Details>? details;

  PreData(
      {this.statistic,
      this.matches,
      this.away,
      this.home,
      //this.rankings,
      this.url,
      // this.odds,
      this.teamAScore,
      this.teamBScore,
      this.winner,
      this.details});

  PreData.fromJson(Map<String, dynamic> json) {
    statistic = json['statistic'] != null
        ? Statistic.fromJson(json['statistic'])
        : null;
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
    if (json['away'] != null) {
      away = <Away>[];
      json['away'].forEach((v) {
        away!.add(Away.fromJson(v));
      });
    }
    if (json['home'] != null) {
      home = <Home>[];
      json['home'].forEach((v) {
        home!.add(Home.fromJson(v));
      });
    }
    // rankings =
    //     json['rankings'] != null ? Team.fromJson(json['rankings']) : null;
    url = json['url'];
    // if (json['odds'] != null) {
    //   odds = <Odds>[];
    //   json['odds'].forEach((v) {
    //     odds!.add(Odds.fromJson(v));
    //   });
    // }
    teamAScore = json['team_A_score'];
    teamBScore = json['team_B_score'];
    winner = json['winner'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (statistic != null) {
      data['statistic'] = statistic!.toJson();
    }
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    if (away != null) {
      data['away'] = away!.map((v) => v.toJson()).toList();
    }
    if (home != null) {
      data['home'] = home!.map((v) => v.toJson()).toList();
    }
    // if (rankings != null) {
    //   data['rankings'] = rankings!.toJson();
    // }
    data['url'] = url;
    // if (odds != null) {
    //   data['odds'] = odds!.map((v) => v.toJson()).toList();
    // }
    data['team_A_score'] = teamAScore;
    data['team_B_score'] = teamBScore;
    data['winner'] = winner;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Statistic {
  int? home;
  int? draw;
  int? away;

  Statistic({this.home, this.draw, this.away});

  Statistic.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    draw = json['draw'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['draw'] = draw;
    data['away'] = away;
    return data;
  }
}

class Matches {
  String? id;
  String? competition;
  String? season;
  String? round;
  Away? homeTeam;
  Away? awayTeam;
  String? startTime;
  String? status;
  String? homeScore;
  String? awayScore;
  String? color;
  String? mainTeam;
  String? scheme;
  String? asiaOdds;
  String? result;

  Matches(
      {this.id,
      this.competition,
      this.season,
      this.round,
      this.homeTeam,
      this.awayTeam,
      this.startTime,
      this.status,
      this.homeScore,
      this.awayScore,
      this.color,
      this.mainTeam,
      this.scheme,
      this.asiaOdds,
      this.result});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    competition = json['competition'];
    season = json['season'];
    round = json['round'];
    homeTeam =
        json['home_team'] != null ? Away.fromJson(json['home_team']) : null;
    awayTeam =
        json['away_team'] != null ? Away.fromJson(json['away_team']) : null;
    startTime = json['start_time'];
    status = json['status'];
    homeScore = json['home_score'];
    awayScore = json['away_score'];
    color = json['color'];
    mainTeam = json['main_team'];
    scheme = json['scheme'];
    asiaOdds = json['asia_odds'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['competition'] = competition;
    data['season'] = season;
    data['round'] = round;
    if (homeTeam != null) {
      data['home_team'] = homeTeam!.toJson();
    }
    if (awayTeam != null) {
      data['away_team'] = awayTeam!.toJson();
    }
    data['start_time'] = startTime;
    data['status'] = status;
    data['home_score'] = homeScore;
    data['away_score'] = awayScore;
    data['color'] = color;
    data['main_team'] = mainTeam;
    data['scheme'] = scheme;
    data['asia_odds'] = asiaOdds;
    data['result'] = result;
    return data;
  }
}

// class Away {
//   Home? home;
//   Home? away;
//   Home? total;

//   Away({this.home, this.away, this.total});

//   Away.fromJson(Map<String, dynamic> json) {
//     home = json['home'] != null ? Home.fromJson(json['home']) : null;
//     away = json['away'] != null ? Home.fromJson(json['away']) : null;
//     total = json['total'] != null ? Home.fromJson(json['total']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.home != null) {
//       data['home'] = this.home!.toJson();
//     }
//     if (this.away != null) {
//       data['away'] = this.away!.toJson();
//     }
//     if (this.total != null) {
//       data['total'] = this.total!.toJson();
//     }
//     return data;
//   }
// }

class Home {
  String? rank;
  String? lastRank;
  String? matchesTotal;
  String? matchesWon;
  String? matchesDraw;
  String? matchesLost;
  String? goalsPro;
  String? goalsAgainst;
  String? points;

  Home(
      {this.rank,
      this.lastRank,
      this.matchesTotal,
      this.matchesWon,
      this.matchesDraw,
      this.matchesLost,
      this.goalsPro,
      this.goalsAgainst,
      this.points});

  Home.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    lastRank = json['last_rank'];
    matchesTotal = json['matches_total'];
    matchesWon = json['matches_won'];
    matchesDraw = json['matches_draw'];
    matchesLost = json['matches_lost'];
    goalsPro = json['goals_pro'];
    goalsAgainst = json['goals_against'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rank'] = rank;
    data['last_rank'] = lastRank;
    data['matches_total'] = matchesTotal;
    data['matches_won'] = matchesWon;
    data['matches_draw'] = matchesDraw;
    data['matches_lost'] = matchesLost;
    data['goals_pro'] = goalsPro;
    data['goals_against'] = goalsAgainst;
    data['points'] = points;
    return data;
  }
}

// class Odds {
//   String? title;
//   List<Odds>? odds;

//   Odds({this.title, this.odds});

//   Odds.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     if (json['odds'] != null) {
//       odds = <Odds>[];
//       json['odds'].forEach((v) {
//         odds!.add(Odds.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['title'] = this.title;
//     if (this.odds != null) {
//       data['odds'] = this.odds!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Odds {
//   Company? company;
//   Odds? odds;
//   String? url;
//   int? isTurn;

//   Odds({this.company, this.odds, this.url, this.isTurn});

//   Odds.fromJson(Map<String, dynamic> json) {
//     company =
//         json['company'] != null ? Company.fromJson(json['company']) : null;
//     odds = json['odds'] != null ? Odds.fromJson(json['odds']) : null;
//     url = json['url'];
//     isTurn = json['is_turn'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.company != null) {
//       data['company'] = this.company!.toJson();
//     }
//     if (this.odds != null) {
//       data['odds'] = this.odds!.toJson();
//     }
//     data['url'] = this.url;
//     data['is_turn'] = this.isTurn;
//     return data;
//   }
// }

// class Company {
//   String? id;
//   String? name;
//   String? enName;
//   String? cnName;
//   int? weight;
//   int? fixedOdds;

//   Company(
//       {this.id,
//       this.name,
//       this.enName,
//       this.cnName,
//       this.weight,
//       this.fixedOdds});

//   Company.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     enName = json['en_name'];
//     cnName = json['cn_name'];
//     weight = json['weight'];
//     fixedOdds = json['fixed_odds'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['en_name'] = enName;
//     data['cn_name'] = cnName;
//     data['weight'] = weight;
//     data['fixed_odds'] = fixedOdds;
//     return data;
//   }
// }

// class Odds {
//   First? first;
//   First? last;

//   Odds({this.first, this.last});

//   Odds.fromJson(Map<String, dynamic> json) {
//     first = json['first'] != null ? First.fromJson(json['first']) : null;
//     last = json['last'] != null ? First.fromJson(json['last']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (first != null) {
//       data['first'] = first!.toJson();
//     }
//     if (last != null) {
//       data['last'] = last!.toJson();
//     }
//     return data;
//   }
// }

class First {
  String? home;
  String? draw;
  String? away;
  String? timestamp;

  First({this.home, this.draw, this.away, this.timestamp});

  First.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    draw = json['draw'];
    away = json['away'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['draw'] = draw;
    data['away'] = away;
    data['timestamp'] = timestamp;
    return data;
  }
}

class Details {
  String? title;
  TeamA? teamA;
  TeamA? teamB;
  String? winner;
  String? halfWinner;
  String? sHalfWinner;

  Details(
      {this.title,
      this.teamA,
      this.teamB,
      this.winner,
      this.halfWinner,
      this.sHalfWinner});

  Details.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    teamA = json['team_A'] != null ? TeamA.fromJson(json['team_A']) : null;
    teamB = json['team_B'] != null ? TeamA.fromJson(json['team_B']) : null;
    winner = json['winner'];
    halfWinner = json['half_winner'];
    sHalfWinner = json['s_half_winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (teamA != null) {
      data['team_A'] = teamA!.toJson();
    }
    if (teamB != null) {
      data['team_B'] = teamB!.toJson();
    }
    data['winner'] = winner;
    data['half_winner'] = halfWinner;
    data['s_half_winner'] = sHalfWinner;
    return data;
  }
}

class TeamA {
  String? matchInfo;
  String? score;
  String? half;
  String? sHalf;

  TeamA({this.matchInfo, this.score, this.half, this.sHalf});

  TeamA.fromJson(Map<String, dynamic> json) {
    matchInfo = json['match_info'];
    score = json['score'];
    half = json['half'];
    sHalf = json['s_half'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['match_info'] = matchInfo;
    data['score'] = score;
    data['half'] = half;
    data['s_half'] = sHalf;
    return data;
  }
}

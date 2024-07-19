class OverviewModel {
  Away? team;
  List<Overviews>? oList;

  OverviewModel({this.team, this.oList});

  OverviewModel.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? Away.fromJson(json['team']) : null;
    if (json['data'] != null) {
      oList = <Overviews>[];
      json['data'].forEach((v) {
        oList!.add(Overviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (oList != null) {
      data['data'] = oList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  Home? away;
  Away? home;

  Team({this.away, this.home});

  Team.fromJson(Map<String, dynamic> json) {
    away = json['away'] != null ? Home.fromJson(json['away']) : null;
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

class Overviews {
  String? template;
  String? title;
  Odata? oData;
  String? scheme;

  Overviews({this.template, this.title, this.oData, this.scheme});

  Overviews.fromJson(Map<String, dynamic> json) {
    template = json['template'];
    title = json['title'];
    oData = json['data'] != null ? Odata.fromJson(json['data']) : null;
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['template'] = template;
    data['title'] = title;
    if (oData != null) {
      data['data'] = oData!.toJson();
    }
    data['scheme'] = scheme;
    return data;
  }
}

class Odata {
  List<Tendencies>? tendencies;
  String? teamALogo;
  String? teamBLogo;
  int? teamAScore;
  int? teamBScore;
  List<Statistics>? statistics;
  List<Events>? events;
  List<Rankings>? rankings;
  String? url;

  Odata(
      {this.tendencies,
      this.teamALogo,
      this.teamBLogo,
      this.teamAScore,
      this.teamBScore,
      this.statistics,
      this.events,
      this.rankings,
      this.url});

  Odata.fromJson(Map<String, dynamic> json) {
    if (json['tendencies'] != null) {
      tendencies = <Tendencies>[];
      json['tendencies'].forEach((v) {
        tendencies!.add(Tendencies.fromJson(v));
      });
    }
    teamALogo = json['team_a_logo'];
    teamBLogo = json['team_b_logo'];
    teamAScore = json['team_a_score'];
    teamBScore = json['team_b_score'];
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(Statistics.fromJson(v));
      });
    }
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    if (json['rankings'] != null) {
      rankings = <Rankings>[];
      json['rankings'].forEach((v) {
        rankings!.add(Rankings.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tendencies != null) {
      data['tendencies'] = tendencies!.map((v) => v.toJson()).toList();
    }
    data['team_a_logo'] = teamALogo;
    data['team_b_logo'] = teamBLogo;
    data['team_a_score'] = teamAScore;
    data['team_b_score'] = teamBScore;
    if (statistics != null) {
      data['statistics'] = statistics!.map((v) => v.toJson()).toList();
    }
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    if (rankings != null) {
      data['rankings'] = rankings!.map((v) => v.toJson()).toList();
    }
    data['url'] = url;
    return data;
  }
}

class Tendencies {
  int? matchId;
  int? x;
  String? y;
  String? minute;
  List<TeamAGoal>? teamAGoal;
  List<TeamAGoal>? teamBGoal;

  Tendencies(
      {this.matchId,
      this.x,
      this.y,
      this.minute,
      this.teamAGoal,
      this.teamBGoal});

  Tendencies.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    x = json['x'];
    y = json['y'];
    minute = json['minute'];
    if (json['team_a_goal'] != null) {
      teamAGoal = <TeamAGoal>[];
      json['team_a_goal'].forEach((v) {
        teamAGoal!.add(TeamAGoal.fromJson(v));
      });
    }
    if (json['team_b_goal'] != null) {
      teamBGoal = <TeamAGoal>[];
      json['team_b_goal'].forEach((v) {
        teamBGoal!.add(TeamAGoal.fromJson(v));
      });
    }
    //teamBGoal = json['team_b_goal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['match_id'] = matchId;
    data['x'] = x;
    data['y'] = y;
    data['minute'] = minute;
    if (teamAGoal != null) {
      data['team_a_goal'] = teamAGoal!.map((v) => v.toJson()).toList();
    }
    if (teamAGoal != null) {
      data['team_b_goal'] = teamAGoal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamAGoal {
  String? id;
  String? relateId;
  Away? team;
  Person? person;
  String? code;
  String? name;
  String? reason;
  String? logo;
  String? minute;
  String? minuteExtra;
  String? isHomeTeam;
  String? timestamp;

  TeamAGoal(
      {this.id,
      this.relateId,
      this.team,
      this.person,
      this.code,
      this.name,
      this.reason,
      this.logo,
      this.minute,
      this.minuteExtra,
      this.isHomeTeam,
      this.timestamp});

  TeamAGoal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    relateId = json['relate_id'];
    team = json['team'] != null ? Away.fromJson(json['team']) : null;
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
    code = json['code'];
    name = json['name'];
    reason = json['reason'];
    logo = json['logo'];
    minute = json['minute'];
    minuteExtra = json['minute_extra'];
    isHomeTeam = json['is_home_team'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['relate_id'] = relateId;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (person != null) {
      data['person'] = person!.toJson();
    }
    data['code'] = code;
    data['name'] = name;
    data['reason'] = reason;
    data['logo'] = logo;
    data['minute'] = minute;
    data['minute_extra'] = minuteExtra;
    data['is_home_team'] = isHomeTeam;
    data['timestamp'] = timestamp;
    return data;
  }
}

class TeamModel {
  String? id;
  String? name;
  String? shortName;
  String? logo;
  String? bkLogo;
  String? type;
  String? marketValue;
  String? teamType;
  String? teamLogoMd5;

  TeamModel(
      {this.id,
      this.name,
      this.shortName,
      this.logo,
      this.bkLogo,
      this.type,
      this.marketValue,
      this.teamType,
      this.teamLogoMd5});

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    logo = json['logo'];
    bkLogo = json['bk_logo'];
    type = json['type'];
    marketValue = json['market_value'];
    teamType = json['team_type'];
    teamLogoMd5 = json['team_logo_md5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['short_name'] = shortName;
    data['logo'] = logo;
    data['bk_logo'] = bkLogo;
    data['type'] = type;
    data['market_value'] = marketValue;
    data['team_type'] = teamType;
    data['team_logo_md5'] = teamLogoMd5;
    return data;
  }
}

class Person {
  String? id;
  String? name;
  String? shortName;
  String? logo;

  Person({this.id, this.name, this.shortName, this.logo});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['short_name'] = shortName;
    data['logo'] = logo;
    return data;
  }
}

class Statistics {
  String? name;
  String? homeTeamValue;
  String? awayTeamValue;
  String? eventImg;
  String? totalValue;

  Statistics(
      {this.name,
      this.homeTeamValue,
      this.awayTeamValue,
      this.eventImg,
      this.totalValue});

  Statistics.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    homeTeamValue = json['home_team_value'];
    awayTeamValue = json['away_team_value'];
    eventImg = json['event_img'];
    totalValue = json['total_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['home_team_value'] = homeTeamValue;
    data['away_team_value'] = awayTeamValue;
    data['event_img'] = eventImg;
    data['total_value'] = totalValue;
    return data;
  }
}

class Events {
  String? minute;
  String? minuteExtra;
  List<Home>? home;
  List<Away>? away;
  //Null? neutral;
  String? period;

  Events(
      {this.minute,
      this.minuteExtra,
      this.home,
      this.away,
      //this.neutral,
      this.period});

  Events.fromJson(Map<String, dynamic> json) {
    minute = json['minute'];
    minuteExtra = json['minute_extra'];
    if (json['home'] != null) {
      home = <Home>[];
      json['home'].forEach((v) {
        home!.add(Home.fromJson(v));
      });
    }
    if (json['away'] != null) {
      away = <Away>[];
      json['away'].forEach((v) {
        away!.add(Away.fromJson(v));
      });
    }
    //  neutral = json['neutral'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minute'] = minute;
    data['minute_extra'] = minuteExtra;
    if (home != null) {
      data['home'] = home!.map((v) => v.toJson()).toList();
    }
    if (away != null) {
      data['away'] = away!.map((v) => v.toJson()).toList();
    }
    //  data['neutral'] = neutral;
    data['period'] = period;
    return data;
  }
}

class Home {
  String? id;
  Person? person;
  String? code;
  String? name;
  String? logo;
  String? minute;
  String? minuteExtra;
  // List<Null>? images;
  String? scheme;
  String? score;
  String? eventName;
  String? eventDetail;

  Home(
      {this.id,
      this.person,
      this.code,
      this.name,
      this.logo,
      this.minute,
      this.minuteExtra,
      // this.images,
      this.scheme,
      this.score,
      this.eventName,
      this.eventDetail});

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
    code = json['code'];
    name = json['name'];
    logo = json['logo'];
    minute = json['minute'];
    minuteExtra = json['minute_extra'];
    // if (json['images'] != null) {
    //   images = <Null>[];
    //   json['images'].forEach((v) {
    //     images!.add(new Null.fromJson(v));
    //   });
    // }
    scheme = json['scheme'];
    score = json['score'];
    eventName = json['event_name'];
    eventDetail = json['event_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (person != null) {
      data['person'] = person!.toJson();
    }
    data['code'] = code;
    data['name'] = name;
    data['logo'] = logo;
    data['minute'] = minute;
    data['minute_extra'] = minuteExtra;
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    data['scheme'] = scheme;
    data['score'] = score;
    data['event_name'] = eventName;
    data['event_detail'] = eventDetail;
    return data;
  }
}

class PersonModel {
  String? id;
  String? name;
  String? logo;
  String? scheme;

  PersonModel({this.id, this.name, this.logo, this.scheme});

  PersonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['scheme'] = scheme;
    return data;
  }
}

class Rankings {
  Away? team;
  String? rank;
  String? lastRank;
  String? matchesTotal;
  String? matchesWon;
  String? matchesDraw;
  String? matchesLost;
  String? goalsPro;
  String? goalsAgainst;
  String? points;
  int? curTeam;

  Rankings(
      {this.team,
      this.rank,
      this.lastRank,
      this.matchesTotal,
      this.matchesWon,
      this.matchesDraw,
      this.matchesLost,
      this.goalsPro,
      this.goalsAgainst,
      this.points,
      this.curTeam});

  Rankings.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? Away.fromJson(json['team']) : null;
    rank = json['rank'];
    lastRank = json['last_rank'];
    matchesTotal = json['matches_total'];
    matchesWon = json['matches_won'];
    matchesDraw = json['matches_draw'];
    matchesLost = json['matches_lost'];
    goalsPro = json['goals_pro'];
    goalsAgainst = json['goals_against'];
    points = json['points'];
    curTeam = json['cur_team'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['rank'] = rank;
    data['last_rank'] = lastRank;
    data['matches_total'] = matchesTotal;
    data['matches_won'] = matchesWon;
    data['matches_draw'] = matchesDraw;
    data['matches_lost'] = matchesLost;
    data['goals_pro'] = goalsPro;
    data['goals_against'] = goalsAgainst;
    data['points'] = points;
    data['cur_team'] = curTeam;
    return data;
  }
}

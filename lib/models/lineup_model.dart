class LineupModel {
  Team? team;
  List<MatchLineup>? data;

  LineupModel({this.team, this.data});

  LineupModel.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    if (json['data'] != null) {
      data = <MatchLineup>[];
      json['data'].forEach((v) {
        data!.add(MatchLineup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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

class MatchLineup {
  String? template;
  String? title;
  LupData? data;
  String? scheme;

  MatchLineup({this.template, this.title, this.data, this.scheme});

  MatchLineup.fromJson(Map<String, dynamic> json) {
    template = json['template'];
    title = json['title'];
    data = json['data'] != null ? LupData.fromJson(json['data']) : null;
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['template'] = template;
    data['title'] = title;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['scheme'] = scheme;
    return data;
  }
}

class LupData {
  List<Official>? official;
  Away? home;
  Away? away;
  String? venue;
  String? weather;
  String? temperature;
  String? display;
  int? forecast;
  int? statistic;

  LupData(
      {this.official,
      this.home,
      this.away,
      this.venue,
      this.weather,
      this.temperature,
      this.display,
      this.forecast,
      this.statistic});

  LupData.fromJson(Map<String, dynamic> json) {
    if (json['official'] != null) {
      official = <Official>[];
      json['official'].forEach((v) {
        official!.add(Official.fromJson(v));
      });
    }
    home = json['home'] != null ? Away.fromJson(json['home']) : null;
    away = json['away'] != null ? Away.fromJson(json['away']) : null;
    venue = json['venue'];
    weather = json['weather'];
    temperature = json['temperature'];
    display = json['display'];
    forecast = json['forecast'];
    statistic = json['statistic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (official != null) {
      data['official'] = official!.map((v) => v.toJson()).toList();
    }
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (away != null) {
      data['away'] = away!.toJson();
    }
    data['venue'] = venue;
    data['weather'] = weather;
    data['temperature'] = temperature;
    data['display'] = display;
    data['forecast'] = forecast;
    data['statistic'] = statistic;
    return data;
  }
}

class Official {
  Person? person;
  String? role;
  String? color;

  Official({this.person, this.role, this.color});

  Official.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
    role = json['role'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (person != null) {
      data['person'] = person!.toJson();
    }
    data['role'] = role;
    data['color'] = color;
    return data;
  }
}

class Person {
  String? id;
  String? name;
  String? logo;
  String? scheme;

  Person({this.id, this.name, this.logo, this.scheme});

  Person.fromJson(Map<String, dynamic> json) {
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

class Home {
  String? formation;
  int? rate;
  List<Coach>? coach;
  List<Start>? start;
  List<Sub>? sub;
  // List<Null>? sideLine;

  Home({
    this.formation,
    this.rate,
    this.coach,
    this.start,
    this.sub,
    //  this.sideLine
  });

  Home.fromJson(Map<String, dynamic> json) {
    formation = json['formation'];
    rate = json['rate'];
    if (json['coach'] != null) {
      coach = <Coach>[];
      json['coach'].forEach((v) {
        coach!.add(Coach.fromJson(v));
      });
    }
    if (json['start'] != null) {
      start = <Start>[];
      json['start'].forEach((v) {
        start!.add(Start.fromJson(v));
      });
    }
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub!.add(Sub.fromJson(v));
      });
    }
    // if (json['side_line'] != null) {
    //   sideLine = <Null>[];
    //   json['side_line'].forEach((v) {
    //     sideLine!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['formation'] = formation;
    data['rate'] = rate;
    if (coach != null) {
      data['coach'] = coach!.map((v) => v.toJson()).toList();
    }
    if (start != null) {
      data['start'] = start!.map((v) => v.toJson()).toList();
    }
    if (sub != null) {
      data['sub'] = sub!.map((v) => v.toJson()).toList();
    }
    // if (sideLine != null) {
    //   data['side_line'] = sideLine!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Start {
  Person? person;
  String? role;
  String? color;
  String? positionX;
  String? positionY;
  String? shirtNumber;
  String? position;
  List<Events>? events;
  //Statistic? statistic;

  Start({
    this.person,
    this.role,
    this.color,
    this.positionX,
    this.positionY,
    this.shirtNumber,
    this.position,
    this.events,
    // this.statistic
  });

  Start.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
    role = json['role'];
    color = json['color'];
    positionX = json['position_x'];
    positionY = json['position_y'];
    shirtNumber = json['shirt_number'];
    position = json['position'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    // statistic = json['statistic'] != null
    //     ? Statistic.fromJson(json['statistic'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (person != null) {
      data['person'] = person!.toJson();
    }
    data['role'] = role;
    data['color'] = color;
    data['position_x'] = positionX;
    data['position_y'] = positionY;
    data['shirt_number'] = shirtNumber;
    data['position'] = position;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    // if (statistic != null) {
    //   data['statistic'] = statistic!.toJson();
    // }
    return data;
  }
}

class Coach {
  Person? person;
  String? role;
  String? color;

  Coach({this.person, this.role, this.color});

  Coach.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
    role = json['role'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (person != null) {
      data['person'] = person!.toJson();
    }
    data['role'] = role;
    data['color'] = color;
    return data;
  }
}

class Events {
  String? code;
  String? logo;
  String? minute;
  String? minuteExtra;

  Events({this.code, this.logo, this.minute, this.minuteExtra});

  Events.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    logo = json['logo'];
    minute = json['minute'];
    minuteExtra = json['minute_extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['logo'] = logo;
    data['minute'] = minute;
    data['minute_extra'] = minuteExtra;
    return data;
  }
}

// class Statistic {
//   List<Null>? summaries;
//   List<Null>? keys;
//   List<Null>? details;

//   Statistic({this.summaries, this.keys, this.details});

//   Statistic.fromJson(Map<String, dynamic> json) {
//     if (json['summaries'] != null) {
//       summaries = <Null>[];
//       json['summaries'].forEach((v) {
//         summaries!.add(Null.fromJson(v));
//       });
//     }
//     if (json['keys'] != null) {
//       keys = <Null>[];
//       json['keys'].forEach((v) {
//         keys!.add(Null.fromJson(v));
//       });
//     }
//     if (json['details'] != null) {
//       details = <Null>[];
//       json['details'].forEach((v) {
//         details!.add(Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (summaries != null) {
//       data['summaries'] = summaries!.map((v) => v.toJson()).toList();
//     }
//     if (keys != null) {
//       data['keys'] = keys!.map((v) => v.toJson()).toList();
//     }
//     if (details != null) {
//       data['details'] = details!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Sub {
  Person? person;
  String? role;
  String? color;
  String? shirtNumber;
  String? position;
  List<Events>? events;
  //Statistic? statistic;

  Sub({
    this.person,
    this.role,
    this.color,
    this.shirtNumber,
    this.position,
    this.events,
    //  this.statistic
  });

  Sub.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
    role = json['role'];
    color = json['color'];
    shirtNumber = json['shirt_number'];
    position = json['position'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    // statistic = json['statistic'] != null
    //     ? Statistic.fromJson(json['statistic'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (person != null) {
      data['person'] = person!.toJson();
    }
    data['role'] = role;
    data['color'] = color;
    data['shirt_number'] = shirtNumber;
    data['position'] = position;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    // if (statistic != null) {
    //   data['statistic'] = statistic!.toJson();
    // }
    return data;
  }
}

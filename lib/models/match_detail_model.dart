class MatchDetailModel {
  MatchSample? matchSample;
  int? coverage;
  // List<Null>? living;
  //List<Null>? matchLiving;
  MatchAnalysis? matchAnalysis;
  MatchAnalysis? matchSK;
  MatchAnalysis? matchOdds;
  String? lotteryUrl;
  String? socUrl;
  MatchFormation? matchFormation;
  // Null? tips;
  Tabs? tabs;
  // Null? room;

  MatchDetailModel({
    this.matchSample,
    this.coverage,
    // this.living,
    // this.matchLiving,
    this.matchAnalysis,
    this.matchSK,
    this.matchOdds,
    this.lotteryUrl,
    this.socUrl,
    this.matchFormation,
    // this.tips,
    this.tabs,
    // this.room
  });

  MatchDetailModel.fromJson(Map<String, dynamic> json) {
    matchSample = json['matchSample'] != null
        ? MatchSample.fromJson(json['matchSample'])
        : null;
    coverage = json['coverage'];
    // if (json['living'] != null) {
    //   living = <Null>[];
    //   json['living'].forEach((v) {
    //     living!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['matchLiving'] != null) {
    //   matchLiving = <Null>[];
    //   json['matchLiving'].forEach((v) {
    //     matchLiving!.add(Null.fromJson(v));
    //   });
    // }
    matchAnalysis = json['matchAnalysis'] != null
        ? MatchAnalysis.fromJson(json['matchAnalysis'])
        : null;
    matchSK = json['matchSK'] != null
        ? MatchAnalysis.fromJson(json['matchSK'])
        : null;
    matchOdds = json['matchOdds'] != null
        ? MatchAnalysis.fromJson(json['matchOdds'])
        : null;
    lotteryUrl = json['lottery_url'];
    socUrl = json['soc_url'];
    matchFormation = json['matchFormation'] != null
        ? MatchFormation.fromJson(json['matchFormation'])
        : null;
    // tips = json['tips'];
    tabs = json['tabs'] != null ? Tabs.fromJson(json['tabs']) : null;
    // room = json['room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matchSample != null) {
      data['matchSample'] = matchSample!.toJson();
    }
    data['coverage'] = coverage;
    // if (living != null) {
    //   data['living'] = living!.map((v) => v.toJson()).toList();
    // }
    // if (matchLiving != null) {
    //   data['matchLiving'] = matchLiving!.map((v) => v.toJson()).toList();
    // }
    if (matchAnalysis != null) {
      data['matchAnalysis'] = matchAnalysis!.toJson();
    }
    if (matchSK != null) {
      data['matchSK'] = matchSK!.toJson();
    }
    if (matchOdds != null) {
      data['matchOdds'] = matchOdds!.toJson();
    }
    data['lottery_url'] = lotteryUrl;
    data['soc_url'] = socUrl;
    if (matchFormation != null) {
      data['matchFormation'] = matchFormation!.toJson();
    }
    //data['tips'] = tips;
    if (tabs != null) {
      data['tabs'] = tabs!.toJson();
    }
    //data['room'] = room;
    return data;
  }
}

class MatchSample {
  String? relateType;
  String? relateId;
  String? matchId;
  String? competitionId;
  String? competitionName;
  String? competitionBkLogo;
  String? groupId;
  String? groupName;
  String? gameweek;
  String? roundName;
  String? status;
  String? minute;
  String? playingShowTime;
  bool? suretime;
  String? dateUtc;
  String? timeUtc;
  String? startPlay;
  // Null? minuteExtra;
  // Null? minutePeriod;
  String? teamAId;
  String? teamAName;
  String? teamALogo;
  String? teamAScheme;
  String? teamBId;
  String? teamBName;
  String? teamBLogo;
  String? teamBScheme;
  String? fsA;
  String? fsB;
  String? htsA;
  String? htsB;
  String? etsA;
  String? etsB;
  String? psA;
  String? psB;
  String? livingTv;
  bool? onlySem;
  bool? zhanbaoFlag;
  bool? eventFlag;
  bool? animation;
  bool? highlight;
  // Null? redirectMiddle;
  String? bgLogo;

  MatchSample(
      {this.relateType,
      this.relateId,
      this.matchId,
      this.competitionId,
      this.competitionName,
      this.competitionBkLogo,
      this.groupId,
      this.groupName,
      this.gameweek,
      this.roundName,
      this.status,
      this.minute,
      this.playingShowTime,
      this.suretime,
      this.dateUtc,
      this.timeUtc,
      this.startPlay,
      // this.minuteExtra,
      // this.minutePeriod,
      this.teamAId,
      this.teamAName,
      this.teamALogo,
      this.teamAScheme,
      this.teamBId,
      this.teamBName,
      this.teamBLogo,
      this.teamBScheme,
      this.fsA,
      this.fsB,
      this.htsA,
      this.htsB,
      this.etsA,
      this.etsB,
      this.psA,
      this.psB,
      this.livingTv,
      this.onlySem,
      this.zhanbaoFlag,
      this.eventFlag,
      this.animation,
      this.highlight,
      //this.redirectMiddle,
      this.bgLogo});

  MatchSample.fromJson(Map<String, dynamic> json) {
    relateType = json['relate_type'];
    relateId = json['relate_id'];
    matchId = json['match_id'];
    competitionId = json['competition_id'];
    competitionName = json['competition_name'];
    competitionBkLogo = json['competition_bk_logo'];
    groupId = json['group_id'];
    groupName = json['group_name'];
    gameweek = json['gameweek'];
    roundName = json['round_name'];
    status = json['status'];
    minute = json['minute'];
    playingShowTime = json['playing_show_time'];
    suretime = json['suretime'];
    dateUtc = json['date_utc'];
    timeUtc = json['time_utc'];
    startPlay = json['start_play'];
    // minuteExtra = json['minute_extra'];
    // minutePeriod = json['minute_period'];
    teamAId = json['team_A_id'];
    teamAName = json['team_A_name'];
    teamALogo = json['team_A_logo'];
    teamAScheme = json['team_A_scheme'];
    teamBId = json['team_B_id'];
    teamBName = json['team_B_name'];
    teamBLogo = json['team_B_logo'];
    teamBScheme = json['team_B_scheme'];
    fsA = json['fs_A'];
    fsB = json['fs_B'];
    htsA = json['hts_A'];
    htsB = json['hts_B'];
    etsA = json['ets_A'];
    etsB = json['ets_B'];
    psA = json['ps_A'];
    psB = json['ps_B'];
    livingTv = json['livingTv'];
    onlySem = json['onlySem'];
    zhanbaoFlag = json['zhanbaoFlag'];
    eventFlag = json['eventFlag'];
    animation = json['animation'];
    highlight = json['highlight'];
    //redirectMiddle = json['redirect_middle'];
    bgLogo = json['bg_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['relate_type'] = relateType;
    data['relate_id'] = relateId;
    data['match_id'] = matchId;
    data['competition_id'] = competitionId;
    data['competition_name'] = competitionName;
    data['competition_bk_logo'] = competitionBkLogo;
    data['group_id'] = groupId;
    data['group_name'] = groupName;
    data['gameweek'] = gameweek;
    data['round_name'] = roundName;
    data['status'] = status;
    data['minute'] = minute;
    data['playing_show_time'] = playingShowTime;
    data['suretime'] = suretime;
    data['date_utc'] = dateUtc;
    data['time_utc'] = timeUtc;
    data['start_play'] = startPlay;
    // data['minute_extra'] = minuteExtra;
    // data['minute_period'] = minutePeriod;
    data['team_A_id'] = teamAId;
    data['team_A_name'] = teamAName;
    data['team_A_logo'] = teamALogo;
    data['team_A_scheme'] = teamAScheme;
    data['team_B_id'] = teamBId;
    data['team_B_name'] = teamBName;
    data['team_B_logo'] = teamBLogo;
    data['team_B_scheme'] = teamBScheme;
    data['fs_A'] = fsA;
    data['fs_B'] = fsB;
    data['hts_A'] = htsA;
    data['hts_B'] = htsB;
    data['ets_A'] = etsA;
    data['ets_B'] = etsB;
    data['ps_A'] = psA;
    data['ps_B'] = psB;
    data['livingTv'] = livingTv;
    data['onlySem'] = onlySem;
    data['zhanbaoFlag'] = zhanbaoFlag;
    data['eventFlag'] = eventFlag;
    data['animation'] = animation;
    data['highlight'] = highlight;
    // data['redirect_middle'] = redirectMiddle;
    data['bg_logo'] = bgLogo;
    return data;
  }
}

class MatchAnalysis {
  String? url;

  MatchAnalysis({this.url});

  MatchAnalysis.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class MatchFormation {
  bool? formationFlag;
  String? venueName;
  String? weather;
  String? temperature;
  String? referee;
  TeamA? teamA;
  TeamA? teamB;

  MatchFormation(
      {this.formationFlag,
      this.venueName,
      this.weather,
      this.temperature,
      this.referee,
      this.teamA,
      this.teamB});

  MatchFormation.fromJson(Map<String, dynamic> json) {
    formationFlag = json['formationFlag'];
    venueName = json['venue_name'];
    weather = json['weather'];
    temperature = json['temperature'];
    referee = json['referee'];
    teamA = json['team_A'] != null ? TeamA.fromJson(json['team_A']) : null;
    teamB = json['team_B'] != null ? TeamA.fromJson(json['team_B']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['formationFlag'] = formationFlag;
    data['venue_name'] = venueName;
    data['weather'] = weather;
    data['temperature'] = temperature;
    data['referee'] = referee;
    if (teamA != null) {
      data['team_A'] = teamA!.toJson();
    }
    if (teamB != null) {
      data['team_B'] = teamB!.toJson();
    }
    return data;
  }
}

class TeamA {
  int? teamId;
  String? formationPic;
  List<Lineups>? lineups;
  List<Sub>? sub;
  String? formation;

  TeamA(
      {this.teamId, this.formationPic, this.lineups, this.sub, this.formation});

  TeamA.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    formationPic = json['formation_pic'];
    if (json['lineups'] != null) {
      lineups = <Lineups>[];
      json['lineups'].forEach((v) {
        lineups!.add(Lineups.fromJson(v));
      });
    }
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub!.add(Sub.fromJson(v));
      });
    }
    formation = json['formation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_id'] = teamId;
    data['formation_pic'] = formationPic;
    if (lineups != null) {
      data['lineups'] = lineups!.map((v) => v.toJson()).toList();
    }
    if (sub != null) {
      data['sub'] = sub!.map((v) => v.toJson()).toList();
    }
    data['formation'] = formation;
    return data;
  }
}

class Lineups {
  int? personId;
  String? person;
  String? shirtnumber;
  String? positionX;
  String? positionY;

  Lineups(
      {this.personId,
      this.person,
      this.shirtnumber,
      this.positionX,
      this.positionY});

  Lineups.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    person = json['person'];
    shirtnumber = json['shirtnumber'];
    positionX = json['position_x'];
    positionY = json['position_y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['person_id'] = personId;
    data['person'] = person;
    data['shirtnumber'] = shirtnumber;
    data['position_x'] = positionX;
    data['position_y'] = positionY;
    return data;
  }
}

class Sub {
  int? personId;
  String? person;
  String? shirtnumber;
  // Null? positionX;
  // Null? positionY;

  Sub({
    this.personId,
    this.person,
    this.shirtnumber,
    // this.positionX,
    // this.positionY
  });

  Sub.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    person = json['person'];
    shirtnumber = json['shirtnumber'];
    // positionX = json['position_x'];
    // positionY = json['position_y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['person_id'] = personId;
    data['person'] = person;
    data['shirtnumber'] = shirtnumber;
    // data['position_x'] = positionX;
    // data['position_y'] = positionY;
    return data;
  }
}

class Tabs {
  String? tabsDefault;
  List<TabList>? list;

  Tabs({this.tabsDefault, this.list});

  Tabs.fromJson(Map<String, dynamic> json) {
    tabsDefault = json['tabs_default'];
    if (json['list'] != null) {
      list = <TabList>[];
      json['list'].forEach((v) {
        list!.add(TabList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tabs_default'] = tabsDefault;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TabList {
  String? title;
  String? type;
  String? tab;
  String? selectedIcon;
  String? unselectedIcon;
  List<SubTabs>? subTabs;

  TabList(
      {this.title,
      this.type,
      this.tab,
      this.selectedIcon,
      this.unselectedIcon,
      this.subTabs});

  TabList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    tab = json['tab'];
    selectedIcon = json['selected_icon'];
    unselectedIcon = json['unselected_icon'];
    if (json['subTabs'] != null) {
      subTabs = <SubTabs>[];
      json['subTabs'].forEach((v) {
        subTabs!.add(SubTabs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['tab'] = tab;
    data['selected_icon'] = selectedIcon;
    data['unselected_icon'] = unselectedIcon;
    if (subTabs != null) {
      data['subTabs'] = subTabs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubTabs {
  String? title;
  String? type;
  String? tab;
  String? url;
  String? template;

  SubTabs({this.title, this.type, this.tab, this.url, this.template});

  SubTabs.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    tab = json['tab'];
    url = json['url'];
    template = json['template'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['tab'] = tab;
    data['url'] = url;
    data['template'] = template;
    return data;
  }
}

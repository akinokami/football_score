class MatchModel {
  List<Matches>? list;
  String? prevDate;
  String? nextDate;
  bool? finishFlag;
  String? prev;
  String? next;

  MatchModel(
      {this.list,
      this.prevDate,
      this.nextDate,
      this.finishFlag,
      this.prev,
      this.next});

  MatchModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <Matches>[];
      json['list'].forEach((v) {
        list!.add(Matches.fromJson(v));
      });
    }
    prevDate = json['prevDate'];
    nextDate = json['nextDate'];
    finishFlag = json['finishFlag'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    data['prevDate'] = prevDate;
    data['nextDate'] = nextDate;
    data['finishFlag'] = finishFlag;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Matches {
  String? relateType;
  String? relateId;
  String? matchId;
  String? competitionId;
  String? competitionName;
  String? competitionLogo;
  String? competitionBkLogo;
  String? competitionColor;
  String? gameweek;
  String? roundName;
  String? status;
  String? minute;
  String? playingTime;
  bool? suretime;
  String? dateUtc;
  String? timeUtc;
  String? startPlay;
  String? endPlay;
  String? sortTimestamp;
  String? teamAId;
  String? teamAName;
  String? teamALogo;
  String? teamALogoMd5;
  String? teamBId;
  String? teamBName;
  String? teamBLogo;
  String? teamBLogoMd5;
  String? rankA;
  String? rankB;
  String? cornerA;
  String? cornerB;
  String? ycA;
  String? ycB;
  String? rcA;
  String? rcB;
  String? htsA;
  String? htsB;
  String? fsA;
  String? fsB;
  String? etsA;
  String? etsB;
  String? psA;
  String? psB;
  String? agsA;
  String? agsB;
  bool? animation;
  bool? highlight;
  String? tVList;
  String? tvSource;
  bool? videoFlag;
  bool? webLivingFlag;
  MatchAnalysis? matchAnalysis;
  MatchAnalysis? matchSK;
  MatchAnalysis? matchOdds;
  String? lotteryUrl;
  String? socUrl;
  int? keyMatch;
  String? period;
  String? cmpType;
  String? minutePeriod;
  String? minuteExtra;
  String? timestamp;
  String? liveText;
  List<Events>? events;
  String? forecast;
  String? forecastType;
  String? zcTag;
  String? home;
  String? draw;
  String? away;
  String? over;
  String? hdp;
  String? under;
  String? round;
  String? playingShowTime;
  String? teamAScheme;
  String? teamBScheme;
  // Null? redirectTop;
  // Null? redirectRight;
  RedirectMiddle? redirectMiddle;

  Matches(
      {this.relateType,
      this.relateId,
      this.matchId,
      this.competitionId,
      this.competitionName,
      this.competitionLogo,
      this.competitionBkLogo,
      this.competitionColor,
      this.gameweek,
      this.roundName,
      this.status,
      this.minute,
      this.playingTime,
      this.suretime,
      this.dateUtc,
      this.timeUtc,
      this.startPlay,
      this.endPlay,
      this.sortTimestamp,
      this.teamAId,
      this.teamAName,
      this.teamALogo,
      this.teamALogoMd5,
      this.teamBId,
      this.teamBName,
      this.teamBLogo,
      this.teamBLogoMd5,
      this.rankA,
      this.rankB,
      this.cornerA,
      this.cornerB,
      this.ycA,
      this.ycB,
      this.rcA,
      this.rcB,
      this.htsA,
      this.htsB,
      this.fsA,
      this.fsB,
      this.etsA,
      this.etsB,
      this.psA,
      this.psB,
      this.agsA,
      this.agsB,
      this.animation,
      this.highlight,
      this.tVList,
      this.tvSource,
      this.videoFlag,
      this.webLivingFlag,
      this.matchAnalysis,
      this.matchSK,
      this.matchOdds,
      this.lotteryUrl,
      this.socUrl,
      this.keyMatch,
      this.period,
      this.cmpType,
      this.minutePeriod,
      this.minuteExtra,
      this.timestamp,
      this.liveText,
      this.events,
      this.forecast,
      this.forecastType,
      this.zcTag,
      this.home,
      this.draw,
      this.away,
      this.over,
      this.hdp,
      this.under,
      this.round,
      this.playingShowTime,
      this.teamAScheme,
      this.teamBScheme,
      // this.redirectTop,
      // this.redirectRight,
      this.redirectMiddle});

  Matches.fromJson(Map<String, dynamic> json) {
    relateType = json['relate_type'];
    relateId = json['relate_id'];
    matchId = json['match_id'];
    competitionId = json['competition_id'];
    competitionName = json['competition_name'];
    competitionLogo = json['competition_logo'];
    competitionBkLogo = json['competition_bk_logo'];
    competitionColor = json['competition_color'];
    gameweek = json['gameweek'];
    roundName = json['round_name'];
    status = json['status'];
    minute = json['minute'];
    playingTime = json['playing_time'];
    suretime = json['suretime'];
    dateUtc = json['date_utc'];
    timeUtc = json['time_utc'];
    startPlay = json['start_play'];
    endPlay = json['end_play'];
    sortTimestamp = json['sort_timestamp'];
    teamAId = json['team_A_id'];
    teamAName = json['team_A_name'];
    teamALogo = json['team_A_logo'];
    teamALogoMd5 = json['team_A_logo_md5'];
    teamBId = json['team_B_id'];
    teamBName = json['team_B_name'];
    teamBLogo = json['team_B_logo'];
    teamBLogoMd5 = json['team_B_logo_md5'];
    rankA = json['rank_A'];
    rankB = json['rank_B'];
    cornerA = json['corner_A'];
    cornerB = json['corner_B'];
    ycA = json['yc_A'];
    ycB = json['yc_B'];
    rcA = json['rc_A'];
    rcB = json['rc_B'];
    htsA = json['hts_A'];
    htsB = json['hts_B'];
    fsA = json['fs_A'];
    fsB = json['fs_B'];
    etsA = json['ets_A'];
    etsB = json['ets_B'];
    psA = json['ps_A'];
    psB = json['ps_B'];
    agsA = json['ags_A'];
    agsB = json['ags_B'];
    animation = json['animation'];
    highlight = json['highlight'];
    tVList = json['TVList'];
    tvSource = json['tv_source'];
    videoFlag = json['videoFlag'];
    webLivingFlag = json['webLivingFlag'];
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
    keyMatch = json['key_match'];
    period = json['period'];
    cmpType = json['cmp_type'];
    minutePeriod = json['minute_period'];
    minuteExtra = json['minute_extra'];
    timestamp = json['timestamp'];
    liveText = json['live_text'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    forecast = json['forecast'];
    forecastType = json['forecast_type'];
    zcTag = json['zc_tag'];
    home = json['home'];
    draw = json['draw'];
    away = json['away'];
    over = json['over'];
    hdp = json['hdp'];
    under = json['under'];
    round = json['round'];
    playingShowTime = json['playing_show_time'];
    teamAScheme = json['team_A_scheme'];
    teamBScheme = json['team_B_scheme'];
    // redirectTop = json['redirect_top'];
    // redirectRight = json['redirect_right'];
    redirectMiddle = json['redirect_middle'] != null
        ? RedirectMiddle.fromJson(json['redirect_middle'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['relate_type'] = relateType;
    data['relate_id'] = relateId;
    data['match_id'] = matchId;
    data['competition_id'] = competitionId;
    data['competition_name'] = competitionName;
    data['competition_logo'] = competitionLogo;
    data['competition_bk_logo'] = competitionBkLogo;
    data['competition_color'] = competitionColor;
    data['gameweek'] = gameweek;
    data['round_name'] = roundName;
    data['status'] = status;
    data['minute'] = minute;
    data['playing_time'] = playingTime;
    data['suretime'] = suretime;
    data['date_utc'] = dateUtc;
    data['time_utc'] = timeUtc;
    data['start_play'] = startPlay;
    data['end_play'] = endPlay;
    data['sort_timestamp'] = sortTimestamp;
    data['team_A_id'] = teamAId;
    data['team_A_name'] = teamAName;
    data['team_A_logo'] = teamALogo;
    data['team_A_logo_md5'] = teamALogoMd5;
    data['team_B_id'] = teamBId;
    data['team_B_name'] = teamBName;
    data['team_B_logo'] = teamBLogo;
    data['team_B_logo_md5'] = teamBLogoMd5;
    data['rank_A'] = rankA;
    data['rank_B'] = rankB;
    data['corner_A'] = cornerA;
    data['corner_B'] = cornerB;
    data['yc_A'] = ycA;
    data['yc_B'] = ycB;
    data['rc_A'] = rcA;
    data['rc_B'] = rcB;
    data['hts_A'] = htsA;
    data['hts_B'] = htsB;
    data['fs_A'] = fsA;
    data['fs_B'] = fsB;
    data['ets_A'] = etsA;
    data['ets_B'] = etsB;
    data['ps_A'] = psA;
    data['ps_B'] = psB;
    data['ags_A'] = agsA;
    data['ags_B'] = agsB;
    data['animation'] = animation;
    data['highlight'] = highlight;
    data['TVList'] = tVList;
    data['tv_source'] = tvSource;
    data['videoFlag'] = videoFlag;
    data['webLivingFlag'] = webLivingFlag;
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
    data['key_match'] = keyMatch;
    data['period'] = period;
    data['cmp_type'] = cmpType;
    data['minute_period'] = minutePeriod;
    data['minute_extra'] = minuteExtra;
    data['timestamp'] = timestamp;
    data['live_text'] = liveText;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    data['forecast'] = forecast;
    data['forecast_type'] = forecastType;
    data['zc_tag'] = zcTag;
    data['home'] = home;
    data['draw'] = draw;
    data['away'] = away;
    data['over'] = over;
    data['hdp'] = hdp;
    data['under'] = under;
    data['round'] = round;
    data['playing_show_time'] = playingShowTime;
    data['team_A_scheme'] = teamAScheme;
    data['team_B_scheme'] = teamBScheme;
    // data['redirect_top'] = redirectTop;
    // data['redirect_right'] = redirectRight;
    if (redirectMiddle != null) {
      data['redirect_middle'] = redirectMiddle!.toJson();
    }
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

class Events {
  String? id;
  String? teamId;
  String? personId;
  String? personName;
  String? personLogo;
  String? code;
  String? name;
  String? logo;
  String? minute;
  String? minuteExtra;

  Events(
      {this.id,
      this.teamId,
      this.personId,
      this.personName,
      this.personLogo,
      this.code,
      this.name,
      this.logo,
      this.minute,
      this.minuteExtra});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    personId = json['person_id'];
    personName = json['person_name'];
    personLogo = json['person_logo'];
    code = json['code'];
    name = json['name'];
    logo = json['logo'];
    minute = json['minute'];
    minuteExtra = json['minute_extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_id'] = teamId;
    data['person_id'] = personId;
    data['person_name'] = personName;
    data['person_logo'] = personLogo;
    data['code'] = code;
    data['name'] = name;
    data['logo'] = logo;
    data['minute'] = minute;
    data['minute_extra'] = minuteExtra;
    return data;
  }
}

class RedirectMiddle {
  String? scheme;
  TextModel? text;

  RedirectMiddle({this.scheme, this.text});

  RedirectMiddle.fromJson(Map<String, dynamic> json) {
    scheme = json['scheme'];
    text = json['text'] != null ? TextModel.fromJson(json['text']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scheme'] = scheme;
    if (text != null) {
      data['text'] = text!.toJson();
    }
    return data;
  }
}

class TextModel {
  String? title;
  String? size;
  //Null? icon;
  String? normalColor;
  String? pressColor;

  TextModel(
      {this.title,
      this.size,
      //this.icon,
      this.normalColor,
      this.pressColor});

  TextModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    size = json['size'];
    // icon = json['icon'];
    normalColor = json['normal_color'];
    pressColor = json['press_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['size'] = size;
    //  data['icon'] = icon;
    data['normal_color'] = normalColor;
    data['press_color'] = pressColor;
    return data;
  }
}

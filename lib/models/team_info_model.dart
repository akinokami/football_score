class TeamInfoModel {
  BaseInfo? baseInfo;
  List<TrophyInfo>? trophyInfo;
  // Null? historyInfo;
  List<TeamRecord>? teamRecord;

  TeamInfoModel(
      {this.baseInfo,
      this.trophyInfo, //this.historyInfo,
      this.teamRecord});

  TeamInfoModel.fromJson(Map<String, dynamic> json) {
    baseInfo =
        json['base_info'] != null ? BaseInfo.fromJson(json['base_info']) : null;
    if (json['trophy_info'] != null) {
      trophyInfo = <TrophyInfo>[];
      json['trophy_info'].forEach((v) {
        trophyInfo!.add(TrophyInfo.fromJson(v));
      });
    }
    // historyInfo = json['history_info'];
    if (json['team_record'] != null) {
      teamRecord = <TeamRecord>[];
      json['team_record'].forEach((v) {
        teamRecord!.add(TeamRecord.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (baseInfo != null) {
      data['base_info'] = baseInfo!.toJson();
    }
    if (trophyInfo != null) {
      data['trophy_info'] = trophyInfo!.map((v) => v.toJson()).toList();
    }
    // data['history_info'] = this.historyInfo;
    if (teamRecord != null) {
      data['team_record'] = teamRecord!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BaseInfo {
  String? teamId;
  String? teamName;
  String? teamEnName;
  String? teamImg;
  String? teamLogoMd5;
  String? countryImg;
  String? country;
  String? address;
  String? telephone;
  String? email;
  String? city;
  String? founded;
  String? venueName;
  String? venueCapacity;
  String? color;
  String? rank;
  String? description;
  String? leagueId;
  String? marketValue;
  String? scheme;

  BaseInfo(
      {this.teamId,
      this.teamName,
      this.teamEnName,
      this.teamImg,
      this.teamLogoMd5,
      this.countryImg,
      this.country,
      this.address,
      this.telephone,
      this.email,
      this.city,
      this.founded,
      this.venueName,
      this.venueCapacity,
      this.color,
      this.rank,
      this.description,
      this.leagueId,
      this.marketValue,
      this.scheme});

  BaseInfo.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    teamName = json['team_name'];
    teamEnName = json['team_en_name'];
    teamImg = json['team_img'];
    teamLogoMd5 = json['team_logo_md5'];
    countryImg = json['country_img'];
    country = json['country'];
    address = json['address'];
    telephone = json['telephone'];
    email = json['email'];
    city = json['city'];
    founded = json['founded'];
    venueName = json['venue_name'];
    venueCapacity = json['venue_capacity'];
    color = json['color'];
    rank = json['rank'];
    description = json['description'];
    leagueId = json['league_id'];
    marketValue = json['market_value'];
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_id'] = teamId;
    data['team_name'] = teamName;
    data['team_en_name'] = teamEnName;
    data['team_img'] = teamImg;
    data['team_logo_md5'] = teamLogoMd5;
    data['country_img'] = countryImg;
    data['country'] = country;
    data['address'] = address;
    data['telephone'] = telephone;
    data['email'] = email;
    data['city'] = city;
    data['founded'] = founded;
    data['venue_name'] = venueName;
    data['venue_capacity'] = venueCapacity;
    data['color'] = color;
    data['rank'] = rank;
    data['description'] = description;
    data['league_id'] = leagueId;
    data['market_value'] = marketValue;
    data['scheme'] = scheme;
    return data;
  }
}

class TrophyInfo {
  int? competitionId;
  String? competitionName;
  String? trophyImg;
  int? times;
  List<Lists>? lists;

  TrophyInfo(
      {this.competitionId,
      this.competitionName,
      this.trophyImg,
      this.times,
      this.lists});

  TrophyInfo.fromJson(Map<String, dynamic> json) {
    competitionId = json['competition_id'];
    competitionName = json['competition_name'];
    trophyImg = json['trophy_img'];
    times = json['times'];
    if (json['lists'] != null) {
      lists = <Lists>[];
      json['lists'].forEach((v) {
        lists!.add(Lists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['competition_id'] = competitionId;
    data['competition_name'] = competitionName;
    data['trophy_img'] = trophyImg;
    data['times'] = times;
    if (lists != null) {
      data['lists'] = lists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  int? seasonId;
  String? seasonName;

  Lists({this.seasonId, this.seasonName});

  Lists.fromJson(Map<String, dynamic> json) {
    seasonId = json['season_id'];
    seasonName = json['season_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season_id'] = seasonId;
    data['season_name'] = seasonName;
    return data;
  }
}

class TeamRecord {
  String? type;
  String? title;
  List<String>? statistics;
  List<TrophyData>? trophyData;

  TeamRecord({this.type, this.title, this.statistics, this.trophyData});

  TeamRecord.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    statistics = json['statistics'].cast<String>();
    if (json['data'] != null) {
      trophyData = <TrophyData>[];
      json['data'].forEach((v) {
        trophyData!.add(TrophyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['statistics'] = statistics;
    if (trophyData != null) {
      data['data'] = trophyData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrophyData {
  String? personId;
  String? personName;
  String? age;
  String? personLogo;
  List<String>? statisticV1;
  String? scheme;
  String? weeklySalary;
  String? nationalityName;
  String? nationalityLogo;
  String? birthDate;
  int? rank;

  TrophyData(
      {this.personId,
      this.personName,
      this.age,
      this.personLogo,
      this.statisticV1,
      this.scheme,
      this.weeklySalary,
      this.nationalityName,
      this.nationalityLogo,
      this.birthDate,
      this.rank});

  TrophyData.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    personName = json['person_name'];
    age = json['age'];
    personLogo = json['person_logo'];
    statisticV1 = json['statistic_v1'].cast<String>();
    scheme = json['scheme'];
    weeklySalary = json['weekly_salary'];
    nationalityName = json['nationality_name'];
    nationalityLogo = json['nationality_logo'];
    birthDate = json['birth_date'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['person_id'] = personId;
    data['person_name'] = personName;
    data['age'] = age;
    data['person_logo'] = personLogo;
    data['statistic_v1'] = statisticV1;
    data['scheme'] = scheme;
    data['weekly_salary'] = weeklySalary;
    data['nationality_name'] = nationalityName;
    data['nationality_logo'] = nationalityLogo;
    data['birth_date'] = birthDate;
    data['rank'] = rank;
    return data;
  }
}

class TeamMemberModel {
  List<MemberModel>? memberList;

  TeamMemberModel({this.memberList});

  TeamMemberModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      memberList = <MemberModel>[];
      json['list'].forEach((v) {
        memberList!.add(MemberModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (memberList != null) {
      data['list'] = memberList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberModel {
  List<PlayerModel>? playerList;
  List<String>? statistics;
  String? title;
  String? type;

  MemberModel({this.playerList, this.statistics, this.title, this.type});

  MemberModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      playerList = <PlayerModel>[];
      json['data'].forEach((v) {
        playerList!.add(PlayerModel.fromJson(v));
      });
    }
    statistics = json['statistics'].cast<String>();
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (playerList != null) {
      data['data'] = playerList!.map((v) => v.toJson()).toList();
    }
    data['statistics'] = statistics;
    data['title'] = title;
    data['type'] = type;
    return data;
  }
}

class PlayerModel {
  String? age;
  String? nationalityLogo;
  String? nationalityName;
  String? personId;
  String? personLogo;
  String? personName;
  String? scheme;
  List<String>? statisticV1;
  String? type;
  String? weeklySalary;
  String? personEnName;
  String? shirtnumber;

  PlayerModel(
      {this.age,
      this.nationalityLogo,
      this.nationalityName,
      this.personId,
      this.personLogo,
      this.personName,
      this.scheme,
      this.statisticV1,
      this.type,
      this.weeklySalary,
      this.personEnName,
      this.shirtnumber});

  PlayerModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    nationalityLogo = json['nationality_logo'];
    nationalityName = json['nationality_name'];
    personId = json['person_id'];
    personLogo = json['person_logo'];
    personName = json['person_name'];
    scheme = json['scheme'];
    statisticV1 = json['statistic_v1'].cast<String>();
    type = json['type'];
    weeklySalary = json['weekly_salary'];
    personEnName = json['person_en_name'];
    shirtnumber = json['shirtnumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['nationality_logo'] = nationalityLogo;
    data['nationality_name'] = nationalityName;
    data['person_id'] = personId;
    data['person_logo'] = personLogo;
    data['person_name'] = personName;
    data['scheme'] = scheme;
    data['statistic_v1'] = statisticV1;
    data['type'] = type;
    data['weekly_salary'] = weeklySalary;
    data['person_en_name'] = personEnName;
    data['shirtnumber'] = shirtnumber;
    return data;
  }
}

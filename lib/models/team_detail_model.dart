class TeamDetailModel {
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
  List<Description>? description;
  Tabs? tabs;
  String? leagueId;
  String? marketValue;
  String? scheme;
  String? nickname;
  String? bgImg;
  String? sportType;
  String? type;

  TeamDetailModel(
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
      this.tabs,
      this.leagueId,
      this.marketValue,
      this.scheme,
      this.nickname,
      this.bgImg,
      this.sportType,
      this.type});

  TeamDetailModel.fromJson(Map<String, dynamic> json) {
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
    if (json['description'] != null) {
      description = <Description>[];
      json['description'].forEach((v) {
        description!.add(Description.fromJson(v));
      });
    }
    tabs = json['tabs'] != null ? Tabs.fromJson(json['tabs']) : null;
    leagueId = json['league_id'];
    marketValue = json['market_value'];
    scheme = json['scheme'];
    nickname = json['nickname'];
    bgImg = json['bg_img'];
    sportType = json['sport_type'];
    type = json['type'];
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
    if (description != null) {
      data['description'] = description!.map((v) => v.toJson()).toList();
    }
    if (tabs != null) {
      data['tabs'] = tabs!.toJson();
    }
    data['league_id'] = leagueId;
    data['market_value'] = marketValue;
    data['scheme'] = scheme;
    data['nickname'] = nickname;
    data['bg_img'] = bgImg;
    data['sport_type'] = sportType;
    data['type'] = type;
    return data;
  }
}

class Description {
  String? key;
  String? value;

  Description({this.key, this.value});

  Description.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class Tabs {
  int? tabsDefault;
  String? tabsSchemeDefault;
  List<TabList>? tabList;

  Tabs({this.tabsDefault, this.tabsSchemeDefault, this.tabList});

  Tabs.fromJson(Map<String, dynamic> json) {
    tabsDefault = json['tabs_default'];
    tabsSchemeDefault = json['tabs_scheme_default'];
    if (json['list'] != null) {
      tabList = <TabList>[];
      json['list'].forEach((v) {
        tabList!.add(TabList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tabs_default'] = tabsDefault;
    data['tabs_scheme_default'] = tabsSchemeDefault;
    if (tabList != null) {
      data['list'] = tabList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TabList {
  String? title;
  String? type;
  String? url;
  String? groupId;
  int? refresh;
  String? tab;

  TabList(
      {this.title, this.type, this.url, this.groupId, this.refresh, this.tab});

  TabList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    url = json['url'];
    groupId = json['group_id'];
    refresh = json['refresh'];
    tab = json['tab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['url'] = url;
    data['group_id'] = groupId;
    data['refresh'] = refresh;
    data['tab'] = tab;
    return data;
  }
}

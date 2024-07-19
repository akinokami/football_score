import 'dart:core';

class AppModel {
  Menus? menus;
  int? matchUrlNew;
  Config? config;
  Emoji? emoji;
  List<Template>? template;
  String? templateVersion;
  List<Modules>? modules;
  OnlineTest? onlineTest;
  String? updatedAt;
  String? shareMarketDesc;
  String? isShortInitImg;
  int? hometeamId;
  List<String>? skuList;
  List<String>? tabbar;

  AppModel(
      {this.menus,
      this.matchUrlNew,
      this.config,
      this.emoji,
      this.template,
      this.templateVersion,
      this.modules,
      this.onlineTest,
      this.updatedAt,
      this.shareMarketDesc,
      this.isShortInitImg,
      this.hometeamId,
      this.skuList,
      this.tabbar});

  AppModel.fromJson(Map<String, dynamic> json) {
    menus = json['menus'] != null ? Menus.fromJson(json['menus']) : null;
    matchUrlNew = json['match_url_new'];
    config = json['config'] != null ? Config.fromJson(json['config']) : null;
    emoji = json['emoji'] != null ? Emoji.fromJson(json['emoji']) : null;
    if (json['template'] != null) {
      template = <Template>[];
      json['template'].forEach((v) {
        template!.add(Template.fromJson(v));
      });
    }
    templateVersion = json['template_version'];
    if (json['modules'] != null) {
      modules = <Modules>[];
      json['modules'].forEach((v) {
        modules!.add(Modules.fromJson(v));
      });
    }
    onlineTest = json['online_test'] != null
        ? OnlineTest.fromJson(json['online_test'])
        : null;
    updatedAt = json['updated_at'];
    shareMarketDesc = json['share_market_desc'];
    isShortInitImg = json['is_short_init_img'];
    hometeamId = json['hometeam_id'];
    skuList = json['sku_list'].cast<String>();
    tabbar = json['tabbar'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (menus != null) {
      data['menus'] = menus!.toJson();
    }
    data['match_url_new'] = matchUrlNew;
    if (config != null) {
      data['config'] = config!.toJson();
    }
    if (emoji != null) {
      data['emoji'] = emoji!.toJson();
    }
    if (template != null) {
      data['template'] = template!.map((v) => v.toJson()).toList();
    }
    data['template_version'] = templateVersion;
    if (modules != null) {
      data['modules'] = modules!.map((v) => v.toJson()).toList();
    }
    if (onlineTest != null) {
      data['online_test'] = onlineTest!.toJson();
    }
    data['updated_at'] = updatedAt;
    data['share_market_desc'] = shareMarketDesc;
    data['is_short_init_img'] = isShortInitImg;
    data['hometeam_id'] = hometeamId;
    data['sku_list'] = skuList;
    data['tabbar'] = tabbar;
    return data;
  }
}

class Menus {
  List<News>? news;
  List<Tips>? tips;
  List<MatchTab>? matchTab;
  // List<Null>? rankingNew;

  Menus({
    this.news,
    this.tips,
    this.matchTab,
    //this.rankingNew,
  });

  Menus.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
    if (json['tips'] != null) {
      tips = <Tips>[];
      json['tips'].forEach((v) {
        tips!.add(Tips.fromJson(v));
      });
    }
    if (json['match_tab'] != null) {
      matchTab = <MatchTab>[];
      json['match_tab'].forEach((v) {
        matchTab!.add(MatchTab.fromJson(v));
      });
    }
    // if (json['ranking_new'] != null) {
    //   rankingNew = <Null>[];
    //   json['ranking_new'].forEach((v) {
    //     rankingNew!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    if (tips != null) {
      data['tips'] = tips!.map((v) => v.toJson()).toList();
    }
    if (matchTab != null) {
      data['match_tab'] = matchTab!.map((v) => v.toJson()).toList();
    }
    // if (this.rankingNew != null) {
    //   data['ranking_new'] = this.rankingNew!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class News {
  dynamic id;
  String? label;
  int? badge;
  bool? recommend;
  String? type;
  String? api;

  News({this.id, this.label, this.badge, this.recommend, this.type, this.api});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    badge = json['badge'];
    recommend = json['recommend'];
    type = json['type'];
    api = json['api'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['label'] = label;
    data['badge'] = badge;
    data['recommend'] = recommend;
    data['type'] = type;
    data['api'] = api;
    return data;
  }
}

class Tips {
  int? id;
  String? label;
  String? url;
  String? type;
  int? sort;
  String? newsTypeStr;
  String? template;

  Tips(
      {this.id,
      this.label,
      this.url,
      this.type,
      this.sort,
      this.newsTypeStr,
      this.template});

  Tips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    url = json['url'];
    type = json['type'];
    sort = json['sort'];
    newsTypeStr = json['newsTypeStr'];
    template = json['template'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['label'] = label;
    data['url'] = url;
    data['type'] = type;
    data['sort'] = sort;
    data['newsTypeStr'] = newsTypeStr;
    data['template'] = template;
    return data;
  }
}

class MatchTab {
  int? id;
  String? label;
  int? sort;
  String? api;
  String? type;

  MatchTab({this.id, this.label, this.sort, this.api, this.type});

  MatchTab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    sort = json['sort'];
    api = json['api'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['label'] = label;
    data['sort'] = sort;
    data['api'] = api;
    data['type'] = type;
    return data;
  }
}

class Config {
  int? gifMaxSize;
  int? maxUploadFiles;
  int? matchRefreshInterval;
  int? maxUploadFilesSize;
  int? upDeviceInfo;
  bool? webRendingAnalyze;
  String? telegramLink;
  String? whatsAppLink;
  bool? reviewing;
  Hot? hot;
  String? notifyRate;
  String? defaultScheme;
  int? guestImage;
  Comment? comment;
  List<String>? packageCheck;
  RoomTrace? roomTrace;
  FakeBrowser? fakeBrowser;
  Chatroom? chatroom;
  int? googlePlayReview;
  bool? matchLottery;
  bool? openCoach;
  bool? isShowShareGuide;
  bool? moneyOpen;
  bool? socIsOpen;
  bool? chatIsOpen;
  bool? groupchatIsOpen;
  String? slidingMenuHeadUrl;
  String? matchGamble;
  int? teamThemeIsOpen;
  WorldCup? worldCup;
  int? relateNewsInterval;
  int? isVideoAutoPlay;
  int? isGifPlayStyle;
  int? isForcedUpgrade;
  bool? commentChat;
  bool? searchIsOpen;
  String? searchParams;
  int? toolType;
  bool? toolVersion;
  bool? adFree;
  bool? hideFreeVip;
  String? lotteryUrl;
  UpgradeTips? upgradeTips;
  DefaultTab? defaultTab;
  int? adColdTimes;
  int? adHotInterval;

  Config(
      {this.gifMaxSize,
      this.maxUploadFiles,
      this.matchRefreshInterval,
      this.maxUploadFilesSize,
      this.upDeviceInfo,
      this.webRendingAnalyze,
      this.telegramLink,
      this.whatsAppLink,
      this.reviewing,
      this.hot,
      this.notifyRate,
      this.defaultScheme,
      this.guestImage,
      this.comment,
      this.packageCheck,
      this.roomTrace,
      this.fakeBrowser,
      this.chatroom,
      this.googlePlayReview,
      this.matchLottery,
      this.openCoach,
      this.isShowShareGuide,
      this.moneyOpen,
      this.socIsOpen,
      this.chatIsOpen,
      this.groupchatIsOpen,
      this.slidingMenuHeadUrl,
      this.matchGamble,
      this.teamThemeIsOpen,
      this.worldCup,
      this.relateNewsInterval,
      this.isVideoAutoPlay,
      this.isGifPlayStyle,
      this.isForcedUpgrade,
      this.commentChat,
      this.searchIsOpen,
      this.searchParams,
      this.toolType,
      this.toolVersion,
      this.adFree,
      this.hideFreeVip,
      this.lotteryUrl,
      this.upgradeTips,
      this.defaultTab,
      this.adColdTimes,
      this.adHotInterval});

  Config.fromJson(Map<String, dynamic> json) {
    gifMaxSize = json['gif_max_size'];
    maxUploadFiles = json['max_upload_files'];
    matchRefreshInterval = json['match_refresh_interval'];
    maxUploadFilesSize = json['max_upload_files_size'];
    upDeviceInfo = json['up_device_info'];
    webRendingAnalyze = json['web_rending_analyze'];
    telegramLink = json['telegram_link'];
    whatsAppLink = json['whats_app_link'];
    reviewing = json['reviewing'];
    hot = json['hot'] != null ? Hot.fromJson(json['hot']) : null;
    notifyRate = json['notify_rate'];
    defaultScheme = json['default_scheme'];
    guestImage = json['guest_image'];
    comment =
        json['comment'] != null ? Comment.fromJson(json['comment']) : null;
    packageCheck = json['package_check'].cast<String>();
    roomTrace = json['room_trace'] != null
        ? RoomTrace.fromJson(json['room_trace'])
        : null;
    fakeBrowser = json['fake_browser'] != null
        ? FakeBrowser.fromJson(json['fake_browser'])
        : null;
    chatroom =
        json['chatroom'] != null ? Chatroom.fromJson(json['chatroom']) : null;
    googlePlayReview = json['google_play_review'];
    matchLottery = json['match_lottery'];
    openCoach = json['open_coach'];
    isShowShareGuide = json['is_show_share_guide'];
    moneyOpen = json['money_open'];
    socIsOpen = json['soc_is_open'];
    chatIsOpen = json['chat_is_open'];
    groupchatIsOpen = json['groupchat_is_open'];
    slidingMenuHeadUrl = json['sliding_menu_head_url'];
    matchGamble = json['match_gamble'];
    teamThemeIsOpen = json['team_theme_is_open'];
    worldCup =
        json['world_cup'] != null ? WorldCup.fromJson(json['world_cup']) : null;
    relateNewsInterval = json['relate_news_interval'];
    isVideoAutoPlay = json['is_video_auto_play'];
    isGifPlayStyle = json['is_gif_play_style'];
    isForcedUpgrade = json['is_forced_upgrade'];
    commentChat = json['comment_chat'];
    searchIsOpen = json['search_is_open'];
    searchParams = json['search_params'];
    toolType = json['tool_type'];
    toolVersion = json['tool_version'];
    adFree = json['ad_free'];
    hideFreeVip = json['hide_free_vip'];
    lotteryUrl = json['lottery_url'];
    upgradeTips = json['upgrade_tips'] != null
        ? UpgradeTips.fromJson(json['upgrade_tips'])
        : null;
    defaultTab = json['default_tab'] != null
        ? DefaultTab.fromJson(json['default_tab'])
        : null;
    adColdTimes = json['ad_cold_times'];
    adHotInterval = json['ad_hot_interval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gif_max_size'] = gifMaxSize;
    data['max_upload_files'] = maxUploadFiles;
    data['match_refresh_interval'] = matchRefreshInterval;
    data['max_upload_files_size'] = maxUploadFilesSize;
    data['up_device_info'] = upDeviceInfo;
    data['web_rending_analyze'] = webRendingAnalyze;
    data['telegram_link'] = telegramLink;
    data['whats_app_link'] = whatsAppLink;
    data['reviewing'] = reviewing;
    if (hot != null) {
      data['hot'] = hot!.toJson();
    }
    data['notify_rate'] = notifyRate;
    data['default_scheme'] = defaultScheme;
    data['guest_image'] = guestImage;
    if (comment != null) {
      data['comment'] = comment!.toJson();
    }
    data['package_check'] = packageCheck;
    if (roomTrace != null) {
      data['room_trace'] = roomTrace!.toJson();
    }
    if (fakeBrowser != null) {
      data['fake_browser'] = fakeBrowser!.toJson();
    }
    if (chatroom != null) {
      data['chatroom'] = chatroom!.toJson();
    }
    data['google_play_review'] = googlePlayReview;
    data['match_lottery'] = matchLottery;
    data['open_coach'] = openCoach;
    data['is_show_share_guide'] = isShowShareGuide;
    data['money_open'] = moneyOpen;
    data['soc_is_open'] = socIsOpen;
    data['chat_is_open'] = chatIsOpen;
    data['groupchat_is_open'] = groupchatIsOpen;
    data['sliding_menu_head_url'] = slidingMenuHeadUrl;
    data['match_gamble'] = matchGamble;
    data['team_theme_is_open'] = teamThemeIsOpen;
    if (worldCup != null) {
      data['world_cup'] = worldCup!.toJson();
    }
    data['relate_news_interval'] = relateNewsInterval;
    data['is_video_auto_play'] = isVideoAutoPlay;
    data['is_gif_play_style'] = isGifPlayStyle;
    data['is_forced_upgrade'] = isForcedUpgrade;
    data['comment_chat'] = commentChat;
    data['search_is_open'] = searchIsOpen;
    data['search_params'] = searchParams;
    data['tool_type'] = toolType;
    data['tool_version'] = toolVersion;
    data['ad_free'] = adFree;
    data['hide_free_vip'] = hideFreeVip;
    data['lottery_url'] = lotteryUrl;
    if (upgradeTips != null) {
      data['upgrade_tips'] = upgradeTips!.toJson();
    }
    if (defaultTab != null) {
      data['default_tab'] = defaultTab!.toJson();
    }
    data['ad_cold_times'] = adColdTimes;
    data['ad_hot_interval'] = adHotInterval;
    return data;
  }
}

class Hot {
  int? count;
  String? showTimeStart;
  String? showTimeEnd;

  Hot({this.count, this.showTimeStart, this.showTimeEnd});

  Hot.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    showTimeStart = json['show_time_start'];
    showTimeEnd = json['show_time_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['show_time_start'] = showTimeStart;
    data['show_time_end'] = showTimeEnd;
    return data;
  }
}

class Comment {
  bool? imageSupport;

  Comment({this.imageSupport});

  Comment.fromJson(Map<String, dynamic> json) {
    imageSupport = json['image_support'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_support'] = imageSupport;
    return data;
  }
}

class RoomTrace {
  bool? switchOn;
  int? timeLimit;

  RoomTrace({this.switchOn, this.timeLimit});

  RoomTrace.fromJson(Map<String, dynamic> json) {
    switchOn = json['switch_on'];
    timeLimit = json['time_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['switch_on'] = switchOn;
    data['time_limit'] = timeLimit;
    return data;
  }
}

class FakeBrowser {
  bool? iOSNews;
  bool? androidNews;
  bool? iOSChatroom;
  bool? androidChatroom;

  FakeBrowser(
      {this.iOSNews, this.androidNews, this.iOSChatroom, this.androidChatroom});

  FakeBrowser.fromJson(Map<String, dynamic> json) {
    iOSNews = json['iOS_news'];
    androidNews = json['android_news'];
    iOSChatroom = json['iOS_chatroom'];
    androidChatroom = json['android_chatroom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iOS_news'] = iOSNews;
    data['android_news'] = androidNews;
    data['iOS_chatroom'] = iOSChatroom;
    data['android_chatroom'] = androidChatroom;
    return data;
  }
}

class Chatroom {
  String? iOSLinkType;
  String? androidLinkType;

  Chatroom({this.iOSLinkType, this.androidLinkType});

  Chatroom.fromJson(Map<String, dynamic> json) {
    iOSLinkType = json['iOS_link_type'];
    androidLinkType = json['android_link_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iOS_link_type'] = iOSLinkType;
    data['android_link_type'] = androidLinkType;
    return data;
  }
}

class WorldCup {
  bool? open;

  WorldCup({this.open});

  WorldCup.fromJson(Map<String, dynamic> json) {
    open = json['open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open'] = open;
    return data;
  }
}

class UpgradeTips {
  int? interval;
  int? count;

  UpgradeTips({this.interval, this.count});

  UpgradeTips.fromJson(Map<String, dynamic> json) {
    interval = json['interval'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['interval'] = interval;
    data['count'] = count;
    return data;
  }
}

class DefaultTab {
  int? defaultTab;
  int? isRemember;

  DefaultTab({this.defaultTab, this.isRemember});

  DefaultTab.fromJson(Map<String, dynamic> json) {
    defaultTab = json['default_tab'];
    isRemember = json['is_remember'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['default_tab'] = defaultTab;
    data['is_remember'] = isRemember;
    return data;
  }
}

class Emoji {
  int? version;
  List<Emojis>? emojis;
  //List<Null>? chat;

  Emoji({
    this.version,
    this.emojis,
    //this.chat,
  });

  Emoji.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    if (json['emojis'] != null) {
      emojis = <Emojis>[];
      json['emojis'].forEach((v) {
        emojis!.add(Emojis.fromJson(v));
      });
    }
    // if (json['chat'] != null) {
    //   chat = <Null>[];
    //   json['chat'].forEach((v) {
    //     chat!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    if (emojis != null) {
      data['emojis'] = emojis!.map((v) => v.toJson()).toList();
    }
    // if (this.chat != null) {
    //   data['chat'] = this.chat!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Emojis {
  String? id;
  String? name;
  String? ecount;
  String? icon;
  String? pkg;
  String? note;
  bool? status;
  String? deletedAt;
  int? version;
  String? sort;
  String? type;
  String? scenario;

  Emojis(
      {this.id,
      this.name,
      this.ecount,
      this.icon,
      this.pkg,
      this.note,
      this.status,
      this.deletedAt,
      this.version,
      this.sort,
      this.type,
      this.scenario});

  Emojis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ecount = json['ecount'];
    icon = json['icon'];
    pkg = json['pkg'];
    note = json['note'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    version = json['version'];
    sort = json['sort'];
    type = json['type'];
    scenario = json['scenario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['ecount'] = ecount;
    data['icon'] = icon;
    data['pkg'] = pkg;
    data['note'] = note;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['version'] = version;
    data['sort'] = sort;
    data['type'] = type;
    data['scenario'] = scenario;
    return data;
  }
}

class Template {
  String? name;
  String? url;

  Template({this.name, this.url});

  Template.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Modules {
  int? id;
  String? name;
  String? image;
  String? scheme;
  String? url;
  String? firstTip;
  String? type;

  Modules(
      {this.id,
      this.name,
      this.image,
      this.scheme,
      this.url,
      this.firstTip,
      this.type});

  Modules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    scheme = json['scheme'];
    url = json['url'];
    firstTip = json['firstTip'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['scheme'] = scheme;
    data['url'] = url;
    data['firstTip'] = firstTip;
    data['type'] = type;
    return data;
  }
}

class OnlineTest {
  String? def;
  String? usertag1;

  OnlineTest({this.def, this.usertag1});

  OnlineTest.fromJson(Map<String, dynamic> json) {
    def = json['default'];
    usertag1 = json['usertag1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['default'] = def;
    data['usertag1'] = usertag1;
    return data;
  }
}

class NewsModel {
  int? id;
  String? label;
  String? prev;
  String? next;
  int? max;
  int? min;
  int? page;
  List<Articles>? articles;

  NewsModel(
      {this.id,
      this.label,
      this.prev,
      this.next,
      this.max,
      this.min,
      this.page,
      this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    prev = json['prev'];
    next = json['next'];
    max = json['max'];
    min = json['min'];
    page = json['page'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['label'] = label;
    data['prev'] = prev;
    data['next'] = next;
    data['max'] = max;
    data['min'] = min;
    data['page'] = page;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  int? id;
  String? title;
  String? shareTitle;
  String? description;
  int? commentsTotal;
  String? share;
  String? thumb;
  Album? album;
  String? slideThumb;
  bool? top;
  String? topColor;
  String? url;
  String? url1;
  String? sourceUrl;
  String? scheme;
  String? ignore;
  bool? isVideo;
  // Null? collectionType;
  String? pid;
  String? style;
  String? template;
  String? bodyUrl;
  Body? body;
  String? addToTab;
  bool? hideBottomBar;
  int? isRedirect;
  String? redirectUrl;
  // List<Null>? archiveRegionMask;
  // List<Null>? slave;
  String? afhId;
  String? statisticsType;
  String? channel;
  bool? showComments;
  String? userId;
  String? publishedAt;
  int? sortTimestamp;
  String? createdAt;
  String? displayUrl;
  bool? quickview;
  String? prevdata;
  List<Labels>? labels;
  List<String>? extend;
  String? label;
  String? labelColor;

  Articles(
      {this.id,
      this.title,
      this.shareTitle,
      this.description,
      this.commentsTotal,
      this.share,
      this.thumb,
      this.album,
      this.slideThumb,
      this.top,
      this.topColor,
      this.url,
      this.url1,
      this.sourceUrl,
      this.scheme,
      this.ignore,
      this.isVideo,
      // this.collectionType,
      this.pid,
      this.style,
      this.template,
      this.bodyUrl,
      this.body,
      this.addToTab,
      this.hideBottomBar,
      this.isRedirect,
      this.redirectUrl,
      // this.archiveRegionMask,
      // this.slave,
      this.afhId,
      this.statisticsType,
      this.channel,
      this.showComments,
      this.userId,
      this.publishedAt,
      this.sortTimestamp,
      this.createdAt,
      this.displayUrl,
      this.quickview,
      this.prevdata,
      this.labels,
      this.extend,
      this.label,
      this.labelColor});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shareTitle = json['share_title'];
    description = json['description'];
    commentsTotal = json['comments_total'];
    share = json['share'];
    thumb = json['thumb'];
    album = json['album'] != null ? Album.fromJson(json['album']) : null;
    slideThumb = json['slide_thumb'];
    top = json['top'];
    topColor = json['top_color'];
    url = json['url'];
    url1 = json['url1'];
    sourceUrl = json['source_url'];
    scheme = json['scheme'];
    ignore = json['ignore'];
    isVideo = json['is_video'];
    // collectionType = json['collection_type'];
    pid = json['pid'];
    style = json['style'];
    template = json['template'];
    bodyUrl = json['body_url'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
    addToTab = json['add_to_tab'];
    hideBottomBar = json['hide_bottom_bar'];
    isRedirect = json['is_redirect'];
    redirectUrl = json['redirect_url'];
    // if (json['archive_region_mask'] != null) {
    //   archiveRegionMask = <Null>[];
    //   json['archive_region_mask'].forEach((v) {
    //     archiveRegionMask!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['slave'] != null) {
    //   slave = <Null>[];
    //   json['slave'].forEach((v) {
    //     slave!.add(Null.fromJson(v));
    //   });
    // }
    afhId = json['afh_id'];
    statisticsType = json['statistics_type'];
    channel = json['channel'];
    showComments = json['show_comments'];
    userId = json['user_id'];
    publishedAt = json['published_at'];
    sortTimestamp = json['sort_timestamp'];
    createdAt = json['created_at'];
    displayUrl = json['display_url'];
    quickview = json['quickview'];
    prevdata = json['prevdata'];
    if (json['labels'] != null) {
      labels = <Labels>[];
      json['labels'].forEach((v) {
        labels!.add(Labels.fromJson(v));
      });
    }
    extend = json['extend'] != null ? json['extend'].cast<String>() : [];
    label = json['label'];
    labelColor = json['label_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['share_title'] = shareTitle;
    data['description'] = description;
    data['comments_total'] = commentsTotal;
    data['share'] = share;
    data['thumb'] = thumb;
    if (album != null) {
      data['album'] = album!.toJson();
    }
    data['slide_thumb'] = slideThumb;
    data['top'] = top;
    data['top_color'] = topColor;
    data['url'] = url;
    data['url1'] = url1;
    data['source_url'] = sourceUrl;
    data['scheme'] = scheme;
    data['ignore'] = ignore;
    data['is_video'] = isVideo;
    // data['collection_type'] = collectionType;
    data['pid'] = pid;
    data['style'] = style;
    data['template'] = template;
    data['body_url'] = bodyUrl;
    if (body != null) {
      data['body'] = body!.toJson();
    }
    data['add_to_tab'] = addToTab;
    data['hide_bottom_bar'] = hideBottomBar;
    data['is_redirect'] = isRedirect;
    data['redirect_url'] = redirectUrl;
    // if (archiveRegionMask != null) {
    //   data['archive_region_mask'] =
    //       archiveRegionMask!.map((v) => v.toJson()).toList();
    // }
    // if (slave != null) {
    //   data['slave'] = slave!.map((v) => v.toJson()).toList();
    // }
    data['afh_id'] = afhId;
    data['statistics_type'] = statisticsType;
    data['channel'] = channel;
    data['show_comments'] = showComments;
    data['user_id'] = userId;
    data['published_at'] = publishedAt;
    data['sort_timestamp'] = sortTimestamp;
    data['created_at'] = createdAt;
    data['display_url'] = displayUrl;
    data['quickview'] = quickview;
    data['prevdata'] = prevdata;
    if (labels != null) {
      data['labels'] = labels!.map((v) => v.toJson()).toList();
    }
    data['extend'] = extend;
    data['label'] = label;
    data['label_color'] = labelColor;
    return data;
  }
}

class Album {
  int? total;
  List<String>? pics;

  Album({this.total, this.pics});

  Album.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pics = json['pics'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['pics'] = pics;
    return data;
  }
}

class Body {
  int? articleId;
  String? title;
  String? time;
  String? publishedTime;
  String? writer;
  String? body;
  int? insertComment;
  String? copyright;
  int? newVideoDetail;
  String? type;
  // Null? collectionType;
  String? pid;
  Infos? infos;
  Speech? speech;
  int? isShowShare;

  Body(
      {this.articleId,
      this.title,
      this.time,
      this.publishedTime,
      this.writer,
      this.body,
      this.insertComment,
      this.copyright,
      this.newVideoDetail,
      this.type,
      // this.collectionType,
      this.pid,
      this.infos,
      this.speech,
      this.isShowShare});

  Body.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    title = json['title'];
    time = json['time'];
    publishedTime = json['published_time'];
    writer = json['writer'];
    body = json['body'];
    insertComment = json['insert_comment'];
    copyright = json['copyright'];
    newVideoDetail = json['new_video_detail'];
    type = json['type'];
    //collectionType = json['collection_type'];
    pid = json['pid'];
    infos = json['infos'] != null ? Infos.fromJson(json['infos']) : null;
    speech = json['speech'] != null ? Speech.fromJson(json['speech']) : null;
    isShowShare = json['is_show_share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['article_id'] = articleId;
    data['title'] = title;
    data['time'] = time;
    data['published_time'] = publishedTime;
    data['writer'] = writer;
    data['body'] = body;
    data['insert_comment'] = insertComment;
    data['copyright'] = copyright;
    data['new_video_detail'] = newVideoDetail;
    data['type'] = type;
    // data['collection_type'] = collectionType;
    data['pid'] = pid;
    if (infos != null) {
      data['infos'] = infos!.toJson();
    }
    if (speech != null) {
      data['speech'] = speech!.toJson();
    }
    data['is_show_share'] = isShowShare;
    return data;
  }
}

class Infos {
  List<Channels>? channels;
  //List<Null>? column;

  Infos({
    this.channels,
    // this.column,
  });

  Infos.fromJson(Map<String, dynamic> json) {
    if (json['channels'] != null) {
      channels = <Channels>[];
      json['channels'].forEach((v) {
        channels!.add(Channels.fromJson(v));
      });
    }
    // if (json['column'] != null) {
    //   column = <Null>[];
    //   json['column'].forEach((v) {
    //     column!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (channels != null) {
      data['channels'] = channels!.map((v) => v.toJson()).toList();
    }
    // if (column != null) {
    //   data['column'] = column!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Channels {
  String? tag;
  String? href;
  String? sdId;

  Channels({this.tag, this.href, this.sdId});

  Channels.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    href = json['href'];
    sdId = json['sd_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tag'] = tag;
    data['href'] = href;
    data['sd_id'] = sdId;
    return data;
  }
}

class Speech {
  String? urlMp3;
  String? urlM3u8;
  String? size;
  String? duration;

  Speech({this.urlMp3, this.urlM3u8, this.size, this.duration});

  Speech.fromJson(Map<String, dynamic> json) {
    urlMp3 = json['url_mp3'];
    urlM3u8 = json['url_m3u8'];
    size = json['size'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url_mp3'] = urlMp3;
    data['url_m3u8'] = urlM3u8;
    data['size'] = size;
    data['duration'] = duration;
    return data;
  }
}

class Labels {
  String? label;
  String? color;

  Labels({this.label, this.color});

  Labels.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['color'] = color;
    return data;
  }
}

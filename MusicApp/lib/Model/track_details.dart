class TrackDetails {
  Track? track;

  TrackDetails({this.track});

  TrackDetails.fromJson(Map<String?, dynamic> json) {
    track = json['track'] != null ? Track.fromJson(json['track']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    if (track != null) {
      data['track'] = track!.toJson();
    }
    return data;
  }
}

class Track {
  String? name;
  String? mbid;
  String? url;
  String? duration;
  Streamable? streamable;
  String? listeners;
  String? playcount;
  Artist? artist;
  Album? album;
  Toptags? toptags;
  Wiki? wiki;

  Track({
    this.name,
    this.mbid,
    this.url,
    this.duration,
    this.streamable,
    this.listeners,
    this.playcount,
    this.artist,
    this.album,
    this.toptags,
    this.wiki,
  });

  Track.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    mbid = json['mbid'];
    url = json['url'];
    duration = json['duration'];
    streamable = json['streamable'] != null
        ? Streamable.fromJson(json['streamable'])
        : null;
    listeners = json['listeners'];
    playcount = json['playcount'];
    artist = json['artist'] != null ? Artist.fromJson(json['artist']) : null;
    album = json['album'] != null ? Album.fromJson(json['album']) : null;
    toptags =
        json['toptags'] != null ? Toptags.fromJson(json['toptags']) : null;
    wiki = json['wiki'] != null ? Wiki.fromJson(json['wiki']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['name'] = name;
    data['mbid'] = mbid;
    data['url'] = url;
    data['duration'] = duration;
    if (streamable != null) {
      data['streamable'] = streamable!.toJson();
    }
    data['listeners'] = listeners;
    data['playcount'] = playcount;
    if (artist != null) {
      data['artist'] = artist!.toJson();
    }
    if (album != null) {
      data['album'] = album!.toJson();
    }
    if (toptags != null) {
      data['toptags'] = toptags!.toJson();
    }
    if (wiki != null) {
      data['wiki'] = wiki!.toJson();
    }
    return data;
  }
}

class Streamable {
  String? text;
  String? fulltrack;

  Streamable({this.text, this.fulltrack});

  Streamable.fromJson(Map<String?, dynamic> json) {
    text = json['#text'];
    fulltrack = json['fulltrack'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['#text'] = text;
    data['fulltrack'] = fulltrack;
    return data;
  }
}

class Artist {
  String? name;
  String? mbid;
  String? url;

  Artist({this.name, this.mbid, this.url});

  Artist.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    mbid = json['mbid'];
    url = json['url'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['name'] = name;
    data['mbid'] = mbid;
    data['url'] = url;
    return data;
  }
}

class Album {
  String? artist;
  String? title;
  String? mbid;
  String? url;
  List<Image>? image;
  Attr? attr;

  Album({this.artist, this.title, this.mbid, this.url, this.image, this.attr});

  Album.fromJson(Map<String?, dynamic> json) {
    artist = json['artist'];
    title = json['title'];
    mbid = json['mbid'];
    url = json['url'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(Image.fromJson(v));
      });
    }
    attr = json['@attr'] != null ? Attr.fromJson(json['@attr']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['artist'] = artist;
    data['title'] = title;
    data['mbid'] = mbid;
    data['url'] = url;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    if (attr != null) {
      data['@attr'] = attr!.toJson();
    }
    return data;
  }
}

class Image {
  String? text;
  String? size;

  Image({this.text, this.size});

  Image.fromJson(Map<String?, dynamic> json) {
    text = json['#text'];
    size = json['size'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['#text'] = text;
    data['size'] = size;
    return data;
  }
}

class Attr {
  String? position;

  Attr({this.position});

  Attr.fromJson(Map<String?, dynamic> json) {
    position = json['position'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['position'] = position;
    return data;
  }
}

class Toptags {
  List<Tag>? tag;

  Toptags({this.tag});

  Toptags.fromJson(Map<String?, dynamic> json) {
    if (json['tag'] != null) {
      tag = <Tag>[];
      json['tag'].forEach((v) {
        tag!.add(Tag.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    if (tag != null) {
      data['tag'] = tag!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tag {
  String? name;
  String? url;

  Tag({this.name, this.url});

  Tag.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Wiki {
  String? published;
  String? summary;
  String? content;

  Wiki({this.published, this.summary, this.content});

  Wiki.fromJson(Map<String?, dynamic> json) {
    published = json['published'];
    summary = json['summary'];
    content = json['content'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['published'] = published;
    data['summary'] = summary;
    data['content'] = content;
    return data;
  }
}

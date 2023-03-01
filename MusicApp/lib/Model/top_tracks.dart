class TopTracks {
  Tracks? tracks;

  TopTracks({this.tracks});

  TopTracks.fromJson(Map<String?, dynamic> json) {
    tracks = json['tracks'] != null ? Tracks.fromJson(json['tracks']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    if (tracks != null) {
      data['tracks'] = tracks!.toJson();
    }
    return data;
  }
}

class Tracks {
  List<Track>? track;
  Attr? attr;

  Tracks({this.track, this.attr});

  Tracks.fromJson(Map<String?, dynamic> json) {
    if (json['track'] != null) {
      track = <Track>[];
      json['track'].forEach((v) {
        track!.add(Track.fromJson(v));
      });
    }
    attr = json['@attr'] != null ? Attr.fromJson(json['@attr']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    if (track != null) {
      data['track'] = track!.map((v) => v.toJson()).toList();
    }
    if (attr != null) {
      data['@attr'] = attr!.toJson();
    }
    return data;
  }
}

class Track {
  String? name;
  String? duration;
  String? playcount;
  String? listeners;
  String? mbid;
  String? url;
  Streamable? streamable;
  Artist? artist;
  List<Image>? image;

  Track({
    this.name,
    this.duration,
    this.playcount,
    this.listeners,
    this.mbid,
    this.url,
    this.streamable,
    this.artist,
    this.image,
  });

  Track.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    duration = json['duration'];
    playcount = json['playcount'];
    listeners = json['listeners'];
    mbid = json['mbid'];
    url = json['url'];
    streamable = json['streamable'] != null
        ? Streamable.fromJson(json['streamable'])
        : null;
    artist = json['artist'] != null ? Artist.fromJson(json['artist']) : null;
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(Image.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['name'] = name;
    data['duration'] = duration;
    data['playcount'] = playcount;
    data['listeners'] = listeners;
    data['mbid'] = mbid;
    data['url'] = url;
    if (streamable != null) {
      data['streamable'] = streamable!.toJson();
    }
    if (artist != null) {
      data['artist'] = artist!.toJson();
    }
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
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
  String? page;
  String? perPage;
  String? totalPages;
  String? total;

  Attr({this.page, this.perPage, this.totalPages, this.total});

  Attr.fromJson(Map<String?, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalPages = json['totalPages'];
    total = json['total'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['page'] = page;
    data['perPage'] = perPage;
    data['totalPages'] = totalPages;
    data['total'] = total;
    return data;
  }
}

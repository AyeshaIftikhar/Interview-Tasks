class SearchedTracks {
  Results? results;

  SearchedTracks({this.results});

  SearchedTracks.fromJson(Map<String?, dynamic> json) {
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  OpensearchQuery? opensearchQuery;
  String? opensearchTotalResults;
  String? opensearchStartIndex;
  String? opensearchItemsPerPage;
  Trackmatches? trackmatches;

  Results({
    this.opensearchQuery,
    this.opensearchTotalResults,
    this.opensearchStartIndex,
    this.opensearchItemsPerPage,
    this.trackmatches,
  });

  Results.fromJson(Map<String?, dynamic> json) {
    opensearchQuery = json['opensearch:Query'] != null
        ? OpensearchQuery.fromJson(json['opensearch:Query'])
        : null;
    opensearchTotalResults = json['opensearch:totalResults'];
    opensearchStartIndex = json['opensearch:startIndex'];
    opensearchItemsPerPage = json['opensearch:itemsPerPage'];
    trackmatches = json['trackmatches'] != null
        ? Trackmatches.fromJson(json['trackmatches'])
        : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    if (opensearchQuery != null) {
      data['opensearch:Query'] = opensearchQuery!.toJson();
    }
    data['opensearch:totalResults'] = opensearchTotalResults;
    data['opensearch:startIndex'] = opensearchStartIndex;
    data['opensearch:itemsPerPage'] = opensearchItemsPerPage;
    if (trackmatches != null) {
      data['trackmatches'] = trackmatches!.toJson();
    }

    return data;
  }
}

class OpensearchQuery {
  String? text;
  String? role;
  String? startPage;

  OpensearchQuery({this.text, this.role, this.startPage});

  OpensearchQuery.fromJson(Map<String?, dynamic> json) {
    text = json['#text'];
    role = json['role'];
    startPage = json['startPage'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['#text'] = text;
    data['role'] = role;
    data['startPage'] = startPage;
    return data;
  }
}

class Trackmatches {
  List<Track>? track;

  Trackmatches({this.track});

  Trackmatches.fromJson(Map<String?, dynamic> json) {
    if (json['track'] != null) {
      track = <Track>[];
      json['track'].forEach((v) {
        track!.add(Track.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    if (track != null) {
      data['track'] = track!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Track {
  String? name;
  String? artist;
  String? url;
  String? streamable;
  String? listeners;
  List<Image>? image;
  String? mbid;

  Track(
      {this.name,
      this.artist,
      this.url,
      this.streamable,
      this.listeners,
      this.image,
      this.mbid});

  Track.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    artist = json['artist'];
    url = json['url'];
    streamable = json['streamable'];
    listeners = json['listeners'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(Image.fromJson(v));
      });
    }
    mbid = json['mbid'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['name'] = name;
    data['artist'] = artist;
    data['url'] = url;
    data['streamable'] = streamable;
    data['listeners'] = listeners;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    data['mbid'] = mbid;
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

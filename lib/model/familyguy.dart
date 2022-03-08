class FamilyGuy {
  String? name;
  int? runtime;
  MyImage? image;
  String? summary;
  Embedded? eEmbedded;

  FamilyGuy({this.name, this.runtime, this.image, this.summary, this.eEmbedded});

  FamilyGuy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    runtime = json['runtime'];
    image = json['image'] != null ?  MyImage.fromJson(json['image']) : null;
    summary = json['summary'];
    eEmbedded = json['_embedded'] != null
        ?  Embedded.fromJson(json['_embedded'])
        : null;
  }
}

class Embedded {
  List<Episodes>? episodes;

  Embedded({this.episodes});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['episodes'] != null) {
      episodes =  <Episodes>[];
      json['episodes'].forEach((v) {
        episodes?.add( Episodes.fromJson(v));
      });
    }
  }
}

class MyImage {
  String? medium;
  String? original;

  MyImage({this.medium, this.original});

  MyImage.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }
}

class Episodes {
  int? id;
  String? url;
  String? name;
  int? season;
  int? number;
  String? airdate;
  String? airtime;
  String? airstamp;
  int? runtime;
  MyImage? image;
  String? summary;

  Episodes({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.image,
    this.summary,
  });

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    season = json['season'];
    number = json['number'];
    airdate = json['airdate'];
    airtime = json['airtime'];
    airstamp = json['airstamp'];
    runtime = json['runtime'];
    image = json['image'] != null ?  MyImage.fromJson(json['image']) : null;
    summary = json['summary'];
  }
}
class TitlesModel {
  int? page;
  String? next;
  int? entries;
  List<Results>? results;

  TitlesModel({this.page, this.next, this.entries, this.results});

  TitlesModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    next = json['next'];
    entries = json['entries'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

}

class Results {
  String? id;
  PrimaryImage? primaryImage;
  TitleType? titleType;
  TitleText? titleText;
  ReleaseYear? releaseYear;
  ReleaseDate? releaseDate;

  Results(
      {this.id,
        this.primaryImage,
        this.titleType,
        this.titleText,
        this.releaseYear,
        this.releaseDate});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryImage = json['primaryImage'] != null
        ? new PrimaryImage.fromJson(json['primaryImage'])
        : null;
    titleType = json['titleType'] != null
        ? new TitleType.fromJson(json['titleType'])
        : null;
    titleText = json['titleText'] != null
        ? new TitleText.fromJson(json['titleText'])
        : null;
    releaseYear = json['releaseYear'] != null
        ? new ReleaseYear.fromJson(json['releaseYear'])
        : null;
    releaseDate = json['releaseDate'] != null
        ? new ReleaseDate.fromJson(json['releaseDate'])
        : null;
  }

}

class PrimaryImage {
  String? id;
  int? width;
  int? height;
  String? url;
  Caption? caption;
  String? sTypename;

  PrimaryImage(
      {this.id,
        this.width,
        this.height,
        this.url,
        this.caption,
        this.sTypename});

  PrimaryImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    caption =
    json['caption'] != null ? new Caption.fromJson(json['caption']) : null;
    sTypename = json['__typename'];
  }

}

class Caption {
  String? plainText;
  String? sTypename;

  Caption({this.plainText, this.sTypename});

  Caption.fromJson(Map<String, dynamic> json) {
    plainText = json['plainText'];
    sTypename = json['__typename'];
  }

}

class TitleType {
  String? text;
  String? id;
  bool? isSeries;
  bool? isEpisode;
  String? sTypename;

  TitleType(
      {this.text, this.id, this.isSeries, this.isEpisode, this.sTypename});

  TitleType.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    id = json['id'];
    isSeries = json['isSeries'];
    isEpisode = json['isEpisode'];
    sTypename = json['__typename'];
  }

}

class TitleText {
  String? text;
  String? sTypename;

  TitleText({this.text, this.sTypename});

  TitleText.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    sTypename = json['__typename'];
  }

}

class ReleaseYear {
  int? year;
  Null? endYear;
  String? sTypename;

  ReleaseYear({this.year, this.endYear, this.sTypename});

  ReleaseYear.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    endYear = json['endYear'];
    sTypename = json['__typename'];
  }

}

class ReleaseDate {
  int? day;
  int? month;
  int? year;
  String? sTypename;

  ReleaseDate({this.day, this.month, this.year, this.sTypename});

  ReleaseDate.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
    sTypename = json['__typename'];
  }

}

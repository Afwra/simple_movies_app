class SingleTitleModel {
  Results? results;

  SingleTitleModel({this.results});

  SingleTitleModel.fromJson(Map<String, dynamic> json) {
    results =
    json['results'] != null ?  Results.fromJson(json['results']) : null;
  }

}

class Results {
  String? id;
  RatingsSummary? ratingsSummary;
  EpisodesCount? episodesCount;
  PrimaryImage? primaryImage;
  TitleType? titleType;
  GenresTypes? genresTypes;
  TitleText? titleText;
  ReleaseYear? releaseYear;
  ReleaseDate? releaseDate;
  Runtime? runtime;
  Null? series;
  MeterRanking? meterRanking;
  Plot? plot;

  Results(
      {this.id,
        this.ratingsSummary,
        this.episodesCount,
        this.primaryImage,
        this.titleType,
        this.genresTypes,
        this.titleText,
        this.releaseYear,
        this.releaseDate,
        this.runtime,
        this.series,
        this.meterRanking,
        this.plot});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ratingsSummary = json['ratingsSummary'] != null
        ?  RatingsSummary.fromJson(json['ratingsSummary'])
        : null;
    episodesCount = json['episodesCount'] != null
        ?  EpisodesCount.fromJson(json['episodesCount'])
        : null;
    primaryImage = json['primaryImage'] != null
        ?  PrimaryImage.fromJson(json['primaryImage'])
        : null;
    titleType = json['titleType'] != null
        ?  TitleType.fromJson(json['titleType'])
        : null;
    genresTypes = json['genres'] != null
        ?  GenresTypes.fromJson(json['genres'])
        : null;
    titleText = json['titleText'] != null
        ?  TitleText.fromJson(json['titleText'])
        : null;
    releaseYear = json['releaseYear'] != null
        ?  ReleaseYear.fromJson(json['releaseYear'])
        : null;
    releaseDate = json['releaseDate'] != null
        ?  ReleaseDate.fromJson(json['releaseDate'])
        : null;
    runtime =
    json['runtime'] != null ?  Runtime.fromJson(json['runtime']) : null;
    series = json['series'];
    meterRanking = json['meterRanking'] != null
        ?  MeterRanking.fromJson(json['meterRanking'])
        : null;
    plot = json['plot'] != null ?  Plot.fromJson(json['plot']) : null;
  }

}

class RatingsSummary {
  num? aggregateRating;
  num? voteCount;
  String? sTypename;

  RatingsSummary({this.aggregateRating, this.voteCount, this.sTypename});

  RatingsSummary.fromJson(Map<String, dynamic> json) {
    aggregateRating = json['aggregateRating'];
    voteCount = json['voteCount'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['aggregateRating'] = aggregateRating;
    data['voteCount'] = voteCount;
    data['__typename'] = sTypename;
    return data;
  }
}

class EpisodesCount {
  Episodes? episodes;
  List<Seasons>? seasons;
  List<Years>? years;
  Episodes? totalEpisodes;
  TopRated? topRated;
  String? sTypename;

  EpisodesCount(
      {this.episodes,
        this.seasons,
        this.years,
        this.totalEpisodes,
        this.topRated,
        this.sTypename});

  EpisodesCount.fromJson(Map<String, dynamic> json) {
    episodes = json['episodes'] != null
        ?  Episodes.fromJson(json['episodes'])
        : null;
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add( Seasons.fromJson(v));
      });
    }
    if (json['years'] != null) {
      years = <Years>[];
      json['years'].forEach((v) {
        years!.add( Years.fromJson(v));
      });
    }
    totalEpisodes = json['totalEpisodes'] != null
        ?  Episodes.fromJson(json['totalEpisodes'])
        : null;
    topRated = json['topRated'] != null
        ?  TopRated.fromJson(json['topRated'])
        : null;
    sTypename = json['__typename'];
  }

}

class Episodes {
  int? total;
  String? sTypename;

  Episodes({this.total, this.sTypename});

  Episodes.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    sTypename = json['__typename'];
  }

}

class Seasons {
  int? number;
  String? sTypename;

  Seasons({this.number, this.sTypename});

  Seasons.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    sTypename = json['__typename'];
  }

}

class Years {
  int? year;
  String? sTypename;

  Years({this.year, this.sTypename});

  Years.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    sTypename = json['__typename'];
  }

}

class TopRated {
  List<Edges>? edges;
  String? sTypename;

  TopRated({this.edges, this.sTypename});

  TopRated.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = <Edges>[];
      json['edges'].forEach((v) {
        edges!.add( Edges.fromJson(v));
      });
    }
    sTypename = json['__typename'];
  }

}

class Edges {
  Node? node;
  String? sTypename;

  Edges({this.node, this.sTypename});

  Edges.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ?  Node.fromJson(json['node']) : null;
    sTypename = json['__typename'];
  }

}

class Node {
  RatingsSummary? ratingsSummary;
  String? sTypename;

  Node({this.ratingsSummary, this.sTypename});

  Node.fromJson(Map<String, dynamic> json) {
    ratingsSummary = json['ratingsSummary'] != null
        ?  RatingsSummary.fromJson(json['ratingsSummary'])
        : null;
    sTypename = json['__typename'];
  }

}


class PrimaryImage {
  String? id;
  num? width;
  num? height;
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
    json['caption'] != null ? Caption.fromJson(json['caption']) : null;
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

class GenresTypes {
  List<Genres>? genres;
  String? sTypename;

  GenresTypes({this.genres, this.sTypename});

  GenresTypes.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add( Genres.fromJson(v));
      });
    }
    sTypename = json['__typename'];
  }

}

class Genres {
  String? text;
  String? id;
  String? sTypename;

  Genres({this.text, this.id, this.sTypename});

  Genres.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    id = json['id'];
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
  int? endYear;
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

class Runtime {
  num? seconds;
  String? sTypename;

  Runtime({this.seconds, this.sTypename});

  Runtime.fromJson(Map<String, dynamic> json) {
    seconds = json['seconds'];
    sTypename = json['__typename'];
  }

}

class MeterRanking {
  num? currentRank;
  RankChange? rankChange;
  String? sTypename;

  MeterRanking({this.currentRank, this.rankChange, this.sTypename});

  MeterRanking.fromJson(Map<String, dynamic> json) {
    currentRank = json['currentRank'];
    rankChange = json['rankChange'] != null
        ?  RankChange.fromJson(json['rankChange'])
        : null;
    sTypename = json['__typename'];
  }

}

class RankChange {
  String? changeDirection;
  num? difference;
  String? sTypename;

  RankChange({this.changeDirection, this.difference, this.sTypename});

  RankChange.fromJson(Map<String, dynamic> json) {
    changeDirection = json['changeDirection'];
    difference = json['difference'];
    sTypename = json['__typename'];
  }

}

class Plot {
  Caption? plotText;
  Language? language;
  String? sTypename;

  Plot({this.plotText, this.language, this.sTypename});

  Plot.fromJson(Map<String, dynamic> json) {
    plotText = json['plotText'] != null
        ?  Caption.fromJson(json['plotText'])
        : null;
    language = json['language'] != null
        ?  Language.fromJson(json['language'])
        : null;
    sTypename = json['__typename'];
  }

}

class Language {
  String? id;
  String? sTypename;

  Language({this.id, this.sTypename});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sTypename = json['__typename'];
  }

}

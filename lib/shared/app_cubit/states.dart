abstract class AppStates {}
class InitialAppState extends AppStates{}

class UpComingTitlesLoadedSuccess extends AppStates{}
class UpComingTitlesLoadedFail extends AppStates{}

class TrendingMoviesLoadedSuccess extends AppStates{}
class TrendingMoviesLoadedFail extends AppStates{}

class TrendingTvSeriesLoadedSuccess extends AppStates{}
class TrendingTvSeriesLoadedFail extends AppStates{}

class GamesLoadedSuccess extends AppStates{}
class GamesLoadedFail extends AppStates{}

class SearchLoadedSuccess extends AppStates{}
class SearchLoading extends AppStates{}
class SearchLoadedFail extends AppStates{}
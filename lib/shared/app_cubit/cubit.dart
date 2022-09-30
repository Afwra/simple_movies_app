import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_movies_app/models/title_model.dart';
import 'package:simple_movies_app/shared/app_cubit/states.dart';
import 'package:simple_movies_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(InitialAppState());

  static AppCubit get(context)=>BlocProvider.of(context);

  List<Results> upComingTitles = [];
  bool upComingLoaded = false;
  void getUpcomingTitles(){
    DioHelper.getData(
        path: '/titles/x/upcoming',
      queryParameters: {
          'startYear':DateTime.now().year,
          'endYear':DateTime.now().year+1,
          'sort':'year.incr',
      }
    ).then((value){
      if(value.statusCode == 200){
        value.data['results'].forEach((element){
          upComingTitles.add(Results.fromJson(element));
        });
        upComingLoaded = true;
        emit(UpComingTitlesLoadedSuccess());
      }
    }).catchError((error){
      debugPrint(error.toString());
      emit(UpComingTitlesLoadedFail());
    });
  }

  List<Results> trendingMovies = [];
  bool trendingMoviesLoaded = false;
  void getTrendingMovies(){
    DioHelper.getData(
      path: '/titles',
      queryParameters: {
        'titleType':'movie',
        'list':'top_boxoffice_last_weekend_10',
      }
    ).then((value){
      if(value.statusCode == 200){
        value.data['results'].forEach((element){
          trendingMovies.add(Results.fromJson(element));
        });
        trendingMoviesLoaded = true;
        emit(TrendingMoviesLoadedSuccess());
      }
    }).catchError((error){
      debugPrint(error.toString());
      emit(TrendingMoviesLoadedFail());
    });
  }

  List<Results> trendingTvSeries = [];
  bool trendingTvSeriesLoaded = false;
  void getTrendingTvSeries(){
    DioHelper.getData(
        path: '/titles',
        queryParameters: {
          'titleType':'tvSeries',
          'list':'most_pop_series',
          'year':DateTime.now().year,
        }
    ).then((value){
      if(value.statusCode == 200){
        value.data['results'].forEach((element){
          trendingTvSeries.add(Results.fromJson(element));
        });
        debugPrint(trendingTvSeries[1].titleText!.text.toString());
        trendingTvSeriesLoaded = true;
        emit(TrendingTvSeriesLoadedSuccess());
      }
    }).catchError((error){
      debugPrint(error.toString());
      emit(TrendingTvSeriesLoadedFail());
    });
  }

  List<Results> games = [];
  bool gamesLoaded = false;
  void getGames(){
    DioHelper.getData(
        path: '/titles',
        queryParameters: {
          'titleType':'videoGame',
          'year':DateTime.now().year,
        }
    ).then((value){
      if(value.statusCode == 200){
        value.data['results'].forEach((element){
          games.add(Results.fromJson(element));
        });
        debugPrint(games[1].titleText!.text.toString());
        gamesLoaded = true;
        debugPrint('bool= ${gamesLoaded.toString()}');
        emit(GamesLoadedSuccess());
      }
    }).catchError((error){
      debugPrint(error.toString());
      emit(GamesLoadedFail());
    });
  }

  bool fieldSubmitted = false;
  List<Results> searchResults = [];
  bool searchLoaded = false;
  void getSearch({required String text}){
    fieldSubmitted = true;
    searchLoaded = false;
    searchResults.clear();
    emit(SearchLoading());
    DioHelper.getData(
        path: '/titles/search/title/${text.trim()}',
        queryParameters: {
          'info':'mini_info',
          'sort':'year.decr',
          'titleType':'tvSeries',
          'titleType':'movie',
          'endYear':DateTime.now().year,
        }
    ).then((value){
      if(value.statusCode == 200){
        value.data['results'].forEach((element){
          searchResults.add(Results.fromJson(element));
        });
        debugPrint(searchResults[1].titleText!.text.toString());
        searchLoaded = true;
        debugPrint('bool= ${searchLoaded.toString()}');
        emit(SearchLoadedSuccess());
      }
    }).catchError((error){
      debugPrint(error.toString());
      emit(SearchLoadedFail());
    });
  }

}
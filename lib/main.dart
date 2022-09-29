import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_movies_app/modules/home_screen/home_screen.dart';
import 'package:simple_movies_app/shared/app_cubit/cubit.dart';
import 'package:simple_movies_app/shared/bloc_observer.dart';
import 'package:simple_movies_app/shared/network/remote/dio_helper.dart';

void main(){
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..getUpcomingTitles()..getTrendingMovies()..getTrendingTvSeries()..getGames(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData(
          fontFamily: 'Cairo'
        ),
      ),
    );
  }
}

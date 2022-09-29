import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_movies_app/modules/search_screen/search_screen.dart';
import 'package:simple_movies_app/shared/app_cubit/cubit.dart';
import 'package:simple_movies_app/shared/app_cubit/states.dart';
import 'package:simple_movies_app/shared/components/components.dart';
import 'package:simple_movies_app/shared/components/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Container(
      decoration:  BoxDecoration(
          gradient: backgroundColor
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Welcome',
                      style: titleStyle
                  ),
                  const SizedBox(height: 30,),
                  defaultSearchField(
                      textInputType: TextInputType.text,
                      readonly: true,
                      onTap: (){
                        navigateTo(context, SearchScreen());
                      }
                  ),
                  const SizedBox(height: 20,),
                  Text(
                      'Upcoming Titles',
                      style: subTitleStyle
                  ),
                  const SizedBox(height: 20,),
                  BlocBuilder<AppCubit,AppStates>(
                    builder: (context,state){
                      return SizedBox(
                        height: 150,
                        child: ConditionalBuilder(
                          condition: cubit.upComingLoaded,
                          builder:(context)=> ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index)=>defaultItemBuilder(result:cubit.upComingTitles[index]),
                              separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                              itemCount: cubit.upComingTitles.length
                          ),
                          fallback: (context)=>const Center(child: CircularProgressIndicator(),),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'Trending Movies',
                    style: subTitleStyle,
                  ),
                  const SizedBox(height: 20,),
                  BlocBuilder<AppCubit,AppStates>(
                    builder: (context,state)=>SizedBox(
                      height: 150,
                      child: ConditionalBuilder(
                        condition: cubit.trendingMoviesLoaded,
                        builder: (context)=>ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)=>defaultItemBuilder(result: cubit.trendingMovies[index]),
                            separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                            itemCount: cubit.trendingMovies.length
                        ),
                        fallback: (context)=>const Center(child: CircularProgressIndicator(),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'Popular Tv Shows',
                    style: subTitleStyle,
                  ),
                  const SizedBox(height: 20,),
                  BlocBuilder<AppCubit,AppStates>(
                    builder: (context,state)=>SizedBox(
                      height: 150,
                      child: ConditionalBuilder(
                        condition: cubit.trendingTvSeriesLoaded,
                        builder: (context)=>ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)=>defaultItemBuilder(result: cubit.trendingTvSeries[index]),
                            separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                            itemCount: cubit.trendingTvSeries.length
                        ),
                        fallback: (context)=> const Center(child: CircularProgressIndicator(),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'Games ${DateTime.now().year}',
                    style: subTitleStyle,
                  ),
                  const SizedBox(height: 20,),
                  BlocBuilder<AppCubit,AppStates>(
                    builder: (context,state)=>SizedBox(
                      height: 150,
                      child: ConditionalBuilder(
                        condition: cubit.gamesLoaded,
                        builder: (context)=>ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)=>defaultItemBuilder(result: cubit.games[index]),
                            separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                            itemCount: cubit.games.length
                        ),
                        fallback: (context)=> const Center(child: CircularProgressIndicator(),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

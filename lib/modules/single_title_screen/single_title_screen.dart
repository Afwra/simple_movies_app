import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_movies_app/shared/app_cubit/cubit.dart';
import 'package:simple_movies_app/shared/app_cubit/states.dart';
import 'package:simple_movies_app/shared/components/constants.dart';

class SingleTitleScreen extends StatelessWidget {
  const SingleTitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return Container(
          decoration: BoxDecoration(
              gradient: backgroundColor
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConditionalBuilder(
                condition: cubit.singleTitleLoaded,
                builder: (context)=>SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                cubit.result.primaryImage?.url??
                                'https://thumbs.dreamstime.com/z/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg',
                              ),
                              fit: BoxFit.fitWidth
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.blueGrey,
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                cubit.result.titleText!.text.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,

                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Text(
                        'Plot',
                        style: subTitleStyle,
                      ),
                      const SizedBox(height: 10,),
                      Text(
                          cubit.result.plot?.plotText?.plainText?? 'No Plot Available',
                          style: regularStyle
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Type',style: subTitleStyle,),
                              const SizedBox(height: 5,),
                              Text(cubit.result.titleType?.text??'Unknown',style: regularStyle,),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Genres',style: subTitleStyle,),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: 100,
                                height: 30,
                                child: ConditionalBuilder(
                                  condition: cubit.result.genresTypes != null,
                                  builder: (context)=> ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index)=>Text('${cubit.result.genresTypes!.genres![index].text} ,',style: regularStyle,),
                                    itemCount: cubit.result.genresTypes?.genres?.length??0,
                                  ),
                                  fallback: (context)=>Center(child: Text('Not Specified',style: regularStyle,)),

                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            padding:const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,color: Colors.yellow,),
                                const SizedBox(width: 10,),
                                Text(
                                  cubit.result.ratingsSummary!.aggregateRating == null?'0.00':
                                  cubit.result.ratingsSummary!.aggregateRating.toString(),
                                  style: regularStyle,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 100,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Center(
                              child: Text(
                                cubit.result.releaseDate?.year.toString()??'Unknown',
                                style: regularStyle,
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
                fallback: (context)=>const Center(child: CircularProgressIndicator(),),
              ),
            ),
          ),
        );
      },
    );
  }
}

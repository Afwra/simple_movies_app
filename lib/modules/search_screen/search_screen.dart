import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_movies_app/shared/app_cubit/cubit.dart';
import 'package:simple_movies_app/shared/app_cubit/states.dart';
import 'package:simple_movies_app/shared/components/components.dart';
import 'package:simple_movies_app/shared/components/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Container(
      decoration: BoxDecoration(
        gradient: backgroundColor
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              defaultSearchField(
                textInputType: TextInputType.text,
                onSubmit: (value){
                  cubit.getSearch(text: value);
                }

              ),
              const SizedBox(height: 30,),
              BlocBuilder<AppCubit,AppStates>(
                builder: (context,state)=>ConditionalBuilder(
                  condition: cubit.fieldSubmitted,
                  builder: (context)=>ConditionalBuilder(
                    condition: cubit.searchLoaded,
                    builder: (context)=>Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index)=>defaultItemBuilder(result: cubit.searchResults[index],context: context),
                          separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                          itemCount: cubit.searchResults.length
                      ),
                    ),
                    fallback: (context)=>const Expanded(child:  Center(child: CircularProgressIndicator(),)),
                  ),
                  fallback: (context)=> const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

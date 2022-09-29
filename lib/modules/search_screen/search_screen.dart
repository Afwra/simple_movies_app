import 'package:flutter/material.dart';
import 'package:simple_movies_app/shared/components/components.dart';
import 'package:simple_movies_app/shared/components/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onTap: (){

                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

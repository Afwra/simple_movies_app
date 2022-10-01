import 'package:flutter/material.dart';
import 'package:simple_movies_app/modules/single_title_screen/single_title_screen.dart';
import 'package:simple_movies_app/shared/app_cubit/cubit.dart';

import '../../models/title_model.dart';

Widget defaultItemBuilder({required Results result,required BuildContext context}) => InkWell(
  onTap: (){
    AppCubit.get(context).getSingleTitle(id: result.id.toString());
    navigateTo(context, const SingleTitleScreen());
  },
      child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image(
              image: NetworkImage(result.primaryImage?.url ??
                  'https://thumbs.dreamstime.com/z/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg'),
              height: 150,
              width: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.titleText!.text.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 25,
                        child: Center(
                          child: Text(
                            result.releaseYear?.year.toString() ?? 'unknown',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

Widget defaultSearchField(
        {int? maxLength,
        TextInputType? textInputType,
        void Function()? onTap,
        void Function(String)? onSubmit,
        bool enabled = true,
        bool readonly = false}) =>
    TextFormField(
      maxLength: maxLength,
      keyboardType: textInputType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Color(0xff696A72)),
        fillColor: const Color(0xff2A2B37),
        filled: true,
        enabled: enabled,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      readOnly: readonly,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
    );

void navigateTo(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

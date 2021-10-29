import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var list=AppCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon:Icon(
              EvaIcons.arrowBack,
              color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
            ),
          ),
          title: Container(
            height:30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppCubit.get(context).isDark ? Colors.grey[500] : Colors.grey[200],
            ),
            child: textFormFieldBuilder(
              isDark: AppCubit.get(context).isDark,
              controller: searchController, 
              type: TextInputType.text, 
              prefixIcon: EvaIcons.search,
              hintTxt:'Search',
              onChanged: (String value){
                AppCubit.get(context).getSearch(value: value);
              }
            ),
          ),
        ),
        body:Column(
          children:[
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Expanded(child: articleBuilder(list, context,isSearch: true)),
          ], 
        ), 
      );
      },
    );
  }
}
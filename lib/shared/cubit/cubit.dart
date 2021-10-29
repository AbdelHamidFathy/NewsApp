import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(): super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  List<Widget>screens=
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<String>titles=
  [
    'Business News',
    'Sports News',
    'Science News',
  ];

  int currentindex=0;

  List<BottomNavigationBarItem>BottomNavItems=
  [
    BottomNavigationBarItem(
      icon:Icon(
        LineIcons.businessTime,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        LineIcons.footballBall,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  void ChangeBottomNavBar(index){
    currentindex=index;
    emit(AppChangeBottomNavBarState());
  }

  List<dynamic> business=[];

  void getBusinessNews (){
    emit(AppGetBusinessNewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines', 
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'fd0c54449b4e431cb89340725873964f',
      },
    ).then((value) {
      business=value.data['articles'];
      emit(AppGetBusinessNewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetBusinessNewsErrorState(error.toString()));
    });
  }
  List<dynamic> sports=[];

  void getSportsNews (){
    emit(AppGetSportsNewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines', 
      query: {
        'country':'eg',
        'category':'sports',
        'apiKey':'fd0c54449b4e431cb89340725873964f',
      },
    ).then((value) {
      sports=value.data['articles'];
      emit(AppGetSportsNewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetSportsNewsErrorState(error.toString()));
    });
  }

  List<dynamic>science=[];

  void getScienceNews (){
    emit(AppGetScienceNewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines', 
      query: {
        'country':'eg',
        'category':'science',
        'apiKey':'fd0c54449b4e431cb89340725873964f',
      },
    ).then((value) {
      science=value.data['articles'];
      emit(AppGetScienceNewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetScienceNewsErrorState(error.toString()));
    });
  }

  List<dynamic>search=[];

  void getSearch({
    required String value,
  }){
    emit(AppGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything', 
      query: {
        'q':'${value}',
        'apiKey':'fd0c54449b4e431cb89340725873964f',
        },
    ).then((value){
      search=value.data['articles'];
      emit(AppGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetSearchErrorState(error));
    });
  }

  bool isDark =false;
  void changeAppMode({bool? fromShared}){
    if(fromShared!=null){
      isDark=fromShared; 
      emit(AppChangeModeState());}
    else 
    isDark=!isDark; 
    CacheHelper.putBoolean(value: isDark);
    emit(AppChangeModeState());
  }
}
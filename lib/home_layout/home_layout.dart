import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit=AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${cubit.titles[cubit.currentindex]}'
            ),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(screen:SearchScreen(),context:context);
                }, 
                icon: Icon(
                  EvaIcons.search,
                ),
              ),
              IconButton(
                onPressed: (){
                  cubit.changeAppMode();
                },
                icon: Icon(
                  cubit.isDark? EvaIcons.moon : EvaIcons.sun,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.ChangeBottomNavBar(index);
            },
            currentIndex:cubit.currentindex,
            items:cubit.BottomNavItems,
          ),
        );
      }, 
    );
  }
}
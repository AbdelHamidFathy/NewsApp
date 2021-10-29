import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'home_layout/home_layout.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? isDark=CacheHelper.getBoolean();
  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (contxet)=>AppCubit()..getBusinessNews()..getSportsNews()..getScienceNews()..changeAppMode(
        fromShared: isDark,
      ),
      child:BlocConsumer<AppCubit, AppStates>(
        listener:(context, state){},
        builder: (context, state)=>MaterialApp(
      debugShowCheckedModeBanner:false,
      home: HomeLayout(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.grey[700],
          ),
          titleTextStyle: GoogleFonts.laila(textStyle:
            TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          color: Colors.white,
          elevation: 0.0,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme:BottomNavigationBarThemeData(
          selectedItemColor: Colors.green,
          selectedLabelStyle: GoogleFonts.laila(),
          unselectedLabelStyle: GoogleFonts.laila(),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: GoogleFonts.laila(textStyle:
            TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          color: HexColor('0A0A0A'),
          elevation: 0.0,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: HexColor('0A0A0A'),
        bottomNavigationBarTheme:BottomNavigationBarThemeData(
          unselectedItemColor: Colors.white,
          backgroundColor: HexColor('0A0A0A'),
          selectedItemColor: Colors.green,
          selectedLabelStyle: GoogleFonts.laila(),
          unselectedLabelStyle: GoogleFonts.laila(),
        ),
      ),
      themeMode: AppCubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
    ),
      ),
    );
  }
}  
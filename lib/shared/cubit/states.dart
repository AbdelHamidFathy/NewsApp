abstract class AppStates {}

class AppInitialState extends AppStates{}

class AppChangeBottomNavBarState extends AppStates{}

class AppGetBusinessNewsSuccessState extends AppStates{}

class AppGetBusinessNewsErrorState extends AppStates{
  final String error;
  AppGetBusinessNewsErrorState(this.error);
}

class AppGetBusinessNewsLoadingState extends AppStates{}

class AppGetSportsNewsSuccessState extends AppStates{}

class AppGetSportsNewsErrorState extends AppStates{
  final String error;
  AppGetSportsNewsErrorState(this.error);
}

class AppGetSportsNewsLoadingState extends AppStates{}

class AppGetScienceNewsSuccessState extends AppStates{}

class AppGetScienceNewsErrorState extends AppStates{
  final String error;
  AppGetScienceNewsErrorState(this.error);
}

class AppGetScienceNewsLoadingState extends AppStates{}

class AppGetSearchSuccessState extends AppStates{}

class AppGetSearchErrorState extends AppStates{
  final String error;
  AppGetSearchErrorState(this.error);
}

class AppGetSearchLoadingState extends AppStates{}

class AppChangeModeState extends AppStates{}


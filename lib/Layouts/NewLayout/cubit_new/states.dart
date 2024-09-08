abstract class NewState {}

class NewInisialState extends NewState {}

class NewBottomNavState extends NewState {}

class NewGetBusnissSuccessState extends NewState {}

class NewGetBusnissErrorState extends NewState {
  final String error ;
  NewGetBusnissErrorState(this.error) ;
}

class NewGetBusnissLoadingState extends NewState {}


class NewGetSportsSuccessState extends NewState {}

class NewGetSportsErrorState extends NewState {
  final String error ;
  NewGetSportsErrorState(this.error) ;
}

class NewGetSportsLoadingState extends NewState {}


class NewGetScienceSuccessState extends NewState {}

class NewGetScienceErrorState extends NewState {
  final String error ;
  NewGetScienceErrorState(this.error) ;
}

class NewGetScienceLoadingState extends NewState {}

class changeModelBottom extends NewState {}

class ChangeofBottom extends NewState{}
class NewGetSearchSuccessState extends NewState {}

class NewGetSearchErrorState extends NewState {
  final String error ;
  NewGetSearchErrorState(this.error) ;
}

class NewGetSearchLoadingState extends NewState {}

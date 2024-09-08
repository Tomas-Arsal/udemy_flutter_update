import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter_update/Module/Business/Business_Screeen.dart';
import 'package:udemy_flutter_update/Layouts/NewLayout/cubit_new/states.dart';
import 'package:udemy_flutter_update/Network/local/cashHelper.dart';
import 'package:udemy_flutter_update/Network/remote/Dio_helper.dart';
import 'package:udemy_flutter_update/Module/science/Scienece_Screen.dart';
import 'package:udemy_flutter_update/Module/sports/Sports_Screen.dart';

class NewCubit extends Cubit<NewState> {
  NewCubit() : super(NewInisialState());

  static NewCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List screen = [
    Business_Screen(),
    Sports_Screen(),
    Science_Screen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business_sharp,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science_outlined,
      ),
      label: 'Science',
    ),
  ];

  void changeCurrentIndix(index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
   else if (index == 2) {
      getScience();
    }
    else getBusniss() ;
    emit(NewBottomNavState());
  }
  List<dynamic> busniss = [];

  void getBusniss() {
    emit(NewGetBusnissLoadingState());
    if (busniss.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        // 'v2/everything',

        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': '384be9a4f425483fb5957d74a9623dd0',

          /*
          'q': 'Apple',
          'from': '2022-10-04',
          'sortBy': 'popularity',
          'apiKey': '384be9a4f425483fb5957d74a9623dd0',
          */
        },
      ).then((value) {
        busniss = value.data['articles'];
        print(busniss[10]);
      }).catchError((error) {
        print(error.toString());
        emit(NewGetBusnissErrorState(error.toString()));
      });
    } else {
      emit(NewGetBusnissSuccessState());
    }
  }

  List<dynamic> sports = [];

  Future<void> getSports() async{
    emit(NewGetSportsLoadingState());
    if (sports.length == 0) {
     await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '384be9a4f425483fb5957d74a9623dd0',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
      }).catchError((error) {
        print(error.toString());
        emit(NewGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  Future<void> getScience() async {
    emit(NewGetScienceLoadingState());
    if (science.length == 0) {
      await  DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '384be9a4f425483fb5957d74a9623dd0',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
      }).catchError((error) {
        print(error.toString());
        emit(NewGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  Future<void> getSearch(String value) async{
    emit(NewGetSearchLoadingState());
   await DioHelper.getData(
      url: 'v2/everything',
      query: {
        // ignore: unnecessary_string_interpolations
        'q': '$value',
        'apiKey': '384be9a4f425483fb5957d74a9623dd0',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewGetSearchErrorState(error.toString()));
    });
  }

  bool isDark = false;
  void changeModelOfApp({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeofBottom());
    } else {
      isDark = !isDark;
      CashHelper.putBoolean(key: "isDark", value: isDark).then((value) {
        emit(ChangeofBottom());
      });
    }
  }
}

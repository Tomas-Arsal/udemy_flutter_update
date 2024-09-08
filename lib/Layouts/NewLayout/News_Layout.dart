import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter_update/Layouts/NewLayout/cubit_new/cubit_news_layout.dart';
import 'package:udemy_flutter_update/Module/search/searchScreen.dart';
import 'package:udemy_flutter_update/Shared/Component.dart';
import 'cubit_new/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubic = NewCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30.0,
                color: Colors.brown,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, searchScreen());
                },
                icon: const Icon(Icons.search_sharp),
              ),
              IconButton(
                onPressed: () {
                  NewCubit.get(context).changeModelOfApp();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubic.currentIndex,
            items: cubic.bottomItems,
            onTap: (index) {
              cubic.changeCurrentIndix(index);
            },
          ),
          body: cubic.screen[cubic.currentIndex],
        );
      },
    );
  }
}

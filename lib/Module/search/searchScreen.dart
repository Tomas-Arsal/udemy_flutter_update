import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter_update/Layouts/NewLayout/cubit_new/states.dart';

import '../../Layouts/NewLayout/cubit_new/cubit_news_layout.dart';
import '../../Shared/Component.dart';

class searchScreen extends StatelessWidget {
  var TextSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewCubit(),
      child: BlocConsumer<NewCubit, NewState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            var list = NewCubit.get(context).search;
            return Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: defaultTextFormField(
                      onchanged: (value) {
                        NewCubit.get(context).getSearch(value);
                      },
                      controller: TextSearch,
                      textInputType: TextInputType.emailAddress,
                      label: 'Search',
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your search Adress';
                        }
                      },
                      prefix: Icons.search,
                    ),
                  ),
                  Expanded(
                      child: articleBuilder(
                    list,
                    context,
                    isSearch: true,
                  )),
                ],
              ),
            );
          }),
    );
  }
}

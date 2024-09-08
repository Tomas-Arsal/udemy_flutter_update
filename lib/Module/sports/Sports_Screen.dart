import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Layouts/NewLayout/cubit_new/cubit_news_layout.dart';
import '../../Layouts/NewLayout/cubit_new/states.dart';
import '../../Shared/Component.dart';

class Sports_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context,  state) {
          var list = NewCubit
              .get(context)
              .sports;
          return articleBuilder(list , context);
        });
  }
}

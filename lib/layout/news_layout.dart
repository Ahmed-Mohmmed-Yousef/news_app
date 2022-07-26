import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/module/search/search_screen.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/app_cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/news/news_cubit.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..loadNews(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit newsCubit = NewsCubit.get(context);
          AppCubit appCubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              titleSpacing: 16.0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => navigateTo(context, SearchScreen()),
                ),
                IconButton(
                  icon: const Icon(Icons.brightness_4_outlined),
                  onPressed: () => appCubit.isLightMode = !appCubit.isLightMode,
                ),
              ],
            ),
            body: newsCubit.screens[newsCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: newsCubit.currentIndex,
              items: newsCubit.bottomItems,
              onTap: (value) => newsCubit.currentIndex = value,
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.newspaper),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}

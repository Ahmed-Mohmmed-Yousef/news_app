import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/search_cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {},
          builder: (context, state) {
            SearchCubit cubit = SearchCubit.get(context);
            switch (state.runtimeType) {
              case SearchInitial:
                return Column(
                  children: [
                    searchBar(cubit),
                  ],
                );
              case SearchLoadingState:
                return Column(
                  children: [
                    searchBar(cubit),
                    const Expanded(child: Center(child: CircularProgressIndicator())),
                  ],
                );
              case SearchLSuccessState:
                return Column(
                  children: [
                    searchBar(cubit),
                    Expanded(child: articleBuilder(list: cubit.results)),
                  ],
                );
              case SearchLErrorState:
                return Column(
                  children: [
                    searchBar(cubit),
                    const Expanded(
                      child: Center(
                        child: Icon(Icons.error_rounded),
                      ),
                    ),
                  ],
                );
              case SearchLEmptyState:
                return Column(
                  children: [
                    searchBar(cubit),
                    const Expanded(
                      child: Center(
                        child: Icon(Icons.hourglass_empty),
                      ),
                    ),
                  ],
                );
              default:
                return const Center(child: Text('Default'));
            }
          },
        ),
      ),
    );
  }

  Padding searchBar(SearchCubit cubit) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DefualtTextField(
        title: 'Search here',
        icon: Icons.search,
        controller: searchController,
        validator: (value) {
          if (value!.isEmpty) return 'search must not be empty';
          return null;
        },
        onChanged: (value) {
          if (value!.isNotEmpty) cubit.search(value);
        },
      ),
    );
  }
}

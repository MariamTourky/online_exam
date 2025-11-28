import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/home_cubit.dart';
import '../manager/home_state.dart';
import '../manager/home_tab.dart';
import '../views/explore_view.dart';
import '../views/profile_view.dart';
import '../views/result_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentTab.index,
            children: const [ExploreView(), ResultView(), ProfileView()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentTab.index,
            onTap: (i) {
              context.read<HomeCubit>().changeTabEvent(HomeTab.values[i]);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: "Explore",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "Results"),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/features/app_sections/presentation/manager/app_section_cubit.dart';
import 'package:online_exam/features/app_sections/presentation/manager/app_section_states.dart';
import 'package:online_exam/features/app_sections/presentation/pages/home_page_test.dart';
import 'package:online_exam/features/app_sections/presentation/pages/profile_page_test.dart';
import 'package:online_exam/features/results/presentation/pages/result_page.dart';
import 'package:online_exam/features/subjects/presentation/views/pages/subjects_page.dart';

class AppSectionsView extends StatelessWidget {
  const AppSectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppSectionCubit navCubit = context.watch<AppSectionCubit>();
    Widget bodyWidget;
    switch (navCubit.state.selectedIndex) {
      case 0:
        bodyWidget = const SubjectsPage();
        break;
      case 1:
        bodyWidget = ResultPage();
        break;
      case 2:
        bodyWidget = ProfilePageTest();
        break;
      case 3:
        bodyWidget = ProfilePageTest();
        break;
      default:
        bodyWidget = HomePageTest();
    }

    return Scaffold(
      body: SafeArea(child: bodyWidget),
      bottomNavigationBar: BlocBuilder<AppSectionCubit, AppSectionStates>(
        builder: (context, state) {
          return NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: AppTheme.primaryBlue),
                label: 'Explore',
                enabled: true,
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.my_library_books_outlined,
                  color: AppTheme.primaryBlue,
                ),
                label: 'Results',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline, color: AppTheme.primaryBlue),
                label: 'profile',
                enabled: true,
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.settings_outlined,
                  color: AppTheme.primaryBlue,
                ),
                label: 'Settings',
              ),
            ],
            indicatorColor: const Color(0xffCCD7EB),
            surfaceTintColor: AppTheme.white,
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            selectedIndex: state.selectedIndex,
            onDestinationSelected: (index) {
              context.read<AppSectionCubit>().updateIndex(index);
            },
          );
        },
      ),
    );
  }
}

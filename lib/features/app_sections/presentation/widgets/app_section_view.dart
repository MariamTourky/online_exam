import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/config/theme/app_theme.dart';

import 'package:online_exam/features/app_sections/presentation/manager/app_section_cubit.dart';
import 'package:online_exam/features/app_sections/presentation/manager/app_section_states.dart';
import 'package:online_exam/features/app_sections/presentation/pages/home_page_test.dart';
import 'package:online_exam/features/app_sections/presentation/pages/exam_page_test.dart';
import 'package:online_exam/features/app_sections/presentation/pages/profile_page_test.dart';

class AppSectionsView extends StatefulWidget {
  const AppSectionsView({super.key});

  @override
  State<AppSectionsView> createState() => _AppSectionsViewState();
}

class _AppSectionsViewState extends State<AppSectionsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSectionCubit, AppSectionStates>(
      builder: (context, state) {
        Widget bodyWidget;
        switch (state.selectedIndex) {
          case 0:
            bodyWidget = const HomePageTest();
            break;
          case 1:
            bodyWidget = const ExamPageTest();
            break;
          case 2:
            bodyWidget = const ProfilePageTest();
            break;
          default:
            bodyWidget = const HomePageTest();
        }

        return Scaffold(
          body: bodyWidget,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.selectedIndex,
            onTap: (index) {
              setState(() {
                state.selectedIndex = index;
              });
            },
            elevation: 0,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            iconSize: 24,
            selectedItemColor: AppTheme.gray,
            unselectedItemColor: AppTheme.gray,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppConstants.explore,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.fact_check_outlined),
                label: AppConstants.results,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outlined),
                label: AppConstants.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}

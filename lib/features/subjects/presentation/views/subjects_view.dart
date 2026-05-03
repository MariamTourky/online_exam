import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:online_exam/features/subjects/presentation/cubit/cubit/subject_cubit.dart';
import 'package:online_exam/features/subjects/presentation/views/screens/subject_screen.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubjectCubit>(),
      child: BlocBuilder<SubjectCubit, SubjectState>(
        builder: (context, state) {
          if(state is SubjectLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is SubjectError){
            return Center(
              child: Text(state.error),
            );
          }
          else if(state is SubjectLoaded){
            return subject_screen();
          }
          return const Scaffold(
         
      body: const Center(
        
        child: Text('Subjects'),
      ),
    );
        }
      )
    );
  }
}


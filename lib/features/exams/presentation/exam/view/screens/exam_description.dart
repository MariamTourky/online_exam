import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExamDescription extends StatelessWidget {
  final String subjectId;
  const ExamDescription({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(children: []),
    );
  }
}

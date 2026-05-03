

import 'package:flutter/material.dart';

class subject_screen extends StatelessWidget {
  const subject_screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        // itemCount: state.subjects.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              // child: Text(state.subjects[index].name),
            ),
          );
        },
      ),
    );
  }
}
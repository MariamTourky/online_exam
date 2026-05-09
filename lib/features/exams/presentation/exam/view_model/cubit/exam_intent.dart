sealed class ExamIntent {
  const ExamIntent();
}

final class GetAllExamsOnSubjectIntent extends ExamIntent {
  final String subjectId;

  const GetAllExamsOnSubjectIntent(this.subjectId);
}

class SelectExamIntent extends ExamIntent {
  final String examId;

  const SelectExamIntent(this.examId);
}

class LoadExamsDataIntent extends ExamIntent {}

class RefreshExamsIntent extends ExamIntent {}

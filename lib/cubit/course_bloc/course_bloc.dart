import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:off_app/cubit/course_bloc/course_event.dart';
import 'package:off_app/cubit/course_bloc/course_state.dart';
 
import '../../repository/remoto/course_respositoty.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRespositoty courseRespositoty;
  CourseBloc({required this.courseRespositoty}) : super(CourseInitialState()) {
    on<CourseEvent>((event, emit) async {
      if (event is CourseLoadEvent || event is PullToRefeshCourseLoadEvent) {
        try {
          final course = await courseRespositoty.getCursos();
          emit(CourseLoadedState(course: course));
        } catch (e) {
          emit(CourseFailToLoadedState(error: e.toString()));
        }
      }
    });
  }
}

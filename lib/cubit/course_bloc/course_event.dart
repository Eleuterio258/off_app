import 'package:equatable/equatable.dart';

import '../../entities/training_entity.dart';

 
abstract class CourseEvent extends Equatable {}

class CourseLoadEvent extends CourseEvent {
  @override
  List<TrainingEntity> get props => [];
}

class PullToRefeshCourseLoadEvent extends CourseEvent {
  @override
  List<TrainingEntity> get props => [];
}

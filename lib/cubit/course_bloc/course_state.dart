import 'package:equatable/equatable.dart';

import '../../entities/training_entity.dart';

 
 
abstract class CourseState extends Equatable {}

class CourseInitialState extends CourseState {
  @override
  List<Object?> get props => [];
}

class CourseLoadingState extends CourseState {
  @override
  List<Object?> get props => [];
}

class CourseLoadedState extends CourseState {
  final List<TrainingEntity> course;

  CourseLoadedState({required this.course});

  @override
  List<Object?> get props => [];
}

class CourseFailToLoadedState extends CourseState {
  final String error;

  CourseFailToLoadedState({required this.error});

  @override
  List<Object?> get props => [];
}

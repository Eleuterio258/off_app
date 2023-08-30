 
import '../../entities/concurso_entity.dart';

abstract class ConcursoState {}

class ConcursoInitialState extends ConcursoState {}

class ConcursoLoadingState extends ConcursoState {}

class ConcursoLoadedState extends ConcursoState {
  final List<ConcursoEntity> concurso;

  ConcursoLoadedState({required this.concurso});
}

class ConcursoFailToLoadedState extends ConcursoState {
  final String error;

  ConcursoFailToLoadedState({required this.error});
}


 
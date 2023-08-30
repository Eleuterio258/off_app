import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:off_app/cubit/concurso_bloc/concurso_event.dart';

 
import '../../repository/remoto/concurso_respositoty.dart';
import 'concurso_state.dart';

class ConcursoBloc extends Bloc<ConcursoEvent, ConcursoState> {
  final ConcursoRespositoty concursoRespositoty;

  ConcursoBloc({required this.concursoRespositoty})
      : super(ConcursoInitialState()) {
    on<ConcursoEvent>((event, emit) async {
      if (event is ConcursoLoadEvent ||
          event is PullToRefeshConcursosLoadEvent) {
        emit(ConcursoLoadingState());

        try {
          final concurso = await concursoRespositoty.getData();
          emit(ConcursoLoadedState(concurso: concurso));
        } catch (e) {
          emit(ConcursoFailToLoadedState(error: e.toString()));
        }
      }
    });
  }
}

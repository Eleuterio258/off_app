import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:off_app/cubit/service_bloc/service_event.dart';
import 'package:off_app/cubit/service_bloc/service_state.dart';
 
import '../../repository/remoto/service_respositoty.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceRespositoty serviceRespositoty;
  ServiceBloc({required this.serviceRespositoty})
      : super(ServiceInitialState()) {
    on<ServiceEvent>((event, emit) async {
      if (event is ServiceLoadEvent || event is PullToRefeshServiceLoadEvent) {
        try {
          final service = await serviceRespositoty.getServices();
          emit(ServiceLoadedState(service: service));
        } catch (e) {
          emit(ServiceFailToLoadedState(error: e.toString()));
        }
      }
    });
  }
}

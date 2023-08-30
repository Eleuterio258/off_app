import 'package:equatable/equatable.dart';
import 'package:off_app/entities/service_entity.dart';

 
abstract class ServiceState extends Equatable {}

class ServiceInitialState extends ServiceState {
  @override
  List<Object?> get props => [];
}

class ServiceLoadingState extends ServiceState {
  @override
  List<ServiceEntity> get props => [];
}

class ServiceLoadedState extends ServiceState {
  final List<ServiceEntity> service;

  ServiceLoadedState({required this.service});

  @override
  List<ServiceEntity?> get props => [];
}

class ServiceFailToLoadedState extends ServiceState {
  final String error;

  ServiceFailToLoadedState({required this.error});

  @override
  List<Object?> get props => [];
}

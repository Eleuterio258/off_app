import 'package:equatable/equatable.dart';

import '../../entities/service_entity.dart';
 
 
abstract class ServiceEvent extends Equatable {}

class ServiceLoadEvent extends ServiceEvent {
  @override
  List<ServiceEntity> get props => [];
}

class PullToRefeshServiceLoadEvent extends ServiceEvent {
  @override
  List<ServiceEntity> get props => [];
}

class ServiceByOwnerLoadEvent extends ServiceEvent {
  final String email;

  ServiceByOwnerLoadEvent(this.email);
  @override
  List<ServiceEntity> get props => [];
}

import 'package:equatable/equatable.dart';

import '../../entities/banner_entity.dart';
 
  
abstract class BannerState extends Equatable {}

class BannerInitial extends BannerState {
  @override
  List<Object?> get props => [];
}

class BannerLoading extends BannerState {
  @override
  List<Object?> get props => [];
}

class BannerLoaded extends BannerState {
  final List<BannerEntity> banners;
  BannerLoaded({required this.banners});
  @override
  List<Object?> get props => [];
}

class BannerError extends BannerState {
  final String message;
  BannerError(this.message);

  @override
  List<Object?> get props => [];
}

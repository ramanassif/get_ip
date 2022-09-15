import 'package:your_ip/models/ip_model.dart';

abstract class IPState {}

class IPInitial extends IPState {}

class IPLoading extends IPState {}

class IPSuccess extends IPState {
  IpModel ipModel;
  IPSuccess({required this.ipModel});
}

class IPFailure extends IPState {}

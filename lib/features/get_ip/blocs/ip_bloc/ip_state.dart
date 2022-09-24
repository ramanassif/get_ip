part of 'ip_bloc.dart';

abstract class IpState {
  const IpState();
}

class IPInitial extends IpState {}

class IPLoading extends IpState {}

class IPSuccess extends IpState {
  IpModel ipModel;
  IPSuccess({required this.ipModel});
}

class IPFailure extends IpState {}

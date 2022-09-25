part of 'ip_bloc.dart';

abstract class IpEvent {
  const IpEvent();
}

class GetIp extends IpEvent {
  final IPServices ipServices;
  GetIp({required this.ipServices});
}

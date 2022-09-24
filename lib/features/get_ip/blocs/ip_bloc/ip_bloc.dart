import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/features/get_ip/models/ip_model.dart';
import 'package:your_ip/features/get_ip/repositories/ip_services.dart';
part 'ip_event.dart';
part 'ip_state.dart';

class IpBloc extends Bloc<IpEvent, IpState> {
  IpBloc(this.ipServices) : super(IPInitial());
  IPServices ipServices;
  IpModel? ipModel;

  void getIp() async {
    emit(IPLoading());
    try {
      ipModel = await ipServices.getIp();
      emit(IPSuccess(ipModel: ipModel!));
    } on Exception catch (e) {
      print(e);
      emit(IPFailure());
    }
  }
}

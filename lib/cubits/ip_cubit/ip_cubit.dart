import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/cubits/ip_cubit/ip_state.dart';
import 'package:your_ip/models/ip_model.dart';
import 'package:your_ip/services/ip_services.dart';

class IPCubit extends Cubit<IPState> {
  IPCubit(this.ipServices) : super(IPInitial());
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

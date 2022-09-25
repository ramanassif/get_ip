import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/features/get_ip/models/ip_model.dart';
import 'package:your_ip/features/get_ip/repositories/ip_services.dart';
part 'ip_event.dart';
part 'ip_state.dart';

class IpBloc extends Bloc<IpEvent, IpState> {
  IpBloc() : super(IPInitial());
  IpModel? ipModel;

  @override
  Stream<IpState> mapEventToState(IpEvent event) async*{
    if(event is GetIp){
      yield IPLoading();
      try {
        ipModel = await event.ipServices.getIp();
        yield(IPSuccess(ipModel: ipModel!));
      } on Exception catch (e) {
        print(e);
        yield(IPFailure());
      }
    }
  }

}

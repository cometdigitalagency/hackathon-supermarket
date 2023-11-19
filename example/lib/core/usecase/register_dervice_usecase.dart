import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class Noparams extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterDeviceParams extends Equatable {
  final String terminalId;
  final String deviceId;
  final String merchant;

  const RegisterDeviceParams(this.terminalId, this.deviceId, this.merchant);

  @override
  List<Object?> get props => [terminalId, deviceId, merchant];
}

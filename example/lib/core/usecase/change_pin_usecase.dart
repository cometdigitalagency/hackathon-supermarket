import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class Noparams extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckPinParams extends Equatable {
  final String cardNo;
  final String oldPin;
  final String newPin;

  const CheckPinParams(this.cardNo, this.oldPin, this.newPin);

  @override
  List<Object?> get props => [cardNo, oldPin, newPin];
}

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
  final String pin;

  const CheckPinParams(this.cardNo, this.pin);

  @override
  List<Object?> get props => [cardNo, pin];
}

import 'package:equatable/equatable.dart';

abstract class Usecase<Type, Params> {
  Future<Type> call(Params params);
}

class Noparams extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginParams extends Equatable {
  final String username;
  final String password;
  final String deviceId;
  const LoginParams(
    this.username,
    this.password,
    this.deviceId,
  );

  @override
  List<Object?> get props => [username, password, deviceId];
}

class GetProfileParams extends Equatable {
  final String token;

  const GetProfileParams(this.token);
  @override
  List<Object?> get props => [];
}

class RefreshtokenParams extends Equatable {
  final String refreshToken;

  const RefreshtokenParams({required this.refreshToken});

  @override
  List<Object?> get props => [refreshToken];
}

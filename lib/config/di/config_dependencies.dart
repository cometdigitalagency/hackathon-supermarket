import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:save_mart/config/di/config_dependencies.config.dart';
import 'package:save_mart/config/di/observ.dart';

final getIt = GetIt.instance;

@injectableInit
Future<GetIt> configDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  return getIt.init();
}

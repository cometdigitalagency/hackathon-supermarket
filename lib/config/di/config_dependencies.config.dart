// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:save_mart/config/di/module.dart' as _i10;
import 'package:save_mart/core/service/product_service.dart' as _i5;
import 'package:save_mart/data/datasource/response_product_remote_data_source.dart'
    as _i6;
import 'package:save_mart/data/repository/response_product_repository_impl.dart'
    as _i8;
import 'package:save_mart/domain/repository/response_product_repositpory.dart'
    as _i7;
import 'package:save_mart/domain/usecase/response_product_usecase.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i4.FlutterSecureStorage>(
        () => injectableModule.secureStorage);
    gh.lazySingleton<_i5.ProductService>(
        () => _i5.ProductService(gh<_i3.Dio>()));
    gh.lazySingleton<_i6.ResponseProductRemoteDataSource>(() =>
        _i6.ResponseProductRemoteDataSourceImpl(gh<_i5.ProductService>()));
    gh.lazySingleton<_i7.ResponseProductRepository>(() =>
        _i8.ResponseProductRepositoryImpl(
            gh<_i6.ResponseProductRemoteDataSource>()));
    gh.lazySingleton<_i9.ResponseProductUseCase>(
        () => _i9.ResponseProductUseCase(gh<_i7.ResponseProductRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i10.InjectableModule {}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:waddy_dashboard/home/presentation/add_order/view_model/add_order_cubit.dart'
    as _i507;

import '../../home/data/home_data_source/data_source/add_order_data_source/add_order_data_source.dart'
    as _i291;
import '../../home/data/home_data_source/data_source_impl/add_order_data_source_impl/add_order_data_source_impl.dart'
    as _i294;
import '../../home/data/repository_impl/add_order_repo_impl.dart' as _i252;
import '../../home/domain/repository/add_order_repo.dart' as _i105;
import '../api/dio/dio_factory.dart' as _i763;
import '../api/dio/dio_module.dart' as _i223;
import '../const/provider/app_provider.dart' as _i787;
import 'fire_base_inj.dart' as _i265;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i763.DioFactory>(() => _i763.DioFactory());
    gh.singleton<_i787.AppProvider>(() => _i787.AppProvider());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.factory<_i291.OrderRemoteDataSource>(
      () => _i294.OrderRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i105.OrderRepository>(
      () => _i252.OrderRepositoryImpl(gh<_i291.OrderRemoteDataSource>()),
    );
    gh.factory<_i507.AddOrderCubit>(
      () => _i507.AddOrderCubit(gh<_i105.OrderRepository>()),
    );
    return this;
  }
}

class _$DioModule extends _i223.DioModule {}

class _$FirebaseModule extends _i265.FirebaseModule {}

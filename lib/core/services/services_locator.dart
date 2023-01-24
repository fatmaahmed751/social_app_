import 'package:get_it/get_it.dart';
import 'package:social_app/data/repository/social_repository.dart';
import 'package:social_app/data/social_data_source/social_remote_data_source.dart';
import 'package:social_app/data/social_models/userlogin.dart';
import 'package:social_app/domain/base_social_repository/base_social_repository.dart';
import 'package:social_app/domain/use_cases/social_createuser_usecase.dart';
import 'package:social_app/domain/use_cases/social_get_data.dart';
import 'package:social_app/domain/use_cases/social_login_usecase.dart';
import 'package:social_app/domain/use_cases/social_register_usecase.dart';
import 'package:social_app/presentation/controllers/social_bloc.dart';
import 'package:social_app/presentation/controllers/social_login_bloc.dart';
import 'package:social_app/presentation/controllers/social_register_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator{
  void init(){
    sl.registerFactory(() => SocialLoginBloc(sl()));
    sl.registerFactory(() => SocialRegisterBloc(sl()));
    sl.registerFactory(() => SocialBloc(sl()));
    sl.registerLazySingleton(()=>SocialCreateUserUseCase(sl()));
    sl.registerLazySingleton(()=>GetSocialLoginUseCase(sl()));
    sl.registerLazySingleton(()=>GetSocialRegisterUseCase(sl()));
    sl.registerLazySingleton(()=>GetSocialUserDataUseCase(sl()));
    sl.registerLazySingleton<BaseSocialRepository>(()=>SocialRepository(sl()));
    sl.registerLazySingleton<BaseSocialRemoteDataSource>(()=>SocialRemoteDataSource());

  }
}
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'src/common/constants.dart';
import 'src/common/app_config.dart';
import 'src/data/datasource/api_client.dart';
import 'src/data/datasource/mock_api_client.dart';
import 'src/data/repository/chat_repository_impl.dart';
import 'src/data/repository/mock_chat_repository_impl.dart';
import 'src/domain/repository/chat_repository.dart';
import 'src/presentation/chat/bloc/chat_bloc.dart';

final di = GetIt.instance;

void configureDependencies() {
  // Register Dio (only needed for real API)
  if (!AppConfig.useMockApi) {
    di.registerLazySingleton<Dio>(() {
      final dio = Dio();
      dio.options.connectTimeout = Duration(milliseconds: AppConstants.connectionTimeout);
      dio.options.receiveTimeout = Duration(milliseconds: AppConstants.receiveTimeout);
      return dio;
    });

    // Register real ApiClient
    di.registerLazySingleton<ApiClient>(() => ApiClient(di<Dio>()));

    // Register real Chat repository
    di.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(di<ApiClient>()),
    );
  } else {
    // Register mock ApiClient
    di.registerLazySingleton<MockApiClient>(() => MockApiClient());

    // Register mock Chat repository
    di.registerLazySingleton<ChatRepository>(
      () => MockChatRepositoryImpl(di<MockApiClient>()),
    );
  }
  
  // Register ChatBloc (same for both real and mock)
  di.registerFactory<ChatBloc>(
    () => ChatBloc(di<ChatRepository>()),
  );
} 
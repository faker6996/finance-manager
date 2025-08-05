/// Core shared functionality for all Flutter apps
library;

// Domain exports
export 'src/domain/entities/base_entity.dart';
export 'src/domain/repositories/base_repository.dart';
export 'src/domain/usecases/base_usecase.dart';

// Data exports
export 'src/data/models/base_model.dart';
export 'src/data/repositories/base_repository_impl.dart';
export 'src/data/datasources/local_datasource.dart';
export 'src/data/datasources/remote_datasource.dart';

// Network exports
export 'src/network/dio_client.dart';
export 'src/network/network_info.dart';
export 'src/network/api_result.dart';

// Storage exports
export 'src/storage/local_storage.dart';
export 'src/storage/secure_storage.dart';

// Utils exports
export 'src/utils/logger.dart';
export 'src/utils/validators.dart';
export 'src/utils/formatters.dart';
export 'src/utils/extensions/string_extensions.dart';
export 'src/utils/extensions/datetime_extensions.dart';

// Errors exports
export 'src/errors/exceptions.dart';
export 'src/errors/failures.dart';

// Constants exports
export 'src/constants/app_constants.dart';

// DI exports
export 'src/di/injection.dart';
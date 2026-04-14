import 'package:get_it/get_it.dart';
import 'package:scanly/core/repo/products_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ProductsRepository>(ProductsRepository());
  // getIt.registerSingleton<LoginRepo>(
  //   LoginRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
  // );
}

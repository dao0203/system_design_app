import 'package:auto_route/auto_route.dart';

import 'home_router.gr.dart';

@AutoRouterConfig()
class HomeRouter extends $HomeRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: DetailRoute.page),
      ];
}

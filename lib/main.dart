import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:system_design_app/feature/home/home_router.dart';
import 'package:system_design_app/theme/color_schemes.g.dart';

final initializeProvider = FutureProvider<void>((ref) {
  Supabase.instance.client.auth.signInWithPassword(
    password: dotenv.env['SUPABASE_PASSWORD']!,
    email: dotenv.env['SUPABASE_EMAIL']!,
  );
  //1秒くらい待つ
  return Future.delayed(const Duration(seconds: 1));
});

void main() async {
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  final _homeRouter = HomeRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(initializeProvider).when(
          data: (_) => MaterialApp.router(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: lightColorScheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: _homeRouter.config(),
          ),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DetailScreen extends HookConsumerWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          child: const Text('Go back to Home Screen'),
        ),
      ),
    );
  }
}

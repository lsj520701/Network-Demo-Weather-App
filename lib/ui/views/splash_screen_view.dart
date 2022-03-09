import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:networking_demo/ui/views/viewmodels/splash_screen_viewmodel.dart';

final spalshScreenViewModelInstance =
    ChangeNotifierProvider.autoDispose<SpalshScreenViewModel>(
        (ref) => SpalshScreenViewModel());

class SplashScreenView extends ConsumerStatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  ConsumerState<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends ConsumerState<SplashScreenView> {
  @override
  void initState() {
    ref.read(spalshScreenViewModelInstance).onPageReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Weather App"),
      ),
    );
  }
}

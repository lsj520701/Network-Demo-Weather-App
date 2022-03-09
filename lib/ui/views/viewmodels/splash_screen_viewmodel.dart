import 'package:networking_demo/route_paths.dart';
import 'package:networking_demo/services/navigation_service.dart';
import 'package:networking_demo/ui/views/viewmodels/base_model.dart';

class SpalshScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService.instance;
  onPageReady() async {
    Future.delayed(const Duration(seconds: 1), () {
      _navigationService.navigateToReplace(RoutePaths.weatherView);
    });
  }
}

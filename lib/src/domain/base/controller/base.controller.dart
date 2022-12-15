import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/domain/services/storage.service.dart';

class BaseController extends GetxController {
  final storageService = Get.find<StorageService>();

  final _viewState = ViewState.idle.obs;
  ViewState get viewState => _viewState.value;
  set viewState(ViewState state) {
    _viewState.value = state;
  }
}

import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/user/user.dto.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/domain/services/storage.service.dart';

class BaseController extends GetxController {
  @override
  // ignore: avoid_void_async
  void onInit() async {
    storageService = Get.find<StorageService>();
    currentUser = await storageService.fetchCustomer();
    super.onInit();
  }

  late StorageService storageService;

  final _currentUser = UserDto.empty().obs;
  UserDto get currentUser => _currentUser.value;
  set currentUser(UserDto? user) {
    _currentUser
      ..value = user ?? UserDto.empty()
      ..refresh();
  }

  final _viewState = ViewState.idle.obs;
  ViewState get viewState => _viewState.value;
  set viewState(ViewState state) {
    _viewState.value = state;
  }
}

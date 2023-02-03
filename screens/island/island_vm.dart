import 'dart:convert';

import '../../base/base_view_model.dart';

class IslandVM extends BaseViewModel {
  @override
  void onInit() {
    addPoints();
  }

  addPoints() async {
    showLoading();
    final body = {"user_id": prefs.user?.id};
    final res = await api.homeRepo.home(jsonEncode(body));
    hideLoading();
    if (res.data['success'] == true) {
      showError(res.data['message'] ?? "");
      notifyListeners();
    } else {
      hideLoading();
      //showError(res.data['message'] ?? "");
    }
  }
}

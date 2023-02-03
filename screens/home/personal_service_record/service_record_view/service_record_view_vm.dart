import 'dart:convert';
import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/models/service_record_view_model.dart';

class ServiceRecordViewVM extends BaseViewModel {
  @override
  void onInit() {
    getRecord();
  }
  String? serviceType;
  String? tempType;
  String? tempStringDate;
  DateTime? tempDate;
  String? tempPhoto;

  ServiceRecordViewModel? serviceView;

  getRecord() async {
    final body = {"user_id": prefs.user?.id ?? ""};
    showLoading();
    final res =
        await api.serviceRecordViewRepo.viewServiceRecord(jsonEncode(body));

    if (res.data['success'] == true) {
      hideLoading();
      print(res);

      final record = res.data["data"];

      serviceView = ServiceRecordViewModel.fromJson(record);

      print(serviceView?.sharedRecordCount);
      print(serviceView?.privateRecordCount);
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}

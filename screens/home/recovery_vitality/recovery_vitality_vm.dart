import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/models/recover_vitality_model.dart';

class RecoveryVitalityVM extends BaseViewModel {
  @override
  void onInit() async {
    await getData();
    await applyData();
  }

  List<RecoverVitalityModel> vitalityModel = [];
  RecoverVitalityModel? vitalityModels;

  getData() async {
    showLoading();
    final res = await api.recoverVitalityRepo.getRecoverVitality();
    hideLoading();
    if (res.runtimeType == Response) {
      print(res);
      final List vitality = res.data as List;
      vitalityModel =
          vitality.map((e) => RecoverVitalityModel.fromJson(e)).toList();
    } else {
      showError(res.data['message'] ?? "");
    }
  }

  applyData() async {
    showLoading();

    final body = {"user_id": prefs.user?.id ?? "", "recover_vitality_id": "1"};

    final res =
        await api.recoverVitalityRepo.postRecoverVitality(jsonEncode(body));
    hideLoading();
    if (res.data['success'] == true) {
      print(res);
      final vitality = res.data["data"];
      vitalityModels = RecoverVitalityModel.fromJson(vitality);
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}

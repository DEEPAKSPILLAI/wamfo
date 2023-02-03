import 'package:flutter/material.dart';
import 'package:wamfo/base/base_view_model.dart';

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../models/profile_model.dart';

TextEditingController personalProfileController = TextEditingController();

class PersonalInfoEditVM extends BaseViewModel {
  @override
  void onInit() async {
    getData();

    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();

  String? newValue;

  ProfileModel? variantModel;

  getData() async {
    final body = {
      "user_id": prefs.user?.id ?? "",
    };
    showLoading();
    final res = await api.profileRepo.getProfileView(jsonEncode(body));
    hideLoading();
    if (res.data['success'] == true) {
      final variant = res.data["data"];
      variantModel = ProfileModel.fromJson(variant);

      personalProfileController.text = variantModel?.personalProfile ?? "";
    } else {
      showError(res.data['message'] ?? "");
    }
  }

  updatePersonalProfile(context) async {
    showLoading();
    final body = {
      "user_id": prefs.user?.id ?? "",
      "personal_profile": personalProfileController.text,
    };
    final res = await api.profileEditRepo.getProfileEdit(jsonEncode(body));
    hideLoading();
    if (res.data['success'] == true) {
      final variant = res.data["data"];
      variantModel = ProfileModel.fromJson(variant);

      notifyListeners();
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}

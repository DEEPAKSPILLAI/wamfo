import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/models/redeem_model.dart';

class RedeemItemVM extends BaseViewModel {
  @override
  void onInit() {
    getList();
  }

  RedeemModel? redeemModel;

  getList() async {
    final body = {"user_id": prefs.user?.id ?? ""};
    showLoading();
    final res = await api.redeemRepo.redeemGetList(jsonEncode(body));

    if (res.data['success'] == true) {
      hideLoading();
      print(res);

      final redeem = res.data["data"];
      redeemModel = RedeemModel.fromJson(redeem);
    } else {
      showError(res.data['message'] ?? "");
    }
  }

  regularApply(context, int id) async {
    final body = {"user_id": prefs.user?.id ?? "", "redeem_item_id": id};
    showLoading();
    final res = await api.redeemRepo.redeemApplyRegular(jsonEncode(body));

    if (res.data['success'] == true) {
      hideLoading();

      print(res);
    } else {
      showError(res.data['message'] ?? "");
    }
  }

  specialApply(context, int id) async {
    final body = {"user_id": prefs.user?.id ?? "", "redeem_item_id": id};
    showLoading();
    final res = await api.redeemRepo.redeemApplySpecial(jsonEncode(body));

    if (res.data['success'] == true) {
      hideLoading();
      print(res);

      showDialog(
          context: context,
          builder: (BuildContext context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  height: 172,
                  width: 270,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xffFFC46D),
                            Color(0xffFFD067),
                            Color(0xffCD553F),
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        // height: 150,
                        // width: 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFFFEDE)),
                        child: const Center(
                          child: Text(
                            'Thank You!',
                            style: TextStyle(
                              color: Color(0xff8E4940),
                              fontSize: 24,
                            ),
                          ),
                        )),
                  ),
                ),
              ));
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}

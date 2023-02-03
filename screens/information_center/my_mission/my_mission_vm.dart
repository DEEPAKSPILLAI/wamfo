import 'dart:convert';

import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/models/mymission_list_model.dart';

class MyMissionVM extends BaseViewModel {
  @override
  void onInit() async {
    await myMissionList();

  }
 

  String? statusType;
  String? tempType;
  String? tempStringDate;
  DateTime? tempDate;

  List<MyMissionListModel> myMissionListModel = [];
  // HomeServiceOtherStudentModel? homeServiceOtherStudentModels;

  myMissionList() async {
    showLoading();

    final body = {"user_id": prefs.user?.id};

    final res = await api.myMissionListRepo.myMissionList(jsonEncode(body));

    // if (res.data['success'] == true){
    //   print(res);
    //   final homeserviceotherstudent = res.data["data"];
    //   homeServiceOtherStudentModels = HomeServiceOtherStudentModel.fromJson(homeserviceotherstudent);
    if (res.data['success'] == true) {
      hideLoading();
      print(res);

      final List mymissionlist = res.data["data"] as List;
      myMissionListModel =
          mymissionlist.map((e) => MyMissionListModel.fromJson(e)).toList();
      print(myMissionListModel.length);
   
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}



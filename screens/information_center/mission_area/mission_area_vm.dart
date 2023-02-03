import 'dart:convert';

import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/models/mission_area_list_model.dart';

class MissionAreaVM extends BaseViewModel {
  @override
  void onInit() async {
    await postMissionArea();
  }
//   List <MissionAreaListModel> missionAreaListModel=[];
//   // MissionAreaListModel? missionAreaListModel;

// postMissionArea() async{
//    final body =
//    {
//     "user_id": "1"
//      };
//     showLoading();
//     final res =
//         await api.missionAreaListRepo.postMissionArea(jsonEncode(body));

//     if (res.data['success'] == true) {
//       hideLoading();
//       print(res);

//       final List missionarea = res.data["data"] as List;

//        missionAreaListModel  = missionarea.map((e)=>  MissionAreaListModel.fromJson(e)).toList();
//       print(missionAreaListModel.length);

//     } else {
//       showError(res.data['message'] ?? "");
//     }
//   }

  String? tempType;
  String? tempStringDate;
  DateTime? tempDate;

  List<MissionAreaListModel> missionAreaListModel = [];
  // HomeServiceOtherStudentModel? homeServiceOtherStudentModels;

  postMissionArea() async {
    showLoading();

    final body = {"user_id": prefs.user?.id};

    final res = await api.missionAreaListRepo.postMissionArea(jsonEncode(body));

    // if (res.data['success'] == true){
    //   print(res);
    //   final homeserviceotherstudent = res.data["data"];
    //   homeServiceOtherStudentModels = HomeServiceOtherStudentModel.fromJson(homeserviceotherstudent);
    if (res.data['success'] == true) {
      hideLoading();
      print(res);

      final List missionarealist = res.data["data"] as List;
      missionAreaListModel =
          missionarealist.map((e) => MissionAreaListModel.fromJson(e)).toList();
      print(missionAreaListModel.length);
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}

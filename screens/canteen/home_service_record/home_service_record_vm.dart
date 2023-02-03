// import 'dart:convert';
// import 'package:wamfo/base/base_view_model.dart';
// import 'package:wamfo/models/home_service_other_student_model.dart';
// import 'package:wamfo/models/student_home_service_fail_model.dart';

// class HomeServiceRecordVM extends BaseViewModel {
//   @override
//   void onInit() async {
//     // await postData();
//     await postHomeServiceOtherStudent();
//   }

//   List<HomeServiceFailModel> homeServiceFailModel = [];
//   HomeServiceFailModel? homeServiceFailModels;

//   postData() async {
//     showLoading();

//     final body = {"user_id": prefs.user?.id ?? "", "service_record_id": "3"};

//     final res =
//         await api.homeServiceFailRepo.postHomeServiceFail(jsonEncode(body));
//     hideLoading();
//     if (res.data['success'] == true) {
//       print(res);
//       final homeservicefail = res.data["data"];
//       homeServiceFailModels = HomeServiceFailModel.fromJson(homeservicefail);
//     } else {
//       showError(res.data['message'] ?? "");
//     }
//   }

//   List<HomeServiceOtherStudentModel> homeServiceOtherStudentModel = [];
//   // HomeServiceOtherStudentModel? homeServiceOtherStudentModels;

//   postHomeServiceOtherStudent() async {
//     showLoading();

//     final body = {"user_id": prefs.user?.id ?? ""};

//     final res = await api.homeServiceOtherStudentRepo
//         .postHomeServiceOtherStudent(jsonEncode(body));

//     // if (res.data['success'] == true){
//     //   print(res);
//     //   final homeserviceotherstudent = res.data["data"];
//     //   homeServiceOtherStudentModels = HomeServiceOtherStudentModel.fromJson(homeserviceotherstudent);
//     if (res.data['success'] == true) {
//       hideLoading();
//       print(res);

//       final List homeserviceotherstudent = res.data["data"] as List;
//       homeServiceOtherStudentModel = homeserviceotherstudent
//           .map((e) => HomeServiceOtherStudentModel.fromJson(e))
//           .toList();
//       print(homeServiceOtherStudentModel.length);
//     } else {
//       showError(res.data['message'] ?? "");
//     }
//   }

//   postPassData() async {
//     final body = {"user_id": prefs.user?.id ?? "", "service_record_id": "3"};
//     showLoading();

//     final res =
//         await api.homeServicePassRepo.postHomeServicePass(jsonEncode(body));

//     if (res.data['success'] == true) {
//       hideLoading();
//       print(res);
//     } else {
//       showError(res.data['message'] ?? "");
//     }
//   }
// }
import 'dart:convert';
import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/models/home_service_other_student_model.dart';

class HomeServiceRecordVM extends BaseViewModel {
  @override
  void onInit() async {
    // await postData();
    postHomeServiceOtherStudent();
  }

  fail(int id) async {
    showLoading();

    final body = {"user_id": prefs.user?.id, "service_record_id": id};

    final res =
        await api.homeServiceFailRepo.postHomeServiceFail(jsonEncode(body));
    hideLoading();
    if (res.data['success'] == true) {
      print(res);
    } else {
      showError(res.data['message'] ?? "");
    }
  }

  List<HomeServiceOtherStudentModel> homeServiceOtherStudentModel = [];
  // HomeServiceOtherStudentModel? homeServiceOtherStudentModels;

  postHomeServiceOtherStudent() async {
    showLoading();

    final body = {"user_id": prefs.user?.id};

    final res = await api.homeServiceOtherStudentRepo
        .postHomeServiceOtherStudent(jsonEncode(body));

    // if (res.data['success'] == true){
    //   print(res);
    //   final homeserviceotherstudent = res.data["data"];
    //   homeServiceOtherStudentModels = HomeServiceOtherStudentModel.fromJson(homeserviceotherstudent);
    if (res.data['success'] == true) {
      hideLoading();
      print(res);

      final List homeserviceotherstudent = res.data["data"] as List;
      homeServiceOtherStudentModel = homeserviceotherstudent
          .map((e) => HomeServiceOtherStudentModel.fromJson(e))
          .toList();
      print(homeServiceOtherStudentModel.length);
    } else {
      showError(res.data['message'] ?? "");
    }
  }

  pass(int id) async {
    final body = {"user_id": prefs.user?.id, "service_record_id": id};
    showLoading();

    final res =
        await api.homeServicePassRepo.postHomeServicePass(jsonEncode(body));

    if (res.data['success'] == true) {
      hideLoading();
      print(res);
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}

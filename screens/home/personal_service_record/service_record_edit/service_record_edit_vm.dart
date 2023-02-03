import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wamfo/api/api_config.dart';
import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/models/service_record_create_model.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_edit/school_service/school_service.dart';

import 'community_service/community_service_input.dart';
import 'community_service/community_service_input_success.dart';
import 'home_service/home_service.dart';
import 'package:intl/intl.dart';

class ServiceRecordEditVM extends BaseViewModel {
  @override
  void onInit() async {
    //await createServiceRecord();
    serviceSelection();
    serviceBoolSelection();

    notifyListeners();
  }

  ServiceRecordCreateModel? serviceRecord;

  File? image1;
  List<String> serviceTypes = <String>[
    "Home Service",
    "School Service",
    "Community Service"
  ];
  List<String> homeCategories = <String>[
    'Wash the dishes',
    'Sweep the floor',
    'Do the laundry',
    'Prepare meals',
    'Take out the trash',
    'Others'
  ];
  List<String> schoolCategories = <String>[
    'Activity assistant',
    'Library volunteer',
    'School day reception',
    'Enviromental protector',
    'Teachers helper',
    'Others'
  ];
  List<String> hours = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  List<String> minutes = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59'
  ];

  List<String> timeFormat = <String>[
    'AM',
    'PM',
  ];

  final TextEditingController servingDateController = TextEditingController();
  final TextEditingController programNatureController = TextEditingController();
  final TextEditingController reflectionController = TextEditingController();
  final TextEditingController serviceOrganizationController =
      TextEditingController();
  final TextEditingController personInChargeNameController =
      TextEditingController();
  final TextEditingController personInChargeContactNoController =
      TextEditingController();
  String? selectedCategory;
  String? selectedType;
  String? serviceType;
  String? selectedFromHour = '10';
  String? selectedFromMinute = '00';
  String? selectedToHour = '10';
  String? selectedToMinute = '00';
  String? selectedFromTimeFormat = 'AM';
  String? selectedToTimeFormat = 'AM';

  late String tempFromDate = "${selectedFromHour}" +
      ":" +
      "${selectedFromMinute}" +
      "${selectedFromTimeFormat}";
  late DateTime servingFrom = DateFormat("hh:mma").parse(tempFromDate);
  late String formattedFromTime = DateFormat("HH:mm").format(servingFrom);

  late String tempToDate = "${selectedToHour}" +
      ":" +
      "${selectedToMinute}" +
      "${selectedToTimeFormat}";
  late DateTime servingTo = DateFormat("hh:mma").parse(tempToDate);
  late String formattedToTime = DateFormat("HH:mm").format(servingTo);
  bool? homeService = false;
  bool? schoolService = false;
  bool? communityService = false;
  String? fileName;
  late Duration difference = servingTo.difference(servingFrom);

  serviceSelection() {
    if (selectedType == "Home Service") {
      serviceType = "home";
    } else if (selectedType == "School Service") {
      serviceType = "school";
    }
    if (selectedType == "Community Service") {
      serviceType = "community";
    }
  }

  serviceBoolSelection() {
    if (serviceType == "home") {
      homeService = true;
    } else if (serviceType == "school") {
      schoolService = true;
    }
    if (serviceType == "community") {
      communityService = true;
    }
  }

  photoSelection() {
    if (image1 == null) {
      return null;
    } else {
      return MultipartFile.fromFile(image1!.path, filename: fileName);
    }
  }

  createServiceRecord(context) async {
    final FormData body = FormData.fromMap({
      "user_id": prefs.user?.id,
      "is_home_service": homeService,
      "is_school_service": schoolService,
      "is_community_service": communityService,
      "service_type": serviceType,
      "category": selectedCategory,
      "reflection": reflectionController.text,
      "serving_date": servingDateController.text,
      "serving_from_time": formattedFromTime,
      "serving_to_time": formattedToTime,
      "service_duration": difference,
      "photo": await photoSelection(),
      "program_nature": programNatureController.text,
      "service_organization": serviceOrganizationController.text,
      "person_in_charge_name": personInChargeNameController.text,
      "person_in_charge_contact_no": personInChargeContactNoController.text,
      "is_active":true
    });
    showLoading();

    final res = await api.serviceRecordCreateRepo.getServiceRecord(body);

    print(res);
    print(serviceType);
    //notifyListeners();

    if (res.data['success'] == true) {
      hideLoading();
      print(res);
      //print('difference = ${servingTo.difference(servingFrom)}');

      final record = res.data["data"];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CommunityServiceSuccess()));
      serviceRecord = ServiceRecordCreateModel.fromJson(record);
    } else {
      showError(res.data['message'] ?? "");
    }
  }
}

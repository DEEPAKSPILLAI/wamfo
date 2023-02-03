import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/service_tower/service_record/service_record_vm.dart';

import '../form_page/form_page.dart';

class ServiceRecord extends StatefulWidget {
  const ServiceRecord({super.key});

  @override
  State<ServiceRecord> createState() => _ServiceRecordState();
}

class _ServiceRecordState extends State<ServiceRecord>
    with BasePage<ServiceRecordVM> {
  List<String> items = ['1', '2', '3', '4', '5', '6'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Profile(),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 3,
                  height: MediaQuery.of(context).size.height - 185,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(
                          'assets/common/service_record_bg.jpg'),
                    ),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                           child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/common/back.png'),
                            ),
                          ),
                          Expanded(
                      child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                margin: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                                height: double.infinity,
                                width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffF6DFB5),
                                border: Border.all(
                                    color: Color(0xff8A541E), width: 8),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 30, top: 10, right: 30),
                                  child: Text(
                                    'Service Record',
                                    style: TextStyle(
                                        color: Color(0xff008F06), fontSize: 24),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Divider(
                                  height: 15,
                                  indent: 30,
                                  endIndent: 30,
                                  color: Color(0xff008F06).withOpacity(.5),
                                  thickness: 2,
                                ),
                              Expanded(
                                  child: ListView.builder(
                                  itemCount: 6,
                                  padding: EdgeInsets.only(
                                      left: 35,
                                      right: 35,
                                      // top: 100,
                                      bottom: 10),
                                  itemBuilder: (context, index) {
                                    index = index + 1;
                                                        
                                    return Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: GestureDetector(
                                        onTap: (() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FormPage()),
                                          );
                                        }),
                                        child: Container(
                                          height: 70,
                                          width: 20,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/common/play_button.png'),
                                                  fit: BoxFit.fill)),
                                          child: Center(
                                            child: Text(
                                              'Form $index',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 17,
                                                color: Color(0xff64361C),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ]
                      ),
                           )))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  ServiceRecordVM create() => ServiceRecordVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}

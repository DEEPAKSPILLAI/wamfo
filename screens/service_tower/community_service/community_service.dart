import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/service_tower/buttons/buttonImage2.dart';
import 'package:wamfo/screens/service_tower/community_service/community_service_vm.dart';
import 'package:wamfo/screens/service_tower/community_service_page_2.dart';

class CommunityService extends StatefulWidget {
  const CommunityService({super.key});

  @override
  State<CommunityService> createState() => _CommunityServiceState();
}

class _CommunityServiceState extends State<CommunityService>
    with BasePage<CommunityServiceVM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Form 1 - Community Service',
                                    style: TextStyle(
                                        color: Color(0xff008F06), fontSize: 24),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Divider(
                                  height: 20,
                                  indent: 60,
                                  endIndent: 60,
                                  color: Color(0xff008F06).withOpacity(.5),
                                  thickness: 2,
                                ),
                                Container(
                                  //color: Colors.white,
                                  padding: EdgeInsets.only(left: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Program Nature:',
                                        style: TextStyle(
                                          color: Color(0xff996B51),
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        'Disaster Preparedness X Nature Education - Secondary School Programme on Disaster Resilience',
                                        style: TextStyle(
                                            color: Color(0xff64361C),
                                            fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Date:',
                                        style: TextStyle(
                                          color: Color(0xff996B51),
                                          fontSize: 17,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '22 May, 2022',
                                            
                                            style: TextStyle(
                                                color: Color(0xff64361C),
                                                fontSize: 17),
                                          ),
                                          
                                          Container(
                                              height: 50,
                                              width: 100,
                                              child: ButtonImage2(
                                                  buttonText: 'View ->',
                                                  buttonAction: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CommunityService2()),
                                                    );
                                                  }))
                                        ],
                                      ),
                                    ],
                                  ),
                                )
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
    );
  }

  @override
  CommunityServiceVM create() => CommunityServiceVM();

  @override
  void initialise(BuildContext context) {}
}

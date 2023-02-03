import 'package:flutter/material.dart';


class MysteriousRare extends StatelessWidget {
  const MysteriousRare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
        children: [
                           Container(
                               height: MediaQuery.of(context).size.height ,
                               width: MediaQuery.of(context).size.width ,
                               decoration: const BoxDecoration(
                                 image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/common/rarehome.png'),
                                 ),
                               ),
                               child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 384,
                                    width: 221,
                                    child: Image.asset('assets/common/rarechar.png')),
                                      const Positioned(
                                      top:  635,
                                      left: 130,
                                      child: Text('RARE!!!',
                                      style: TextStyle(
                                        shadows: <Shadow>[
                                                        Shadow(
                                                            offset: Offset(4, 2),
                                                            // color: Color(
                                                            //     0xff00000080)
                                                           color: Colors.grey
                                                            
                                                                )
                                                      ],
                                        color: Colors.white,
                                        fontSize: 48
                                      ),
                                      ))
                                ],
                               ),
                           )
        ]
       )
    );
  }
}
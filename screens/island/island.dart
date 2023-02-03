import 'package:flutter/material.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/island/island_vm.dart';
import 'package:wamfo/screens/island/island_widgets.dart';
import '/base/base_page.dart';

class Island extends StatefulWidget {
  const Island({Key? key}) : super(key: key);

  @override
  State<Island> createState() => _IslandState();
}

class _IslandState extends State<Island> with BasePage<IslandVM> {
  @override
  Widget build(BuildContext context) {
    return builder(
      () => Scaffold(
        body: Column(
          children: [
            Profile(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 185,
              child: InteractiveViewer(
                minScale: 0.1,
                maxScale: 5,
                child: IslandWidgets(),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  IslandVM create() => IslandVM();

  @override
  void initialise(BuildContext context) {}
}

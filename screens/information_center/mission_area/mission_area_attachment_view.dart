import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/information_center/mission_area/mission_area_2_vm.dart';

class MissionAreaAttachment extends StatefulWidget {
  final String doc;
  const MissionAreaAttachment({super.key, required this.doc});

  @override
  State<MissionAreaAttachment> createState() => _MissionAreaAttachmentState();
}

class _MissionAreaAttachmentState extends State<MissionAreaAttachment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(
        widget.doc,
        //key: provider.pdfViewerKey,
      ),
    );
  }
}

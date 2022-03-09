import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../image_upload/image_upload_repository/image_upload_repo.dart';
import '../../widgets/appbar_gradiente.widget.dart';

class EsignScreen extends StatefulWidget {
  final String userid;
  const EsignScreen(this.userid, {Key? key}) : super(key: key);

  @override
  _EsignScreenState createState() => _EsignScreenState();
}

class _EsignScreenState extends State<EsignScreen> {


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImageUploadViewModel>.reactive(
      viewModelBuilder: () => ImageUploadViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder:
          (BuildContext context, ImageUploadViewModel model, Widget? child) =>
              Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: appbarGradientWidget(),
          leadingWidth: 40,
          title: Text("Dibuja tu firma"),
        ),
        body: Stack(
          children: [
            Container(
              child: SfSignaturePad(
                key: model.signaturePadKey,
                minimumStrokeWidth: 4,
                maximumStrokeWidth: 3,
                strokeColor: Colors.blue,
                backgroundColor: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  model.uploadSignature(widget.userid,context);

                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(33, 132, 195, 1), // #2184c3
                        Color.fromRGBO(26, 175, 77, 1), // #1aaf4d
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.upload_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Subir", // upload
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
            ),
          //  Text("${model.title}")
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_home_care/app/core/utils/app_urls.dart';
import 'package:health_home_care/models/token.model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:uuid/uuid.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import '../../repositories/token.repository.dart';
import '../hive_model/image_record_model.dart';
import 'package:health_home_care/app/core/network/network_info.dart';

class ImageUploadViewModel extends BaseViewModel {
  String title = 'default';
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  BuildContext? context;
  final hiveBox = "fileRecord";
  final TokenRepository _tokenService = GetIt.I.get();
  String? mtoken;

  Future<void> initialise() async {
    Token token = await _tokenService.getTokenFromStore();
    mtoken = token.accessToken;
    getList();
    print(mtoken);
  }

  void uploadSignature(String muserid, BuildContext mcontext) async {
    context = mcontext;

    ui.Image image = await signaturePadKey.currentState!.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    Directory offlineStorage = await getApplicationDocumentsDirectory();
    String tempPath = offlineStorage.path;
    var filePath = tempPath + '/${Uuid().v4()}.png';
    File file = await File(filePath).writeAsBytes(byteData!.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    bool isConnected = await isConnectedToNetwork();
    // CHECK INTERNET IS CONNECTED OR NOT
    if (isConnected) {
      sentHttpRequest(muserid, file);
    } else {
      insert(ImageRecordModel(muserid, file.path));
      showErrorToast(
          "Internet no está conectado pero su registro se guarda sin conexión.",
          mcontext);
    }
  }

  Future<bool> sentHttpRequest(String muserid, File file) async {
    print("HTTP CALLING");
    if (mtoken == null) {
      await initialise();
    }

    var headers = {
      'Authorization': 'Bearer ${mtoken}',
      'Content-Type': 'image/png'
    };
    //


    //


    await http
        .post(
            Uri.parse(
                '${AppUrls.baseUrl}/api/v1/RegistroClinico/${int.parse(muserid)}/saveandclose'),
            headers: headers,
            body: file.readAsBytesSync())
        .then((value) {
      if (value.statusCode == 200) {
        showToast(jsonDecode(value.body)["message"], context!);
        return true;
      } else {
        print(value.body);
        showErrorToast("Error uploading image", context!);
        return false;
      }
    });
    return false;
  }

  Future<void> insert(ImageRecordModel model) async {
    final box = await Hive.openBox<ImageRecordModel>(hiveBox);
    if (box.containsKey(model.key)) await model.delete();
    await box.add(model);
    print("Item added");
  }

  Future<void> uploadPendingRequest(BuildContext mcontext) async {
    context = mcontext;
    bool isConnected = await isConnectedToNetwork();
    if (isConnected == false) {
      showErrorToast("Internet not found", mcontext);
      return;
    }

    final List<ImageRecordModel>? list = await getList();
    if (list != null) {
      await Future.forEach(list, (ImageRecordModel element) async {
        await sentHttpRequest(element.id!, File(element.imagePath!))
            .then((value) {
              element.delete();
        });
      });
    }
  }

  Future<List<ImageRecordModel>> getList() async {
    final box = await Hive.openBox<ImageRecordModel>(hiveBox);
    List<ImageRecordModel> list;
    list = box.values.toList();
    print(list.length);
    return list;
  }

  showToast(String message, BuildContext context) {
    Flushbar(
      titleText: Text(
        "Success",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      message: message,
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      title: message,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 2),
    )..show(context).whenComplete(() {
        Navigator.pop(context);
      });
  }

  showErrorToast(String message, BuildContext context) {
    Flushbar(
      titleText: Text(
        "Error",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      message: message,
      messageSize: 12,
      icon: Icon(
        Icons.cancel,
        color: Colors.red,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      title: message,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 2),
    )..show(context);
  }
}

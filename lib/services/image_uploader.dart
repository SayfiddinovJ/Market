import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market/data/models/universal_data.dart';

class ImageHandler {
  static Future<UniversalData> imageUploader(XFile xFile) async {
    String downloadUrl = "";
    try {
      debugPrint("try");
      final storageRef = FirebaseStorage.instance.ref();
      debugPrint("storage ref");
      var imageRef = storageRef.child("images/${xFile.name}");
      debugPrint("image ref");
      debugPrint("xFile.path $xFile.path");
      await imageRef.putFile(File(xFile.path));
      debugPrint("put file");
      downloadUrl = await imageRef.getDownloadURL();
      debugPrint("download url $downloadUrl");

      return UniversalData(data: downloadUrl);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future<String> fileUploader(File file, String fileName) async {
    String downloadUrl = "";
    final storageRef = FirebaseStorage.instance.ref();
    var imageRef = storageRef.child("files/pdf/$fileName");
    await imageRef.putFile(File(file.path));
    downloadUrl = await imageRef.getDownloadURL();
    // print("FILE DOWNLOAD URL:$downloadUrl");
    return downloadUrl;
  }
}

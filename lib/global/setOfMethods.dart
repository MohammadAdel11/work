import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class globalMethods{
  Future<String?> selectPhoto(
      {required BuildContext context, double? width, double? height}) async {
    return showModalBottomSheet(
      backgroundColor: Theme.of(context).primaryColor,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              trailing: Icon(Icons.filter),
              title: Text('حمل صوره من معرض الصور'),
              onTap: ()async{
                String? x=await _pickImage(source:ImageSource.gallery,width: width,height: height);
                Navigator.of(context).pop(x);
              },
            ),
            ListTile(
              trailing: Icon(Icons.camera),
              title: Text('استخدك الكاميرا'),
              onTap: ()async{
                String? x= await _pickImage(source:ImageSource.camera,width: width,height: height);
                Navigator.of(context).pop(x);
              },
            ),
          ],
        );
      },
    );
  }

  Future _pickImage({required ImageSource source, double? width, double? height}) async {
    ImagePicker _imagePicker = ImagePicker();
    final pickedFile = await _imagePicker.pickImage(source: source,maxHeight: height,maxWidth: width);
    if (pickedFile == null) return;
    var file =await ImageCropper().cropImage(sourcePath: pickedFile.path, aspectRatio:(width==null || height ==null) ?null: CropAspectRatio(ratioX: width, ratioY: height));
    if (file == null) return;
    if(file.path.contains('.jpg') || file.path.contains('.jpeg')){
      return  (await compressImage(file.path, 35))?.path;
    }

  }

  Future<XFile?> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');
    final result = await FlutterImageCompress.compressAndGetFile(path, newPath,
        quality: quality);
    return result;
  }
}
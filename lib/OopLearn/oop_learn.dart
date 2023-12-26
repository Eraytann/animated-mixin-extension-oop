import 'dart:io';
import 'package:flutter_202/OopLearn/custom_exception.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('hata');

    return true;
  }
}

//Üst sınıfın bütün özelliklerini alıp işleme göre tekrar özelleştirebilr
class FileDownload2 extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    //üst sınfıa yeni özellikleri kazandırıyoruz
    throw UnimplementedError();
  }

  @override
  void toShowFile(args) {
    // TODO: implement toShowFile
  }
}

class FileItem {
  final String? name;
  final File? file;

  FileItem({this.name, this.file});
}

//Inheritance
//Sadece belirli durumlardan türeyenlere özellik kazandırabilir,
mixin ShareMixin on IFileDownload {
  void toShowFile(args);
}

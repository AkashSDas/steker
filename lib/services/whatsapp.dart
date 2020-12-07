import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_stickers/exceptions.dart';
import 'package:whatsapp_stickers/whatsapp_stickers.dart';

Future installFromRemote(List<dynamic> stickers, String stickerTag) async {
  var applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
  var stickersDirectory = Directory(
    '${applicationDocumentsDirectory.path}/stickers',
  );

  if (stickersDirectory.existsSync()) {
    stickersDirectory.deleteSync(recursive: true);
  }
  stickersDirectory.createSync(recursive: true);

  final dio = Dio();
  final downloads = <Future>[];

  Directory stickerPackDir = Directory('${stickersDirectory.path}/$stickerTag');

  if (!stickerPackDir.existsSync()) {
    stickerPackDir.createSync(recursive: true);
  }

  stickers.asMap().forEach((index, stickerUrl) {
    downloads.add(
      dio.download(
        '$stickerUrl',
        '${stickersDirectory.path}/$stickerTag/$stickerTag-${index + 1}.webp',
      ),
    );
  });

  await Future.wait(downloads);

  print(downloads);

  var stickerPack = WhatsappStickers(
    identifier: '$stickerTag',
    name: '$stickerTag stickers',
    publisher: 'AkashSDas',
    trayImageFileName: WhatsappStickerImage.fromAsset(
      'assets/tray_img1.png',
    ),
    publisherWebsite: '',
    privacyPolicyWebsite: '',
    licenseAgreementWebsite: '',
  );

  stickers.asMap().forEach((index, stickerUrl) {
    stickerPack.addSticker(
      WhatsappStickerImage.fromFile(
        '${stickersDirectory.path}/$stickerTag/$stickerTag-${index + 1}.webp',
      ),
      ['', ''],
    );
  });

  print(stickerPackDir.listSync());

  try {
    await stickerPack.sendToWhatsApp();
  } on WhatsappStickersException catch (e) {
    print(e.cause);
  }
}

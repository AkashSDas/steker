import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_stickers/exceptions.dart';
import 'package:whatsapp_stickers/whatsapp_stickers.dart';

Future installFromRemote(List<dynamic> stickers, String stickerTag) async {
  var applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
  var stickersDirectory =
      Directory('${applicationDocumentsDirectory.path}/stickers');
  await stickersDirectory.create(recursive: true);

  final dio = Dio();
  final downloads = <Future>[];

  stickers.asMap().forEach((index, stickerUrl) {
    downloads.add(
      dio.download(
        '$stickerUrl',
        '${stickersDirectory.path}/$stickerTag-${index + 1}.webp',
      ),
    );
  });

  await Future.wait(downloads);

  var stickerPack = WhatsappStickers(
    identifier: '$stickerTag',
    name: '$stickerTag stickers',
    publisher: 'AkashSDas',
    trayImageFileName: WhatsappStickerImage.fromAsset(
      'assets/tray_img.png',
    ),
    publisherWebsite: '',
    privacyPolicyWebsite: '',
    licenseAgreementWebsite: '',
  );

  stickers.asMap().forEach((index, stickerUrl) {
    stickerPack.addSticker(
      WhatsappStickerImage.fromFile(
        '${stickersDirectory.path}/$stickerTag-${index + 1}.webp',
      ),
      ['', ''],
    );
  });

  try {
    await stickerPack.sendToWhatsApp();
  } on WhatsappStickersException catch (e) {
    print(e.cause);
  }
}

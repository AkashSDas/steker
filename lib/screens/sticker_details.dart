import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:steker/services/services.dart';
import 'package:steker/shared/app_bar.dart';

import '../constant.dart' as Constant;

class StickerDetailsScreen extends StatelessWidget {
  final Sticker sticker;

  StickerDetailsScreen({this.sticker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              CustomAppBar(
                title: 'details',
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: Constant.space * 2,
                    horizontal: Constant.space * 2,
                  ),
                  padding: EdgeInsets.all(Constant.space),
                  decoration: BoxDecoration(
                    color: Constant.purple,
                    borderRadius: BorderRadius.circular(Constant.space),
                  ),
                  child: Text('#${sticker.tag}'),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(Constant.space),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: sticker.stickerImgUrls.length,
                  itemBuilder: (context, idx) {
                    return _stickerImg(sticker.stickerImgUrls[idx]);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  padding: EdgeInsets.all(Constant.space),
                  onPressed: () => installFromRemote(
                    sticker.stickerImgUrls,
                    sticker.tag,
                  ),
                  color: Constant.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Constant.space),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            FontAwesome.whatsapp,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                        TextSpan(
                          text: 'Add to WhatsApp',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stickerImg(String url) {
    return Container(
      height: Constant.space * 8,
      width: Constant.space * 8,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
        ),
      ),
    );
  }
}

// Future installFromRemote(List<dynamic> stickers, String stickerTag) async {
//   var applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
//   var stickersDirectory =
//       Directory('${applicationDocumentsDirectory.path}/stickers');
//   await stickersDirectory.create(recursive: true);

//   final dio = Dio();
//   final downloads = <Future>[];

//   stickers.asMap().forEach((index, stickerUrl) {
//     downloads.add(
//       dio.download(
//         '$stickerUrl',
//         '${stickersDirectory.path}/$stickerTag-${index + 1}.webp',
//       ),
//     );
//   });

//   await Future.wait(downloads);

//   var stickerPack = WhatsappStickers(
//     identifier: '$stickerTag',
//     name: '$stickerTag stickers',
//     publisher: 'AkashSDas',
//     trayImageFileName: WhatsappStickerImage.fromFile(
//       '${stickersDirectory.path}/$stickerTag-1.webp',
//     ),
//     publisherWebsite: '',
//     privacyPolicyWebsite: '',
//     licenseAgreementWebsite: '',
//   );

//   stickers.asMap().forEach((index, stickerUrl) {
//     stickerPack.addSticker(
//       WhatsappStickerImage.fromFile(
//         '${stickersDirectory.path}/$stickerTag-${index + 1}.webp',
//       ),
//       ['', ''],
//     );
//   });

//   try {
//     await stickerPack.sendToWhatsApp();
//   } on WhatsappStickersException catch (e) {
//     print(e.cause);
//   }
// }

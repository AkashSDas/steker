import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constant.dart' as Constant;
import '../services/services.dart';
import '../shared/app_bar.dart';

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
                    return Container(
                      height: Constant.space * 8,
                      width: Constant.space * 8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(sticker.stickerImgUrls[idx]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Constant.space * 3),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton.icon(
                    icon: Icon(
                      FontAwesome.whatsapp,
                      color: Theme.of(context).textTheme.headline4.color,
                    ),
                    padding: EdgeInsets.all(Constant.space),
                    color: Constant.green,
                    onPressed: () => installFromRemote(
                      sticker.stickerImgUrls,
                      sticker.tag,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Constant.space * 0.6),
                    ),
                    label: Text(
                      'Add to WhatsApp',
                      style: Theme.of(context).textTheme.headline4,
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
}

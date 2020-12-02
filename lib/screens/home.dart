import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:steker/services/globals.dart';
import 'package:steker/services/models.dart';
import 'package:steker/shared/drawer.dart';
import 'package:steker/shared/loader.dart';
import 'package:steker/shared/shared.dart';

import '../constant.dart' as Constant;

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('home'),
      // ),
      key: _scaffoldKey,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
        ),
        child: AppDrawer(),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              CustomAppBar(
                title: 'home',
                currentPath: '/home',
                scaffoldKey: _scaffoldKey,
              ),
              FutureBuilder(
                future: Global.stickerRef.getData(),
                builder: (context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    List<Sticker> stickers = snap.data;
                    stickers.add(stickers[0]);
                    stickers.add(stickers[0]);
                    stickers.add(stickers[0]);
                    return Expanded(
                      child: ListView.builder(
                        itemCount: stickers.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, int idx) {
                          return StickerCollectionListView(
                            sticker: stickers[idx],
                          );
                        },
                      ),
                    );
                  }
                  return Loader();
                },
              ),
              // StreamBuilder(
              //   stream: FirebaseFirestore.instance
              //       .collection('stickers')
              //       .snapshots(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Text(
              //         '${snapshot.data.documents.map((doc) => "${doc['tag']}")}',
              //       );
              //     }
              //     return Text('loading...');
              //   },
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNav(),
    );
  }
}

class StickerCollectionListView extends StatelessWidget {
  final Sticker sticker;

  StickerCollectionListView({Key key, this.sticker}) : super(key: key);

  String capitalize(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }

  String getCollectionTitle(String tag) {
    List<String> words = tag.split('-');
    for (int i = 0; i < words.length; i++) {
      words[i] = capitalize(words[i]);
    }
    return words.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Constant.space),
      padding: EdgeInsets.all(Constant.space),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        boxShadow: [Constant.boxShadow],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getCollectionTitle(sticker.tag),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              _Btns(),
            ],
          ),
          SizedBox(height: Constant.space * 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _stickerImg(sticker.stickerImgUrls[0]),
              _stickerImg(sticker.stickerImgUrls[1]),
              _stickerImg(sticker.stickerImgUrls[2]),
              _stickerImg(sticker.stickerImgUrls[3]),
            ],
          )
        ],
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

class _Btns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => print('add btn pressed'),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Constant.space * 0.2,
              horizontal: Constant.space,
            ),
            decoration: BoxDecoration(
              color: Constant.green,
              borderRadius: BorderRadius.circular(Constant.space * 2),
            ),
            child: Row(
              children: [
                Icon(FontAwesome.whatsapp),
                SizedBox(width: Constant.space * 0.2),
                Text(
                  'Add',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
        ),
        SizedBox(width: Constant.space),
        InkWell(
          onTap: () => print('go to detials screen'),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Constant.space * 0.2,
              horizontal: Constant.space,
            ),
            decoration: BoxDecoration(
              color: Constant.purple,
              borderRadius: BorderRadius.circular(Constant.space * 2),
            ),
            child: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}

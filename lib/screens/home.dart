import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import './sticker_details.dart';
import '../constant.dart' as Constant;
import '../services/services.dart';
import '../shared/shared.dart';

class HomeScreen extends StatelessWidget {
  /// Using a GlobalKey for the Custom Drawer to work
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      /// Wraping the Theme widget around the Custom Drawer
      /// to make canvasColor avaiable there which was not
      /// possible via ThemeData in root MaterialApp
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
                    return Expanded(
                      child: ListView.builder(
                        itemCount: stickers.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, int idx) {
                          return StickerListItem(
                            sticker: stickers[idx],
                          );
                        },
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.all(Constant.space * 6),
                    child: Loader(),
                  );
                },
              ),

              /// Other way of getting the stickers data
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

class StickerListItem extends StatelessWidget {
  final Sticker sticker;

  StickerListItem({Key key, this.sticker}) : super(key: key);

  String capitalize(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }

  String getTitleUsingTag(String tag) {
    List<String> words = tag.split('-');
    for (int i = 0; i < words.length; i++) {
      words[i] = capitalize(words[i]);
    }
    return words.join(' ');
  }

  void _navigateToDetialsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StickerDetailsScreen(
          sticker: sticker,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Constant.space),
      padding: EdgeInsets.all(Constant.space),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        boxShadow: [Constant.boxShadow],
        borderRadius: BorderRadius.circular(Constant.space * 2),
      ),
      child: InkWell(
        onTap: () => _navigateToDetialsScreen(context),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getTitleUsingTag(sticker.tag),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                StickerListItemActionBtnGroup(sticker: sticker),
              ],
            ),
            SizedBox(height: Constant.space * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              /// Displaying only 4 imgs
              children: List.generate(4, (index) {
                return Container(
                  height: Constant.space * 8,
                  width: Constant.space * 8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(sticker.stickerImgUrls[index]),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class StickerListItemActionBtnGroup extends StatelessWidget {
  final Sticker sticker;

  StickerListItemActionBtnGroup({this.sticker});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FlatButton.icon(
          color: Constant.green,
          icon: Icon(
            FontAwesome.whatsapp,
            color: Theme.of(context).textTheme.headline6.color,
          ),
          label: Text(
            'Add',
            style: Theme.of(context).textTheme.headline6,
          ),
          onPressed: () => installFromRemote(
            sticker.stickerImgUrls,
            sticker.tag,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constant.space * 2),
          ),
        ),
        SizedBox(width: Constant.space),
        Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              color: Constant.purple,
              borderRadius: BorderRadius.circular(Constant.space * 2),
            ),
            child: InkWell(
              onTap: () => _navigateToDetialsScreen(context),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constant.space * 1.2,
                  vertical: Constant.space * 0.8,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToDetialsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StickerDetailsScreen(
          sticker: sticker,
        ),
      ),
    );
  }
}

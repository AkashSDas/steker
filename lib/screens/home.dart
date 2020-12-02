import 'package:flutter/material.dart';
import 'package:steker/services/globals.dart';
import 'package:steker/services/models.dart';
import 'package:steker/shared/drawer.dart';
import 'package:steker/shared/loader.dart';
import 'package:steker/shared/shared.dart';

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
                    return Text('${stickers[0].tag}');
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

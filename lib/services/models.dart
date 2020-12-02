/// Database Collections

class Sticker {
  String id;
  String tag;
  List<String> stickerImgUrls;

  Sticker({this.id, this.stickerImgUrls, this.tag});

  Sticker.fromJson(Map data) {
    id = data['uid'];
    tag = data['tag'] ?? 'no-tag';
    stickerImgUrls = data['stickers'] ?? [];
  }
}

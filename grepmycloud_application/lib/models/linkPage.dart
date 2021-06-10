import 'package:flutter/foundation.dart';
import 'package:grepmycloud_application/models/linkCreator.dart';

class LinkPageModel extends ChangeNotifier {
  late LinkCreatorModel _linkCreator;

  final List<int> _links = [];

  LinkCreatorModel get linkCreator => _linkCreator;

  set linkCreator(LinkCreatorModel newLinkCreator) {
    _linkCreator = newLinkCreator;
    notifyListeners();
  }

  List<Link> get links => _links.map((id) => _linkCreator.getById(id)).toList();

  void add(Link link) {
    _links.add(link.id);
    notifyListeners();
  }

  void remove(Link link) {
    _links.remove(link.id);
    notifyListeners();
  }
}

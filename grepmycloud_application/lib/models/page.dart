import 'package:flutter/foundation.dart';
import 'package:grepmycloud_application/models/link.dart';

class PageModel extends ChangeNotifier {
  late LinkModel _linkCreator;

  final List<int> _links = [];

  LinkModel get linkCreator => _linkCreator;

  set linkCreator(LinkModel newLinkCreator) {
    _linkCreator = newLinkCreator;
    notifyListeners();
  }

  List<Link> get links => _links.map((id) => _linkCreator.getById(id)).toList();

  void add(Link link) {
    _links.add(link.id);
    _linkCreator.add(link.name);
    notifyListeners();
  }

  void remove(Link link) {
    _links.remove(link.id);
    _linkCreator.add(link.name);
    notifyListeners();
  }
}

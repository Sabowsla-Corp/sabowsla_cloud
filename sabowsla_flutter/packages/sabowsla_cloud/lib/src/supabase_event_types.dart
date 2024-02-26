enum SabowslaEventTypes { insert, update, delete, all, broadcast, presence }

extension SabowslaEventTypesName on SabowslaEventTypes {
  String name() {
    final name = toString().split('.').last;
    if (name == 'all') {
      return '*';
    } else {
      return name.toUpperCase();
    }
  }
}

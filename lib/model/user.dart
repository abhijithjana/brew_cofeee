class Users {
  late String uid;
  Users({required this.uid}) {
    this.uid = uid;
  }
}

class Userdata {
  late final String uid;
  late final String name;

  late final String sugar;
  late final int strength;

  Userdata(
      {required this.uid,
      required this.name,
      required this.strength,
      required this.sugar});
}

import 'dart:typed_data';

import 'package:uuid/uuid.dart';

class GuidHelper {
  static List<int> _stringToByteArray(String hex) {
    int numberChars = hex.length;
    List<int> bytes = List.filled(numberChars ~/ 2, 0);
    for (int i = 0; i < numberChars; i += 2) {
      bytes[(i ~/ 2)] = int.parse(hex.substring(i, i + 2), radix: 16);
    }
    return bytes;
  }

  static UuidValue guidToUuidValue(String uuid) {
    List<int> uuidBytes = UuidValue(uuid).toBytes();
    List<int> uuidNew = sortList(uuidBytes);
    String uuid2 = Uuid.unparse(Uint8List.fromList(uuidNew));
    return UuidValue(uuid2);
  }

  static String hextToGuid(String hex) {
    List<int> list = _stringToByteArray(hex);
    List<int> renew = sortList(list);

    UuidValue uuidValue = UuidValue.fromByteList(Uint8List.fromList(renew));
    return uuidValue.uuid;
  }

  static String listToGuid(List<int> list) {
    List<int> renew = sortList(list);

    UuidValue uuidValue = UuidValue.fromByteList(Uint8List.fromList(renew));
    return uuidValue.uuid;
  }

  static List<int> sortList(List<int> list) {
    return [
      list[3],
      list[2],
      list[1],
      list[0],
      list[5],
      list[4],
      list[7],
      list[6],
      list[8],
      list[9],
      list[10],
      list[11],
      list[12],
      list[13],
      list[14],
      list[15],
    ];
  }
}

import 'dart:typed_data';

import 'package:bson/src/helper/guid_helper.dart';

import '../../bson.dart';

class BsonUuid extends BsonBinary {
  BsonUuid([UuidValue? uuid])
      : super.from(uuidToByteList(uuid), subType: BsonBinary.subtypeUuid);

  BsonUuid.from(Iterable<int> byteList)
      : super.from(byteList, subType: BsonBinary.subtypeUuid);

  BsonUuid.fromHexString(String hexString)
      : super.fromHexString(hexString, subType: BsonBinary.subtypeUuid);

  factory BsonUuid.parse(String uuidString) => BsonUuid(UuidValue(uuidString));

  factory BsonUuid.fromBuffer(BsonBinary buffer) {
    var ret = BsonBinary.fromBuffer(buffer);
    if (ret is! BsonUuid) {
      throw ArgumentError(
          'Cannot create a Bson/*  */Uuid object because the subtype is not "4"');
    }
    return ret;
  }

  /*  static Uint8List uuidToByteList(UuidValue? uuid) =>
      Uint8List.fromList((uuid ??= Uuid().v4obj()).toBytes()); */
  static Uint8List uuidToByteList(UuidValue? uuid) {
    final uuidBytes = uuid!.toBytes();
    List<int> sortedList = GuidHelper.sortList(uuidBytes);

    return Uint8List.fromList(sortedList);
  }

  @override
  String toString() => 'UUID("${value.toString()}")';
  String toHexString() => hexString;

  @override
  UuidValue get value => UuidValue(Uuid.unparse(byteList));

  String toJson() => value.toString();
}

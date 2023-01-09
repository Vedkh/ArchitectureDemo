import 'package:floor/floor.dart';


@Entity(tableName: 'users', indices: [Index(name: 'ix_user_uuid', value: ['uuid'], unique: true)])
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  @ColumnInfo(name: 'uuid')
  late String uuid;

  @ColumnInfo(name: 'photo')
  late String photo;

  @ColumnInfo(name: 'banReason')
  late String banReason;

  @ColumnInfo(name: 'firstLastName')
  String firstLastName = '';

  @ColumnInfo(name: 'birthday')
  int birthday = 0;

  @ColumnInfo(name: 'address')
  String address = '';

  @ColumnInfo(name: 'phone')
  String phone = '';

  User({
    required this.uuid,
    required this.banReason,
    required this.firstLastName,
    required this.birthday,
    required this.address,
    required this.phone,
    required this.photo
  });

  User.fromJson(dynamic json) {
    uuid = (null == json['uuid']) ? '' : json['uuid'];
    banReason = (null == json['banReason']) ? '' : json['banReason'];
    firstLastName = (null == json['firstLastName']) ? '' : json['firstLastName'];
    birthday = (null == json['birthday']) ? 0 : json['birthday'];
    address = (null == json['address']) ? "" : json['address'];
    phone = (null == json['phone']) ? '' : json['phone'];
    photo = (null == json['photo']) ? '' : json['photo'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['banReason'] = banReason;
    map['firstLastName'] = firstLastName;
    map['birthday'] = birthday;
    map['address'] = address;
    map['phone'] = phone;
    map['photo'] = photo;
    return map;
  }

}
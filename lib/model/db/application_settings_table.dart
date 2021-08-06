import 'package:flutterbasictemplate/model/db/db_model.dart';

class ApplicationSettingTable with DbModel {
  ApplicationSettingTable({
    this.androidAppMinVersion,
    this.androidAppLatestVersion,
    this.iOsAppLatestVersion,
    this.iOsAppMinVersion,
    this.serverDeployedOn,
    this.serverVersion,
    this.settingModifiedOn,
    this.supportedLanguages,
  });

  int? androidAppMinVersion;
  int? androidAppLatestVersion;
  String? iOsAppLatestVersion;
  String? iOsAppMinVersion;
  DateTime? serverDeployedOn;
  String? serverVersion;
  DateTime? settingModifiedOn;
  List<dynamic>? supportedLanguages;

  factory ApplicationSettingTable.fromJson(Map<String, dynamic> json) =>
      ApplicationSettingTable(
        androidAppMinVersion: json["AndroidAppMinVersion"] == null
            ? null
            : json["AndroidAppMinVersion"],
        androidAppLatestVersion: json["AndroidAppLatestVersion"] == null
            ? null
            : json["AndroidAppLatestVersion"],
        iOsAppLatestVersion: json["iOSAppLatestVersion"] == null
            ? null
            : json["iOSAppLatestVersion"],
        iOsAppMinVersion:
            json["iOSAppMinVersion"] == null ? null : json["iOSAppMinVersion"],
        serverDeployedOn: json["ServerDeployedOn"] == null
            ? null
            : DateTime.parse(json["ServerDeployedOn"]),
        serverVersion:
            json["ServerVersion"] == null ? null : json["ServerVersion"],
        settingModifiedOn: json["SettingModifiedOn"] == null
            ? null
            : DateTime.parse(json["SettingModifiedOn"]),
        supportedLanguages: json["SupportedLanguages"] == null
            ? null
            : List<dynamic>.from(json["SupportedLanguages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "AndroidAppMinVersion":
            androidAppMinVersion == null ? null : androidAppMinVersion,
        "AndroidAppLatestVersion":
            androidAppLatestVersion == null ? null : androidAppLatestVersion,
        "iOSAppLatestVersion":
            iOsAppLatestVersion == null ? null : iOsAppLatestVersion,
        "iOSAppMinVersion": iOsAppMinVersion == null ? null : iOsAppMinVersion,
        "ServerDeployedOn": serverDeployedOn == null
            ? null
            : serverDeployedOn!.toIso8601String(),
        "ServerVersion": serverVersion == null ? null : serverVersion,
        "SettingModifiedOn": settingModifiedOn == null
            ? null
            : settingModifiedOn!.toIso8601String(),
        "SupportedLanguages": supportedLanguages == null
            ? null
            : List<dynamic>.from(supportedLanguages!.map((x) => x)),
      };

  @override
  String get kCreateTable => '''create table $kTableName(
  ${ApplicationSettingTableInfo.AndroidAppLatestVersion} text,
  ${ApplicationSettingTableInfo.AndroidAppMinVersion} text,
  ${ApplicationSettingTableInfo.iOSAppLatestVersion} text,
  ${ApplicationSettingTableInfo.iOSAppMinVersion} text,
  ${ApplicationSettingTableInfo.ServerDeployedOn} text,
  ${ApplicationSettingTableInfo.ServerVersion} text,
  ${ApplicationSettingTableInfo.SettingModifiedOn} text,
  ${ApplicationSettingTableInfo.SupportedLanguages} text
  )''';

  @override
  String get kTableName => ApplicationSettingTableInfo.table_name;
}

class ApplicationSettingTableInfo {
  static const table_name = 'applicationSetting';
  static const AndroidAppMinVersion = 'AndroidAppMinVersion';
  static const AndroidAppLatestVersion = 'AndroidAppLatestVersion';
  static const iOSAppLatestVersion = 'iOSAppLatestVersion';
  static const iOSAppMinVersion = 'iOSAppMinVersion';
  static const ServerDeployedOn = 'ServerDeployedOn';
  static const ServerVersion = 'ServerVersion';
  static const SettingModifiedOn = 'SettingModifiedOn';
  static const SupportedLanguages = 'SupportedLanguages';
}

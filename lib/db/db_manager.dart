import 'package:flutterbasictemplate/model/db/application_settings_table.dart';
import 'package:flutterbasictemplate/model/db/db_model.dart';
import 'package:flutterbasictemplate/utils/catch_error_utils.dart';

import 'db_helper.dart';

mixin DatabaseManager on DatabaseHelper {
  Future saveApplicationSettings(
      List<ApplicationSettingTable> applicationSettingTable) async {
    return catchError(() async {
      List<DbModel> dbModels = [];
      dbModels.addAll(applicationSettingTable);
      await insertDocs(dbModels);
    });
  }
}

import 'package:flutter/material.dart';

import 'common/models/models.dart';
import 'common/utils/utils.dart';
import 'common/values/values.dart';

/// 全局設定檔
class Global {
  /// 用戶設定檔
  static User? profile;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// 是否第一次打開
  static bool alreadyOpen = false;

  /// init
  static Future init() async {
    // 運行初始化
    WidgetsFlutterBinding.ensureInitialized();

    // 儲存工具初始化
    await StorageUtil.init();
    await DatabaseUtil.init();

    // 讀取第一次打開
    alreadyOpen = StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY); // 第一次打開 找不到 return false
    if (alreadyOpen == false) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }
    // 讀取用戶設定檔
    var profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (profileJSON != null) {
      profile = User.fromJson(profileJSON);
    }
    print("Global init finished");
    
  }

  /// 持久化用戶設定檔
  static Future<bool> saveProfile(User userProfile) {
    profile = userProfile;
    return StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY, userProfile.toJson());
  }

  /// 刪除用戶設定檔
  static Future<bool> deleteProfile() {
    profile = null;
    return StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  }
}

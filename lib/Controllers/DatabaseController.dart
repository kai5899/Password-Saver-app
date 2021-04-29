import 'dart:math';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:password_saver/Models/Account.dart';
import 'package:password_saver/Models/Category.dart';
import 'package:password_saver/Services/DatabaseService.dart';
import 'package:password_saver/Widgets/HomePageWidgets/PanelAddAccount.dart';
import 'package:password_saver/Widgets/HomePageWidgets/PanelAddCategory.dart';
import 'package:password_saver/Widgets/HomePageWidgets/PanelAboutAccount.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DatabaseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCategories();
    getAccounts();
  }

  @override
  void onClose() {
    super.onClose();
    categoryTitleController.dispose();
    accountAuthController.dispose();
    accountPasswordController.dispose();
    accountTitleController.dispose();
  }

  RxInt startTIcon = 0.obs;
  RxInt endTIcon = 8.obs;
  paginateMore() {
    startTIcon.value += 8;
    endTIcon.value += 8;
  }

  paginateLess() {
    startTIcon.value -= 8;
    endTIcon.value -= 8;
  }

  RxInt selectedPanel = RxInt(0);
  Rx<Account> selectedAccount = Rx<Account>();

  Widget getPanel(
    int i,
    ScrollController sc,
  ) {
    if (i == 0) {
      return PanelAddCategory(
        sc: sc,
      );
    } else if (i == 1) {
      return PanelAddAccount(
        sc: sc,
      );
    } else {
      return PanelAboutAccount(
        sc: sc,
        account: selectedAccount.value,
      );
    }
  }

  void changeSelectedPanel(int i, {Account accountz}) {
    selectedPanel.value = i;
    if (accountz != null) {
      selectedAccount.value = accountz;
    }
    update();
  }

  RxBool isPanelOpen = RxBool(false);
  //database ref
  DatabaseHelper _helper = DatabaseHelper.instance;

  //cat color
  RxInt selectedCategoryColor = RxInt(4282339765);

  //account related fields
  RxInt selectedCategoryId = 0.obs;
  RxString selectedAccountIcon = RxString("0");

  TextEditingController generatedPasswordController = TextEditingController();

  //textcontroller
  TextEditingController categoryTitleController = TextEditingController();
  //to account
  TextEditingController accountAuthController = TextEditingController();
  TextEditingController accountTitleController = TextEditingController();
  TextEditingController accountPasswordController = TextEditingController();

  //cat list
  RxList<Category> categories = RxList<Category>();
  RxList<Account> accounts = RxList<Account>();

  get totalPasswords => accounts.length;

  PanelController panelController = PanelController();
  //functions :
  //category functions :

  Future<void> insertCategory(BuildContext context) async {
    Category category = Category(
      color: selectedCategoryColor.value,
      id: DateTime.now().millisecondsSinceEpoch,
      title: categoryTitleController.text,
    );
    int res = await _helper.insertCategory(category);
    if (res != -1) {
      categories.add(category);
      categoryTitleController.clear();
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
      );
    }
  }

  getCategories() async {
    List<Map<String, dynamic>> cats = await _helper.getAllCategories();
    categories.clear();
    cats.forEach((element) {
      categories.add(Category.fromJson(element));
    });
    print(categories.length);
  }

  // accountsFunctions;

  addAccount() async {
    Color color = await getImagePalette(
        AssetImage("assets/icons/accounts/${selectedAccountIcon.value}.png"));
    Account account = Account(
        auth: accountAuthController.text,
        catId: selectedCategoryId.value,
        id: DateTime.now().millisecondsSinceEpoch,
        icon: selectedAccountIcon.value,
        password: accountPasswordController.text,
        title: accountTitleController.text,
        color: color.value);
    int res = await _helper.insertAccount(account);
    if (res != -1) {
      accounts.add(account);
      accountAuthController.clear();
      accountTitleController.clear();
      accountPasswordController.clear();
    }
  }

  getAccounts() async {
    List<Map<String, dynamic>> acc = await _helper.getAllAccounts();
    accounts.clear();
    acc.forEach((element) {
      accounts.add(Account.fromJson(element));
    });
    print(accounts.length);
  }

  Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor.color;
  }

  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void updateRandomString() {
    generatedPasswordController.text = getRandomString(20);
    update();
  }
}

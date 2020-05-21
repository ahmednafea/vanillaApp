import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/local/app_translation.dart';
import 'package:vanilla/model/app_state.dart';

class EditProfile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<EditProfile> {
  String _fullName = "Alisa Heart",
      _email = "example@gmail.com",
      _phone = "01234567890",
      _address = "15 garden st, Cairo",
      _gender = "Female";
  bool _editName = false,
      _editEmail = false,
      _editPhone = false,
      _editAddress = false;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        builder: (BuildContext ctx, Store<AppState> store) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.5),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/img/womanface.jpg"))),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              _fullName,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              _email,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    flex: 3,
                  ),
                ],
              ),
              Divider(color: AppColors.primaryColor),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "معلومات الحساب"
                      : "Account Information".toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "الإسم بالكامل"
                      : "Full Name",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: _editName
                    ? TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none, isDense: true),
                        maxLines: 1,
                        initialValue: _fullName,
                        onEditingComplete: () {
                          setState(() {
                            _editName = false;
                          });
                        },
                        autofocus: true,
                        showCursor: true,
                        onChanged: (var name) {
                          setState(() {
                            _fullName = name;
                          });
                        },
                      )
                    : Text(
                        _fullName,
                      ),
                trailing: _editName
                    ? IconButton(
                        icon: Icon(
                          Icons.check,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _editName = false;
                          });
                        },
                        tooltip: AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تم"
                            : "Done",
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _editName = true;
                            _editEmail = false;
                            _editPhone = false;
                            _editAddress = false;
                          });
                        },
                        tooltip: AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تعديل"
                            : "Edit",
                      ),
              ),
              ListTile(
                title: Text(
                  AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "البريد الإلكترونى"
                      : "Email",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: _editEmail
                    ? TextFormField(
                        decoration: InputDecoration(
                            isDense: true, border: InputBorder.none),
                        maxLines: 1,
                        initialValue: _email,
                        onEditingComplete: () {
                          setState(() {
                            _editEmail = false;
                          });
                        },
                        autofocus: true,
                        showCursor: true,
                        onChanged: (var email) {
                          setState(() {
                            _email = email;
                          });
                        },
                      )
                    : Text(
                        _email,
                      ),
                trailing: _editEmail
                    ? IconButton(
                        icon: Icon(
                          Icons.check,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _editEmail = false;
                          });
                        },
                        tooltip: AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تم"
                            : "Done",
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _editName = false;
                            _editEmail = true;
                            _editPhone = false;
                            _editAddress = false;
                          });
                        },
                        tooltip: AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تعديل"
                            : "Edit",
                      ),
              ),
              ListTile(
                title: Text(
                  AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "الهاتف"
                      : "Phone",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: _editPhone
                    ? TextFormField(
                        decoration: InputDecoration(
                            isDense: true, border: InputBorder.none),
                        maxLines: 1,
                        initialValue: _phone,
                        onEditingComplete: () {
                          setState(() {
                            _editPhone = false;
                          });
                        },
                        autofocus: true,
                        showCursor: true,
                        onChanged: (var phone) {
                          setState(() {
                            _phone = phone;
                          });
                        },
                      )
                    : Text(
                        _phone,
                      ),
                trailing: _editPhone
                    ? IconButton(
                        icon: Icon(
                          Icons.check,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _editPhone = false;
                          });
                        },
                        tooltip: AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تم"
                            : "Done",
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _editName = false;
                            _editEmail = false;
                            _editPhone = true;
                            _editAddress = false;
                          });
                        },
                        tooltip: AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تعديل"
                            : "Edit",
                      ),
              ),
              ListTile(
                title: Text(
                  AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "العنوان"
                      : "Address",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: _editAddress
                    ? TextFormField(
                        decoration: InputDecoration(
                            isDense: true, border: InputBorder.none),
                        maxLines: 1,
                        initialValue: _address,
                        onEditingComplete: () {
                          setState(() {
                            _editAddress = false;
                          });
                        },
                        autofocus: true,
                        showCursor: true,
                        onChanged: (var address) {
                          setState(() {
                            _address = address;
                          });
                        },
                      )
                    : Text(
                        _address,
                      ),
                trailing: _editAddress
                    ? IconButton(
                        icon: Icon(
                          Icons.check,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _editAddress = false;
                          });
                        },
                        tooltip: AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تم"
                            : "Done",
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _editName = false;
                            _editEmail = false;
                            _editPhone = false;
                            _editAddress = true;
                          });
                        },
                        tooltip: AppTranslations.of(ctx).currentLanguage == "ar"
                            ? "تعديل"
                            : "Edit",
                      ),
              ),
              ListTile(
                title: Text(
                  AppTranslations.of(ctx).currentLanguage == "ar"
                      ? "الجنس"
                      : "Gender",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: PopupMenuButton<int>(
                  child: ListTile(
                    leading: Image.asset(
                      "assets/icon/gender_icon.png",
                      fit: BoxFit.cover,
                    ),
                    title: Text(_gender),
                    trailing: Icon(Icons.keyboard_arrow_down),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text(
                          AppTranslations.of(ctx).currentLanguage == "ar"
                              ? "ذكر"
                              : "Male"),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(
                          AppTranslations.of(ctx).currentLanguage == "ar"
                              ? "أنثى"
                              : "Female"),
                    ),
                  ],
                  onCanceled: () {
                    print("You have canceled the menu.");
                  },
                  elevation: 2,
                  offset: Offset(20, 80),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  onSelected: (value) {
                    print("value:$value");
                    if (value == 1) {
                      setState(() {
                        _gender =
                            AppTranslations.of(ctx).currentLanguage == "ar"
                                ? "ذكر"
                                : "Male";
                      });
                    } else {
                      setState(() {
                        _gender =
                            AppTranslations.of(ctx).currentLanguage == "ar"
                                ? "أنثى"
                                : "Female";
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

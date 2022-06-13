import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htwms/api/api.dart';

import '../../../api/user.dart';
import '../../../core/http/http.dart';
import '../../../core/utils/sputils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 响应空白处的焦点的Node
  late bool _isShowPassWord = false;
  FocusNode blankNode = FocusNode();
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _baseUrl = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _unameController.text = "admin";
    _pwdController.text = "admin123";
    _baseUrl.text = "http://192.168.1.4:8080";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              // 点击空白页面关闭键盘
              closeKeyboard(context);
            },
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: buildForm(context),
            ),
          ),
        ),
        onWillPop: () async {
          return Future.value(false);
        });
  }

  //构建表单
  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          SPUtils.getHost() == null
              ? TextFormField(
                  autofocus: false,
                  controller: _baseUrl,
                  decoration: const InputDecoration(
                      labelText: "服务器请求地址",
                      hintText: "请输入请求服务器地址",
                      hintStyle: TextStyle(fontSize: 12),
                      icon: Icon(Icons.person)),
                  //校验用户名
                  validator: (v) {
                    return v!.trim().isNotEmpty ? null : "用户名不能为空";
                  })
              : Container(),
          TextFormField(
              autofocus: false,
              controller: _unameController,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {
                return v!.trim().isNotEmpty ? null : "用户名不能为空";
              }),
          TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: "登录密码",
                  hintText: "请输入登录密码",
                  hintStyle: const TextStyle(fontSize: 12),
                  icon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isShowPassWord
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: showPassWord)),
              obscureText: !_isShowPassWord,
              //校验密码
              validator: (v) {
                return v!.trim().length >= 6 ? null : "登录密码不能小于6位";
              }),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Builder(builder: (context) {
                  return ElevatedButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(15.0)),
                    child:
                        const Text("登录", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if (Form.of(context)!.validate()) {
                        onSubmit(context);
                      }
                    },
                  );
                })),
              ],
            ),
          )
        ],
      ),
    );
  }

  ///点击控制密码是否显示
  void showPassWord() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }

  //验证通过提交数据
  void onSubmit(BuildContext context) async {
    closeKeyboard(context);
    _baseUrl.text != "" ? SPUtils.saveHost(_baseUrl.text) : null;
    XHttp.init();
    Map<String, dynamic> params = HashMap();
    params['enterpriseName'] = "xueYi";
    params['userName'] = _unameController.text;
    params['password'] = _pwdController.text;
    await XHttp.postJson(Api.loginApi, params).then((value) {
      log(value.toString());
      if (value['code'] == 200) {
        SPUtils.saveToken(value['data']['access_token'].toString());
        if (SPUtils.isLogined()) {
          getUserinfo(context);
          Get.offNamed("/home");
        }
      }
    });
  }
}

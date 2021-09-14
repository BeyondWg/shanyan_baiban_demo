import 'dart:io';
import 'dart:ui';

import 'package:shanyan/shanyan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _method = "";
  int _code = 0;
  String _msg = "";
  String _content = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ClShanyan.getShanyanVersion()
        .then((value) => print("iOS SDK version:$value"));
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('shanyan'),
          ),
          body: Container(
            width: window.physicalSize.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Text(
                    "${_method}\n  content:${_content}",
                  ),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                ),
                MaterialButton(
                  onPressed: () {
                    //闪验日志开关
                    ClShanyan.printConsoleEnable(enable: false);
                    String appId = " ";
                    if (Platform.isAndroid) {
                      appId = "loXN4jDs";
                    }
                    //闪验初始化
                    ClShanyan.init(appId: appId).then((shanYanResult) {
                      setState(() {
                        _method = "初始化结果：";
                        _code = shanYanResult.code ?? 0;
                        _msg = shanYanResult.message ?? "";
                        _content = shanYanResult.toJson().toString();
                      });
                      print(shanYanResult.toJson().toString());
                    });
                  },
                  child: Text(
                    "初始化",
                    style: TextStyle(color: Colors.blue, fontSize: 19),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    //闪验预取号
                    ClShanyan.getPrePhoneInfo().then((shanYanResult) {
                      setState(() {
                        _method = "预取号结果：";
                        _code = shanYanResult.code ?? 0;
                        _msg = shanYanResult.message ?? "";
                        _content = shanYanResult.toJson().toString();
                      });
                      print(shanYanResult.toJson().toString());
                    });
                  },
                  child: Text(
                    "预取号",
                    style: TextStyle(color: Colors.blue, fontSize: 19),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    //闪验一键登录获取token
                    ClShanyan.openLoginAuth().then((shanYanResult) {
                      setState(() {
                        _method = "一键登录获取token结果：";
                        _code = shanYanResult.code ?? 0;
                        _msg = shanYanResult.message ?? "";
                        _content = shanYanResult.toJson().toString();
                      });
                      print(shanYanResult.toJson().toString());
                    });
                  },
                  child: Text(
                    "获取token",
                    style: TextStyle(color: Colors.blue, fontSize: 19),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    //闪验本机校验获取token
                    ClShanyan.localAuthentication().then((shanYanResult) {
                      setState(() {
                        _method = "本机号校验获取token结果";
                        _code = shanYanResult.code ?? 0;
                        _msg = shanYanResult.message ?? "";
                        _content = shanYanResult.toJson().toString();
                      });
                      print(shanYanResult.toJson().toString());
                    });
                  },
                  child: Text(
                    "本机号校验获取token",
                    style: TextStyle(color: Colors.blue, fontSize: 19),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    ClShanyan.clearScripCache();
                  },
                  child: Text(
                    "清除缓存",
                    style: TextStyle(color: Colors.blue, fontSize: 19),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

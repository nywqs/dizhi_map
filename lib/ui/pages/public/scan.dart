import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class ScanPage extends StatefulWidget {
  final Function scanCode;
  const ScanPage({Key? key, required this.scanCode}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  ScanController controller = ScanController();
  bool flashFlag = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [_scan(), _backIcon(), _title(), _hintText()],
        ),
      ),
    );
  }

  Widget _scan() {
    ///加column防止页面报错
    return Column(
      children: [
        Expanded(
            child: Container(
          child: ScanView(
            controller: controller,
            scanAreaScale: .7,
            scanLineColor: Theme.of(context).primaryColor,
            onCapture: (qrCode) {
              setState(() {
                Navigator.pop(context);
                widget.scanCode(qrCode);
              });
            },
          ),
        )),
      ],
    );
  }

  /// < 返回
  Widget _backIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 55),
      child: InkWell(
        child: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.white,
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.only(left: 165, top: 55),
      child: Text(
        '扫一扫',
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }

  Widget _hintText() {
    return const Padding(
      padding: EdgeInsets.only(left: 110, top: 555),
      child: Text(
        '将二维码放入框内，即可自动扫码',
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}

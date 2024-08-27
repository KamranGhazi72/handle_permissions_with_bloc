import 'package:flutter/material.dart';

enum WhichBtn {
  permissionBtn,
  submitAccident,
}

class ButtonComponent extends StatefulWidget {
  final VoidCallback onTapFunc;
  final WhichBtn whichBtn;
  final bool isEnableBtn;
  final double width;
  final String textBtn;
  final Color textColorBtn;


  ButtonComponent({
    super.key,
    required this.onTapFunc,
    required this.whichBtn,
    required this.isEnableBtn,
    required this.width,
    required this.textBtn,
    required this.textColorBtn,
  });

  factory ButtonComponent.permissionBtn({
    required VoidCallback onTap,
    bool isEnable = true,
    required double width,
    required String text,
    required Color textColor,
  }) =>
      ButtonComponent(
        onTapFunc: onTap,
        whichBtn: WhichBtn.permissionBtn,
        isEnableBtn: isEnable,
        width: width,
        textBtn: text,
        textColorBtn: textColor,
      );

  factory ButtonComponent.submitAccident({
    required VoidCallback onTap,
    bool isEnable = true,
    double width = double.infinity,
    required String text,
    required Color textColor,
  }) =>
      ButtonComponent(
        onTapFunc: onTap,
        whichBtn: WhichBtn.submitAccident,
        isEnableBtn: isEnable,
        width: width,
        textBtn: text,
        textColorBtn: textColor,
      );

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: widget.whichBtn == WhichBtn.permissionBtn?
      GestureDetector(
        onTap: widget.isEnableBtn ? widget.onTapFunc : null,
        child: Center(
          child: Container(
            width: widget.width,
            decoration: widget.isEnableBtn ? BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ) : BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(widget.textBtn,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ) : widget.whichBtn == WhichBtn.submitAccident ?
      GestureDetector(
        onTap: widget.isEnableBtn ? widget.onTapFunc : null,
        child: Center(
          child: Container(
            width: widget.width,
            decoration: widget.isEnableBtn ? BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ) : BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(widget.textBtn,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      )
      : Container(),
    );
  }
}

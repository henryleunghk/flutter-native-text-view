import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class NativeTextView extends StatefulWidget {
  final String text;
  final BoxDecoration? decoration;
  final TextStyle? style;
  final TextAlign textAlign;
  final int maxLines;
  final int minLines;

  const NativeTextView(
    this.text, {
    Key? key,
    this.decoration,
    this.style,
    this.textAlign = TextAlign.start,
    this.minLines = 1,
    this.maxLines = 0,
  }) : super(key: key);

  @override
  NativeTextViewState createState() => NativeTextViewState();
}

class NativeTextViewState extends State<NativeTextView> {
  late MethodChannel _channel;

  double _lineHeight = 22.0;
  double _contentHeight = 0.0;

  @override
  void initState() {
    super.initState();
  }

  void _createMethodChannel(int nativeViewId) {
    _channel = MethodChannel("flutter_native_text_view$nativeViewId")
      ..setMethodCallHandler(_onMethodCall);
    _channel.invokeMethod("getLineHeight").then((value) {
      if (value != null) {
        _lineHeight = value;
        setState(() {});
      }
    });
    _channel.invokeMethod("getContentHeight").then((value) {
      if (value != null) {
        _contentHeight = value;
        setState(() {});
      }
    });
  }

  Future<bool?> _onMethodCall(MethodCall call) async {
    throw MissingPluginException(
        "NativeTextInput._onMethodCall: No handler for ${call.method}");
  }

  double _minHeight() {
    return widget.minLines * _lineHeight + 14;
  }

  double _maxHeight() {
    if (widget.maxLines > 0) return widget.maxLines * _lineHeight + 14;
    if (_contentHeight > _minHeight()) return _contentHeight;

    return _minHeight();
  }

  Map<String, dynamic> _buildCreationParams(BoxConstraints constraints) {
    Map<String, dynamic> params = {
      "width": constraints.maxWidth,
      "text": widget.text,
      "textAlign": widget.textAlign.toString(),
      "maxLines": widget.maxLines,
    };

    if (widget.style != null && widget.style?.fontSize != null) {
      params = {
        ...params,
        "fontSize": widget.style?.fontSize,
      };
    }

    if (widget.style != null && widget.style?.fontWeight != null) {
      params = {
        ...params,
        "fontWeight": widget.style?.fontWeight.toString(),
      };
    }

    if (widget.style != null && widget.style?.color != null) {
      params = {
        ...params,
        "fontColor": {
          "red": widget.style?.color?.red,
          "green": widget.style?.color?.green,
          "blue": widget.style?.color?.blue,
          "alpha": widget.style?.color?.alpha,
        }
      };
    }

    return params;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: _minHeight(),
        maxHeight: _maxHeight(),
      ),
      child: LayoutBuilder(
        builder: (context, layout) => Container(
          decoration: widget.decoration,
          child: UiKitView(
            viewType: "flutter_native_text_view",
            creationParamsCodec: const StandardMessageCodec(),
            creationParams: _buildCreationParams(layout),
            onPlatformViewCreated: _createMethodChannel,
          ),
        ),
      ),
    );
  }
}

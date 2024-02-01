import 'package:flutter/cupertino.dart';

import '../../utils/mediaQuerysCustom.dart';

class ContainerScroll extends StatefulWidget {

  late EdgeInsets? marginEdgeInsets;
  late EdgeInsets? paddingEdgeInsets;
  late EdgeInsets? paddingEdgeInsetsScroll;
  late bool expanded;
  late bool sizeAuto;
  Widget child;

  ContainerScroll({
    Key? key,
    required this.child,
    this.marginEdgeInsets,
    this.paddingEdgeInsets,
    this.paddingEdgeInsetsScroll,
    this.sizeAuto = false,
    this.expanded = true}) : super(key: key);

  @override
  State<ContainerScroll> createState() => _ContainerScrollState();
}

class _ContainerScrollState extends State<ContainerScroll> {
  @override
  Widget build(BuildContext context) {

    var sizeScream = MediaQueryCustom(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: widget.marginEdgeInsets??EdgeInsets.only(),
      padding: widget.paddingEdgeInsets??EdgeInsets.only(),
      child: SingleChildScrollView(
        padding: widget.paddingEdgeInsetsScroll??EdgeInsets.only(),
        child: (widget.expanded)?
          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: widget.sizeAuto?sizeScream.heightScreen():sizeScream.verticalHeightScreem()),
              child: widget.child
          ):widget.child
        ),
      );
  }
}

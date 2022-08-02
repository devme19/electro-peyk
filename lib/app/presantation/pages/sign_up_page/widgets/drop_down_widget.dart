import 'package:electro_peyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget extends StatefulWidget {
  final List<CustDropdownMenuItem> items;
  final Function onChanged;
  final String hintText;
  final double borderRadius;
  final double maxListHeight;
  final double borderWidth;
  final int defaultSelectedIndex;
  final bool enabled;

  const DropDownWidget(
      {required this.items,
        required this.onChanged,
        this.hintText = "",
        this.borderRadius = 0,
        this.borderWidth = 1,
        this.maxListHeight = 100,
        this.defaultSelectedIndex = -1,
        Key? key,
        this.enabled = true})
      : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget>
    with WidgetsBindingObserver ,TickerProviderStateMixin{
  bool _isOpen = false, _isAnyItemSelected = false, _isReverse = false;
  late OverlayEntry _overlayEntry;
  late RenderBox? _renderBox;
  late Offset dropDownOffset;
  final LayerLink _layerLink = LayerLink();
  int? selectedIndex;
  Animation<double>? animation;
  AnimationController? _controller ;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          dropDownOffset = getOffset();
        });
      }
      if (widget.defaultSelectedIndex > -1) {
        if (widget.defaultSelectedIndex < widget.items.length) {
          if (mounted) {
            setState(() {
              _isAnyItemSelected = true;
              selectedIndex = widget.defaultSelectedIndex;
              // _itemSelected = widget.items[widget.defaultSelectedIndex];
              widget.onChanged(widget.items[widget.defaultSelectedIndex].value);
            });
          }
        }
      }
    });
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    super.initState();
  }

  void _addOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = true;
      });
    }

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)!.insert(_overlayEntry);
  }

  void _removeOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = false;
      });
      _overlayEntry.remove();
    }
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    _renderBox = context.findRenderObject() as RenderBox?;

    var size = _renderBox!.size;

    dropDownOffset = getOffset();

    return OverlayEntry(
        maintainState: false,
        builder: (context) => Align(
          alignment: Alignment.center,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: dropDownOffset,
            child: SizedBox(
              height: widget.maxListHeight,
              width: size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: _isReverse
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: widget.maxListHeight,
                        maxWidth: size.width),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius),
                      ),
                      child: Material(
                        elevation: 0,
                        shadowColor: Colors.grey,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: buildList()
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  onTap(int i){
    selectedIndex = i;
    _isAnyItemSelected = true;
    _removeOverlay();
    widget.onChanged(i);
  }
  List<Widget> buildList(){
    List<Widget> list=[];
    int i=0;
    for(CustDropdownMenuItem item in widget.items){
      list.add(CustDropdownMenuItem(title: item.title,value: item.value,index: i,selectedIndex: selectedIndex,onTap: onTap,));
      i++;
    }
    return list;
  }
  Offset getOffset() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    double y = renderBox!.localToGlobal(Offset.zero).dy;
    double spaceAvailable = _getAvailableSpace(y + renderBox.size.height);
    if (spaceAvailable > widget.maxListHeight) {
      _isReverse = false;
      print(_isReverse);
      return Offset(0, renderBox.size.height);
    } else {
      _isReverse = true;
      print(_isReverse);
      return Offset(
          0,
          renderBox.size.height -
              (widget.maxListHeight + renderBox.size.height));
    }
  }

  double _getAvailableSpace(double offsetY) {
    double safePaddingTop = MediaQuery.of(context).padding.top;
    double safePaddingBottom = MediaQuery.of(context).padding.bottom;

    double screenHeight =
        MediaQuery.of(context).size.height - safePaddingBottom - safePaddingTop;

    return screenHeight - offsetY;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: widget.enabled
            ? () {
          if(_isOpen){
            _removeOverlay();
            _controller!.reverse();
          }else{
            _addOverlay();
            _controller!.forward();
          }
        }
            : null,
        child: Container(
          decoration: _getDecoration(),
          child: 
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    _isAnyItemSelected
                        ? Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _isOpen
                                    ? IColor().LIGHT_Button_COLOR
                                    : Colors.white),
                            child: Center(child: Text(widget.items[selectedIndex!].title!,style: TextStyle(color: Color(0xff1F1F24)))))
                        : Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: _isOpen
                                ? IColor().LIGHT_Button_COLOR
                                : Colors.white),
                        child: Center(child: Text(widget.hintText,style: TextStyle(color: Color(0xff1F1F24).withOpacity(0.5)),))),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: RotationTransition(
                            turns: Tween(begin: _isReverse?0.0:1.0, end: _isReverse?1.0:0.0).animate(_controller!),
                            child: Icon(Icons.arrow_drop_down,color: Get.theme.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Decoration? _getDecoration() {
    if (_isOpen && !_isReverse) {
      return BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.borderRadius),
              topRight: Radius.circular(
                widget.borderRadius,
              )));
    } else if (_isOpen && _isReverse) {
      return BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(widget.borderRadius),
              bottomRight: Radius.circular(
                widget.borderRadius,
              )));
    } else if (!_isOpen) {
      return BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)));
    }
  }
}

class CustDropdownMenuItem extends StatelessWidget {
  String? value;
  String? title;
  int? index;
  int? selectedIndex;
  ValueChanged<int>? onTap;

   CustDropdownMenuItem({this.value, this.title,this.index,this.selectedIndex,this.onTap});

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: ()=>onTap!(index!),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child:
            Container(
              alignment: Alignment.center,
              color: Colors.transparent,
                height: 70,
                child: Text(title!,style: TextStyle(color: index == selectedIndex?Get.theme.primaryColor:Colors.black54,fontSize: 14),textAlign: TextAlign.center,))),
          ],
        ),
      );
  }
}

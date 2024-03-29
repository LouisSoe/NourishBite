import 'package:flutter/material.dart';
import 'package:select_card/enums/image_source_type_enum.dart';

///This widget represents a card group, it includes lists for its use. It has to
/// get the list of headers by necessity, the lists of contents and images can
/// be provided optionally. With this widget, you can move forward by choosing
/// one among many groups. It will add animated visual beauty to your
/// application.
// ignore: must_be_immutable
class SelectGroupCard extends StatefulWidget {
  BuildContext context;
  ImageSourceType?
      imageSourceType; //fotoğrafların assetlerden yada networkten mi belirler
  Function onTap;
  double radius; //kartların köşe radiusları
  Color contentTextColor; // content rengi
  Color titleTextColor; //title rengi
  Color cardBackgroundColor;
  Color cardSelectedColor;
  Duration duration; // animasyonların hareket süresi
  List<String> titles = [];
  List<String?>? ids = [];
  List<String?>? contents = []; //opsiyonel content listesi
  List<String?>? images = []; //opsiyonel image listesi
  SelectGroupCard(this.context,
      {required this.titles,
      required this.onTap,
      this.ids,
      this.contents,
      this.imageSourceType,
      this.images,
      this.radius = 10,
      this.contentTextColor = const Color(0xff003087),
      this.titleTextColor = const Color(0xff003087),
      this.cardBackgroundColor = const Color(0xffCCd6E7),
      this.cardSelectedColor = const Color(0xff003087),
      this.duration = const Duration(milliseconds: 100),
      Key? key})
      : super(key: key);

  @override
  State<SelectGroupCard> createState() => _SelectGroupCardState();
}

class _SelectGroupCardState extends State<SelectGroupCard>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _sizeController;
  Animation? _colorAnimation;

  bool isSelected = false;
  String selectedName = "";

  @override
  void initState() {
    super.initState();
    //-------AnimationControllers---------------------
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _sizeController = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.3,
    );
    // ------Animations--------------------
    _colorAnimation = ColorTween(
            begin: widget.cardBackgroundColor, end: widget.cardSelectedColor)
        .animate(_controller!);

    _controller!.addListener(() {
      // print(_controller!.value);
      // print(_colorAnimation!.value);
      // print(_sizeController!.value);
    });

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isSelected = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isSelected = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
    _sizeController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145, // height of widget
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _controller!,
              builder: (BuildContext context, _) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 17, 10, 17),
                  child: GestureDetector(
                    onTap: () {
                      if (isSelected) {
                        _controller!.reverse();
                        _sizeController!.reverse().then((value) {
                          // Önce seçili olanı animate ettirip eski pozisyonuna getirir. ardından yeni seçileni animete ettirir.
                          selectedName = widget.titles[index];
                          _controller!.forward();
                          _sizeController!.forward();
                          return null;
                        });
                      } else {
                        selectedName = widget.titles[index];
                        _controller!.forward();
                        _sizeController!.forward();
                      }
                      try {
                        if (widget.ids != null && widget.ids!.isNotEmpty) {
                          widget.onTap(
                              widget.titles[index], widget.ids![index]);
                        } else {
                          widget.onTap(widget.titles[index]);
                        }
                      } catch (e) {
                        widget.onTap(widget.titles[index]);
                      }
                    },
                    child: selectedName == widget.titles[index]
                        ? ScaleTransition(
                            //boyutlandırma animasyonu
                            scale: _sizeController!,
                            child: Container(
                              width: 90,
                              decoration: BoxDecoration(
                                  color: _colorAnimation!
                                      .value, //renk değişimi için animasyon verisi
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(widget.radius))),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: widget.cardBackgroundColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(widget.radius - 2),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (widget.images != null &&
                                          widget.images!.length ==
                                              widget.titles.length)
                                        if (widget.images![index] != null)
                                          buildImage(index),
                                      buildSelectedTitle(index),
                                      if (widget.contents != null &&
                                          widget.contents!.length ==
                                              widget.titles.length)
                                        if (widget.contents![index] != null)
                                          buildSelectedContent(index),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: widget.cardBackgroundColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(widget.radius))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (widget.images != null &&
                                    widget.images!.length ==
                                        widget.titles.length)
                                  if (widget.images![index] != null)
                                    buildImage(index),
                                buildTitle(index),
                              ],
                            )),
                  ),
                );
              },
            );
          }),
    );
  }

  /// Fonksiyon - seçilmiş içeriği görüntüler
  Center buildSelectedContent(int index) {
    // seçilmiş Content içeriği
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 0, 6, 2),
        child: Text(
          widget.contents![index]!,
          style: TextStyle(
            color: widget.contentTextColor,
            fontSize: 8,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
    );
  }

  /// Fonksiyon - seçilmiş title görüntüler
  Center buildSelectedTitle(int index) {
    // seçilmiş title içeriği
    return Center(
      child: Text(
        widget.titles[index],
        style: TextStyle(
          color: widget.titleTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
      ),
    );
  }

  /// Fonksiyon - title görüntüler
  Center buildTitle(int index) {
    // title içeriği
    return Center(
        child: Text(
      widget.titles[index],
      style: TextStyle(
        color: widget.titleTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
      maxLines: 4,
    ));
  }

  /// Fonksiyon - image görüntüler
  Center buildImage(int index) {
    // varsa görsel içeriği
    return Center(
      child: widget.imageSourceType == ImageSourceType.network
          ? buildNetworkImage(index)
          : buildAssetImage(index),
    );
  }

  /// Fonksiyon - network image görüntüler
  Image buildNetworkImage(int index) {
    // görselin networkten görüntülenmesi sağlanır
    return Image.network(
      widget.images![index]!,
      height: 45,
      width: 45,
    );
  }

  /// Fonksiyon - asset image görüntüler
  Image buildAssetImage(int index) {
    // görselin assetlerden görüntülenmesi sağlanır
    return Image.asset(
      widget.images![index]!,
      height: 45,
      width: 45,
    );
  }
}

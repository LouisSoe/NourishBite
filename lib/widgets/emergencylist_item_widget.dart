import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';
// import 'emergencychip1_item_widget.dart';
import 'package:NourishBite/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class EmergencylistItemWidget extends StatelessWidget {
  final String judul;
  final String image_cover;
  final List<dynamic> type;
  const EmergencylistItemWidget(this.judul, this.image_cover, this.type,
      {Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 287,
          height: 302,
          child: Stack(
            children: [
              Positioned(
                left: 1,
                top: 0,
                child: Container(
                  width: 286,
                  height: 302,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1,
                top: 0,
                child: Container(
                  width: 286,
                  height: 175,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          image_cover), // Replace with your image path
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 287,
                  height: 175,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.00, 1.00),
                      end: Alignment(0, -1),
                      colors: [Colors.black, Colors.black.withOpacity(0)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 12,
                top: 108,
                child: SizedBox(
                  width: 230,
                  child: Text(
                    judul,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 242,
                top: 13,
                child: Container(
                  width: 31,
                  height: 31,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 3.88, vertical: 2.58),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 180,
                child: Container(
                  width: 73,
                  height: 17,
                  decoration: ShapeDecoration(
                    color: Color(0xFF163020),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                left: 12,
                top: 180,
                child: Text(
                  'Emergency',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 87,
                top: 180,
                child: Container(
                  width: 59,
                  height: 17,
                  decoration: ShapeDecoration(
                    color: Color(0xFF163020),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                left: 91,
                top: 180,
                child: Text(
                  'Nutrition',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 71,
                top: 265,
                child: Text(
                  'Distribution',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 12,
                top: 268,
                child: Container(
                  width: 267,
                  height: 25,
                  child: CustomElevatedButton(
                    text: "Donate Now",
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.pilihdonasi),
                    buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 45, 100, 66)),
                    ),
                    buttonTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15.h),
                  ),
                ),
              ),
              Positioned(
                left: 54,
                top: 204,
                child: Text(
                  '45,000',
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 94,
                top: 204,
                child: Text(
                  'donated',
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top: 227,
                child: Text(
                  'Meals been Shared',
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top: 245,
                child: Text(
                  '2,402,290',
                  style: TextStyle(
                    color: Color(0xFF2E2B2B),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 202,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/17x17"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 202,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/17x17"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 202,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/17x17"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top: 202,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/17x17"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

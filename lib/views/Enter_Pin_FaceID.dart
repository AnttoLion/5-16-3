import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TA1EnterPinFaceID extends StatelessWidget {
  TA1EnterPinFaceID({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00458d),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: -204.0),
            Pin(size: 123.0, start: 0.0),
            child:
                // Adobe XD layer: 'top' (group)
                Stack(
              children: <Widget>[
                Container(),
                Pinned.fromPins(
                  Pin(size: 279.0, start: 75.0),
                  Pin(size: 43.0, end: 0.0),
                  child: Text(
                    'Enter passcode',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 35,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.14,
                      fontWeight: FontWeight.w600,
                      height: 0.7428571428571429,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 80.0, start: 0.0),
            child:
                // Adobe XD layer: 'Device top' (group)
                Stack(
              children: <Widget>[
                Container(),
                Container(),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 291.0, middle: 0.5109),
            Pin(size: 639.0, end: 70.0),
            child:
                // Adobe XD layer: 'content' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 13.0, end: 16.0),
                  Pin(size: 84.0, start: 0.0),
                  child:
                      // Adobe XD layer: 'Field' (unknown element)
                      SingleChildScrollView(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 11,
                      runSpacing: 20,
                      children: [{}, {}, {}, {}].map((itemData) {
                        return SizedBox(
                          width: 57.0,
                          height: 81.0,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromPins(
                                Pin(start: 0.0, end: 0.0),
                                Pin(start: 0.0, end: 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: const Color(0xffe1e6ff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 340.0, middle: 0.5753),
                  child:
                      // Adobe XD layer: 'Number' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 70.0, start: 0.0),
                        Pin(size: 70.0, start: 0.0),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, start: 0.0),
                        Pin(size: 70.0, middle: 0.3333),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, middle: 0.5023),
                        Pin(size: 70.0, start: 0.0),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, middle: 0.5023),
                        Pin(size: 70.0, middle: 0.3333),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, end: 0.0),
                        Pin(size: 70.0, start: 0.0),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, end: 0.0),
                        Pin(size: 70.0, middle: 0.3333),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, start: 0.0),
                        Pin(size: 70.0, middle: 0.6667),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, middle: 0.5023),
                        Pin(size: 70.0, middle: 0.6667),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, middle: 0.5023),
                        Pin(size: 70.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, end: 0.0),
                        Pin(size: 70.0, middle: 0.6667),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x339599b3),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 70.0, end: 0.0),
                        Pin(size: 70.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            SvgPicture.string(
                          _svg_bqflvv,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.0945, endFraction: 0.8574),
                        Pin(size: 49.0, middle: 0.0378),
                        child:
                            // Adobe XD layer: '1' (text)
                            Text(
                          '1',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.0739, endFraction: 0.8368),
                        Pin(size: 49.0, middle: 0.3471),
                        child:
                            // Adobe XD layer: '4' (text)
                            Text(
                          '4',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.4622, endFraction: 0.4622),
                        Pin(size: 49.0, middle: 0.0378),
                        child:
                            // Adobe XD layer: '2' (text)
                            Text(
                          '2',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.4622, endFraction: 0.4622),
                        Pin(size: 49.0, middle: 0.3471),
                        child:
                            // Adobe XD layer: '5' (text)
                            Text(
                          '5',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.8402, endFraction: 0.0842),
                        Pin(size: 49.0, middle: 0.0378),
                        child:
                            // Adobe XD layer: '3' (text)
                            Text(
                          '3',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.8368, endFraction: 0.0808),
                        Pin(size: 49.0, middle: 0.3471),
                        child:
                            // Adobe XD layer: '6' (text)
                            Text(
                          '6',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.0773, endFraction: 0.8402),
                        Pin(size: 49.0, middle: 0.6564),
                        child:
                            // Adobe XD layer: '7' (text)
                            Text(
                          '7',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.4553, endFraction: 0.4553),
                        Pin(size: 49.0, middle: 0.6564),
                        child:
                            // Adobe XD layer: '8' (text)
                            Text(
                          '8',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.4553, endFraction: 0.4553),
                        Pin(size: 49.0, middle: 0.9656),
                        child:
                            // Adobe XD layer: '0' (text)
                            Text(
                          '0',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(startFraction: 0.8368, endFraction: 0.0808),
                        Pin(size: 49.0, middle: 0.6564),
                        child:
                            // Adobe XD layer: '9' (text)
                            Text(
                          '9',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            color: const Color(0xffffffff),
                            letterSpacing: -1,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, end: 24.5),
                        Pin(size: 16.0, end: 26.5),
                        child:
                            // Adobe XD layer: 'delete' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child: SvgPicture.string(
                                _svg_53qqcs,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 6.0, middle: 0.6875),
                              Pin(size: 6.0, middle: 0.5),
                              child: SvgPicture.string(
                                _svg_6b97o0,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 6.0, middle: 0.6875),
                              Pin(size: 6.0, middle: 0.5),
                              child: SvgPicture.string(
                                _svg_mod1xs,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(startFraction: 0.0172, endFraction: 0.0241),
                  Pin(size: 17.0, middle: 0.9148),
                  child:
                      // Adobe XD layer: 'Resend code' (text)
                      Text(
                    'Forgot/Reset passcode?',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0x8fffffff),
                      letterSpacing: -0.1999999942779541,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(startFraction: 0.0172, endFraction: 0.0241),
                  Pin(size: 17.0, middle: 1.0),
                  child:
                      // Adobe XD layer: 'Resend code' (text)
                      Text(
                    'Not yet registered? Click here',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0x8fffffff),
                      letterSpacing: -0.1999999942779541,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 68.0, middle: 0.1944),
            Pin(size: 68.0, middle: 0.7704),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_bqflvv =
    '<svg viewBox="232.0 289.0 70.0 70.0" ><path transform="translate(232.0, 289.0)" d="M 35 0 C 54.32996368408203 0 70 15.67003440856934 70 35 C 70 54.32996368408203 54.32996368408203 70 35 70 C 15.67003440856934 70 0 54.32996368408203 0 35 C 0 15.67003440856934 15.67003440856934 0 35 0 Z" fill="#9599b3" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-opacity="0.2" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_53qqcs =
    '<svg viewBox="1.0 4.0 22.0 16.0" ><path  d="M 21 4 L 8 4 L 1 12 L 8 20 L 21 20 C 22.10457038879395 20 23 19.10456848144531 23 18 L 23 6 C 23 4.895430564880371 22.10456848144531 4 21 4 Z" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_6b97o0 =
    '<svg viewBox="12.0 9.0 6.0 6.0" ><path transform="translate(12.0, 9.0)" d="M 6 0 L 0 6" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_mod1xs =
    '<svg viewBox="12.0 9.0 6.0 6.0" ><path transform="translate(12.0, 9.0)" d="M 0 0 L 6 6" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';

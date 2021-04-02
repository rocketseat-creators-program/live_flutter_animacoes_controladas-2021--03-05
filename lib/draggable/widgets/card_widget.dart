import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:live_animacoes_controladas/draggable/models/card_model.dart';

class CardWidget extends StatefulWidget {
  final CardModel card;
  CardWidget({
    Key key,
    @required this.card,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 12, bottom: 16),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(8),
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.card.title,
                    style: TextStyle(color: Color(0xFF192A4D)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.paperclip,
                        color: Color(0xFF6B788C),
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

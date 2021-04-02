import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:live_animacoes_controladas/draggable/models/card_model.dart';

class AddAnotherCardWidget extends StatefulWidget {
  final ValueChanged<CardModel> onChange;
  AddAnotherCardWidget({
    Key key,
    @required this.onChange,
  }) : super(key: key);

  @override
  _AddAnotherCardWidgetState createState() => _AddAnotherCardWidgetState();
}

class _AddAnotherCardWidgetState extends State<AddAnotherCardWidget> {
  bool _editMode = false;
  CardModel cardModel = CardModel();
  get _addAnotherCard => ListTile(
        leading: Icon(Icons.add),
        title: Text("Add another card"),
        onTap: () {
          _editMode = true;
          setState(() {});
        },
      );

  get _insertNewCard => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    cardModel = cardModel.copyWith(title: value);
                  },
                  style: TextStyle(fontSize: 16, color: Color(0xFF192A4D)),
                  maxLines: null,
                  cursorColor: Color(0xFF192A4D),
                  cursorWidth: 1,
                  minLines: 3,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    child: Text("Add Card"),
                    onPressed: () {
                      widget.onChange(cardModel);
                      _editMode = false;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(primary: Color(0xFF60BD4E)),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Color(0xFF192A4D),
                    ),
                    onPressed: () {
                      _editMode = false;
                      setState(() {});
                    }),
                Expanded(child: Container()),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.ellipsisH,
                      size: 14,
                      color: Color(0xFF192A4D),
                    ),
                    onPressed: () {})
              ],
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    if (_editMode) {
      return _insertNewCard;
    } else {
      return _addAnotherCard;
    }
  }
}

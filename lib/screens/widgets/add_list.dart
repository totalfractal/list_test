import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  final bool isAdd;
  const AddList({
    required this.isAdd,
    Key? key,
  }) : super(key: key);

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final listToShow = List.generate(6, (index) => index.toString());
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: 5,
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(listToShow[index],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      )),
                  
                ],
              ),
            );
          },
        ),
        if (widget.isAdd) ...[
          if (listToShow.isNotEmpty) const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onEditingComplete: () {
                      listToShow.add(controller.text);
                      controller.clear();
                      //onDeleteAdd();
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'dfdsf',
                    ),
                  ),
                ),
                /* GestureDetector(
                  onTap: onDeleteAdd,
                  child: const Icon(Icons.cancel, size: 25, color: MyColors.red),
                ), */
              ],
            ),
          ),
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../../provider/search_provider.dart';
import '../search_screens.dart';


class Search extends ConsumerWidget {
  Search({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);
    ref.listen(searchProvider, (previous, next) {
      if(searchState.status == SearchStatus.Success){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
      }
    });
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(color: Color(0xFFBEBDBDFF), blurRadius: 4.0, spreadRadius: 0.1)
          ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: EdgeInsets.only(left: 10),
          child: Stack(
              children: [
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    initialValue: searchState.keyword.toString(),
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 0,left: 10, right: 10, bottom: 0),
                        hintText: 'Tìm kiếm...',
                        hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                        border: InputBorder.none,
                    ),
                    onChanged: (String val) {
                      ref.read(searchProvider.notifier).onKeywordChange(val);
                    },
                  ),
                ),
                Positioned(
                    right: 12,
                    top: 12,
                    child: GestureDetector(
                        onTap: (){
                          if(searchState.keyword == '') {
                            Dialogs.materialDialog(
                                context: context,
                                color: Colors.white,
                                title: 'Vui lòng nhập từ khoá tìm kiếm!',
                                actions: [
                                  IconsButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    text: 'Ok',
                                    iconData: Icons.check,
                                    color: Color(0xFFFB9116),
                                    textStyle: const TextStyle(color: Colors.white),
                                    iconColor: Colors.white,
                                  )
                                ]);
                          }else{
                            ref.read(searchProvider.notifier).SearchSubmit();
                          }
                        },
                        child: const Icon(Icons.search, color: Colors.black, size: 25,)
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}
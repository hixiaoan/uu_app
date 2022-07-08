
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'author_header_page.dart';
import 'author_item_page.dart';
import '../model/video_detail_model.dart';

// ignore: must_be_immutable
class AuthorPage extends StatefulWidget {


  final VideoDetaiModel detailModel;
   Function(String videoId)? onTap;
  AuthorPage({Key? key, required this.detailModel,this.onTap}) : super(key: key);

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: GroupListView(
        sectionsCount: 1,
        countOfItemInSection: (int section) {
          return  widget.detailModel.videoList.length;
        },
        itemBuilder: (BuildContext context, IndexPath index) {
          return InkWell(
            onTap: (){
              if (widget.onTap != null){
                widget.onTap!(widget.detailModel.videoList[index.index].vid!);
              }
            },
              child: ItmePage(videoInfo: widget.detailModel.videoList[index.index]));
        },
        groupHeaderBuilder: (BuildContext context, int section) {
          return section == 0? AuthorHeaderPage(videoInfo: widget.detailModel.videoInfo):Container();
        },
        separatorBuilder: (_,inexPath){
          if (inexPath.index == widget.detailModel.videoList.length -1){
            return Container();
          }
          return Container(height: 0.5,color: Colors.grey[400],);
        },

      )
      );
  }




}

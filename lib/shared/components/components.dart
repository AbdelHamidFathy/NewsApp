import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget buildArticleItem(article, context,){
  return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            navigateTo(screen: WebViewScreen(article['url']),context: context,);
          },
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:NetworkImage('${article['urlToImage']}'), 
                      
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0,left: 8.0),
                  child: Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

Widget articleBuilder(list, context,{isSearch =false}){
  return ConditionalBuilder(
      condition: list.length>0,
      builder: (context) =>ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index)=>buildArticleItem(list[index],context), 
        separatorBuilder: (context, index){
          return divider();
        }, 
        itemCount: 10,
      ),
      fallback: (context)=>isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );
}

Widget divider(){
  return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
          );
}

Widget textFormFieldBuilder({
  required bool isDark,
  required TextEditingController controller,
  Function(String)? onChanged,
  required TextInputType type,
  IconData? prefixIcon,
  String? labelTxt,
  String? hintTxt
}){
  return TextFormField(
    cursorColor: isDark ? Colors.white : Colors.black,
    cursorWidth: 0.5,
    controller: controller,
    onChanged: onChanged,
    keyboardType: type,
    style: TextStyle(
      color: isDark ? Colors.white : Colors.black,
    ),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 1.0,),
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
      ),
      prefixIcon: Icon(
        prefixIcon,
        color: isDark ? Colors.white : Colors.black,
      ),
      labelText: labelTxt,
      hintText: hintTxt,
      hintStyle: TextStyle(
        color: isDark ? Colors.white : Colors.grey,
      ),
    ),
  );
}

void navigateTo({
  required Widget screen,
  context,
}){ 
  Navigator.push(
    context, 
    MaterialPageRoute(builder: (context)=>screen),
  );
}

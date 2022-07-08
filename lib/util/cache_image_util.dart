

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget CacheNetImage({
  Widget? placeholder,
  required String url,
   double? width ,
   double? height,
  BoxFit fit = BoxFit.cover}){
  return CachedNetworkImage(
    imageUrl: url,
    height: height,
    width: width,
    fit: fit,
    placeholder: (context,placeholderUrl){
      if (placeholder ==null) return Container(color: Colors.grey[200],);
      return placeholder;
    },
    errorWidget: (context,errorUrl,dynamic error)=> const Icon(Icons.error),
  );
}
# uu_app

模仿多媒体app

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 项目结构

| common    
|----------|--------|
| app_router| 路由配置     |
| bindings  | 懒加载的依赖  |
| controller| 页面的依赖    |
| http_dao  | 页面的请求工具 |
| Language  | 多语言配置    |
| request   | 网络请求配置   |
| services  | 常用服务      |
| store     | 全局状态      |
| utils     | 常用工具      |
| widgets   | ui组件      |

| pages    
|----------|--------|
| banner_detial | banner详情页面  |
| favorite      | 收藏页面        |
| home          | 首页           |
| launch        | 启动页面        |
| login         | 登录与注册页面   |
| ranking       | 排行榜页面      |
| main          | 主页面         |
| mine          | 个人中心页面    |
| video_detail  | 视频详情页面    |

|pages 文件结构
| index | 文件的索引文件 |
| view  | 视图         |

 

## 运行
```shell
$ flutter pub get
$ cd ios
$ pod install --repo-update

$ vscode 用户设置中搜索“Flutter run additional args“ 添加 
$ Android Studio中：“编辑配置”→“--no-sound-null-safety”
```
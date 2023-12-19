import 'package:flutter/material.dart';

ThemeData coolTonedDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple[800], // 深紫色作为主色调
  primarySwatch: Colors.deepPurple, // 使用深紫色的色板
  scaffoldBackgroundColor: const Color(0xFF121212), // 暗灰色背景
  canvasColor: const Color(0xFF1E1E1E), // 暗色画布
  cardColor: const Color(0xFF292929), // 暗色卡片背景
  dividerColor: Colors.grey[600], // 分割线颜色
  focusColor: Colors.blueAccent, // 焦点颜色
  hintColor: Colors.white38, // 提示文字颜色
  highlightColor: Colors.blueAccent, // 高亮颜色
  hoverColor: Colors.blue[700], // 悬停颜色
  indicatorColor: Colors.blueAccent, // 指示器颜色
  secondaryHeaderColor: Colors.deepPurple[700], // 次要头部颜色
  colorScheme: const ColorScheme.dark(
    primary: Colors.deepPurple,
    secondary: Colors.blueAccent,
    surface: Color(0xFF1E1E1E),
    background: Color(0xFF121212),
    error: Colors.redAccent,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.deepPurple[800],
    elevation: 4,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepPurple,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white60),
    titleMedium: TextStyle(color: Colors.white60),
    titleLarge: TextStyle(color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide:
          BorderSide(color: Colors.blueAccent[200] ?? Colors.blueAccent),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
  // 其他widget的主题设置可以按需添加
);

ThemeData coolTonedDarkTheme_2 = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple[700], // 深紫色作为主色调，略微减少饱和度
  primarySwatch: Colors.deepPurple, // 使用深紫色的色板
  scaffoldBackgroundColor: const Color(0xFF121212), // 暗灰色背景
  canvasColor: const Color(0xFF1E1E1E), // 暗色画布
  cardColor: const Color(0xFF292929), // 暗色卡片背景
  dividerColor: Colors.grey[600], // 分割线颜色，使用更柔和的灰色
  focusColor: Colors.blueAccent[100], // 焦点颜色，减少饱和度
  hintColor: Colors.white24, // 提示文字颜色
  highlightColor: Colors.blueAccent[100], // 高亮颜色
  hoverColor: Colors.blue[600], // 悬停颜色
  indicatorColor: Colors.blueAccent[100], // 指示器颜色
  secondaryHeaderColor: Colors.deepPurple[600], // 次要头部颜色
  colorScheme: ColorScheme.dark(
    primary: Colors.deepPurple[700] ?? Colors.deepPurple,
    secondary: Colors.blueAccent[100] ?? Colors.blueAccent,
    surface: const Color(0xFF1E1E1E),
    background: const Color(0xFF121212),
    error: Colors.redAccent,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.deepPurple[700],
    elevation: 4,
    iconTheme: IconThemeData(color: Colors.grey[500] ?? Colors.grey),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepPurple[700] ?? Colors.deepPurple,
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: IconThemeData(
    color: Colors.grey[500],
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide:
          BorderSide(color: Colors.blueAccent[100] ?? Colors.blueAccent),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[600] ?? Colors.grey),
    ),
  ),
  // 其他widget的主题设置可以按需添加
);

ThemeData coolTonedDarkTheme3 = ThemeData(
  // brightness: Brightness.light,
  primaryColor: Colors.teal[800], // 改为青色调
  primarySwatch: Colors.teal, // 使用青色调的色板
  scaffoldBackgroundColor: const Color(0xFF121212),
  canvasColor: const Color(0xFF1E1E1E),
  cardColor: const Color(0xFF292929),
  dividerColor: Colors.grey,
  focusColor: Colors.cyanAccent, // 调整为青色调
  hintColor: Colors.white38,
  highlightColor: Colors.cyanAccent, // 调整为青色调
  hoverColor: Colors.teal[700], // 调整为青色调
  indicatorColor: Colors.cyanAccent, // 调整为青色调
  secondaryHeaderColor: Colors.teal[700], // 调整为青色调
  colorScheme: const ColorScheme.dark(
    primary: Colors.teal, // 调整为青色调
    secondary: Colors.cyanAccent,
    surface: Color(0xFF1E1E1E),
    background: Color(0xFF121212),
    error: Colors.redAccent,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.teal[800], // 调整为青色调
    elevation: 4,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.teal, // 调整为青色调
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.cyanAccent), // 调整为青色调
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.teal[800], // 设置底部导航栏的背景颜色
    selectedItemColor: Colors.cyanAccent, // 设置选中项的颜色
    unselectedItemColor: Colors.teal[300], // 设置未选中项的颜色
    showUnselectedLabels: true,
  ),
  // 其他widget的主题设置可以按需添加
);

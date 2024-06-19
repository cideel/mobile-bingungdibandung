import 'package:bingung_di_bandung/Bottom%20Navigation%20Bar/bottomNav.dart';
import 'package:bingung_di_bandung/DetailPlace/detail.dart';
import 'package:bingung_di_bandung/Explore/explore.dart';
import 'package:bingung_di_bandung/Favorite/favorite.dart';
import 'package:bingung_di_bandung/History/history.dart';
import 'package:bingung_di_bandung/Home/home.dart';
import 'package:bingung_di_bandung/Profile/createPlace.dart';
import 'package:bingung_di_bandung/Profile/editProfil.dart';
import 'package:bingung_di_bandung/Profile/profile.dart';
import 'package:bingung_di_bandung/SearchPage/search.dart';
import 'package:bingung_di_bandung/Sign%20Up/signUp.dart';
import 'package:bingung_di_bandung/features/Login/presentation/pages/login.dart';
import 'package:bingung_di_bandung/splash_screen.dart';
import 'package:get/get.dart';

class MyPage{
  static final pages  = [
    GetPage(name: login, page: ()=> Login()),
    GetPage(name: splashScren, page: ()=> Splash_Screen()),
    GetPage(name: home, page: ()=> Home()),
    GetPage(name: profil, page: ()=> Profile()),
    GetPage(name: history, page: ()=>History()),
    GetPage(name: favorit, page: ()=>Favorite()),
    GetPage(name: explore, page: ()=>Explore()),
    GetPage(name: navbar, page: ()=> NavBarBot()),
    GetPage(name: signUp, page: ()=>SignUp()),
    GetPage(name: searchPage, page: ()=>SearchPage()),
    GetPage(name: detailPlace, page: ()=>Detail()),
    GetPage(name: editPage, page: ()=>EditProfil()),
    GetPage(name: createPage, page: ()=>CreatePlace())


    

  ];

  static getnavbar()=> NavBarBot();
  static getlogin() => Login();
  static gethome() => Home();
  static getprofil() => Profile();
  static gethistory() => History();
  static getfavorit() => Favorite();
  static getexplore() => Explore();
  static getsplash() => Splash_Screen();
  static getSign() => SignUp();
  static getSearch() => SearchPage();
  static getDetail() => Detail();
  static getEdit() => EditProfil();
  static getCreate() => CreatePlace();


  static String splashScren = '/splashCreen';
  static String login = '/loginPage';
  static String home = '/homePage';
  static String profil = '/profilPage';
  static String history = '/historyPage';
  static String favorit = '/favoritePage';
  static String explore = '/explorePage';
  static String signUp =  '/signPage';
  static String searchPage = '/searchPage';
  static String detailPlace = '/detailPlace';
  static String commentPage = '/commentPage';
  static String editPage = '/editPage';
  static String createPage = '/createPage';
  static String navbar = '/';

}
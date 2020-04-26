package com.playata.application.assets
{
   import com.playata.framework.assets.Assets;
   import com.playata.framework.display.Sprite;
   
   public class AppAssetUtil
   {
       
      
      public function AppAssetUtil()
      {
         super();
      }
      
      public static function setLocaleFlag(param1:String, param2:Sprite) : void
      {
         param2.setUriSprite(Assets.assetURL("flags/" + param1,"png"),28,23,false,-1);
      }
      
      public static function getLocaleFlagIndex(param1:String) : int
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "ar_SA":
               return 1;
            case "bg_BG":
               return 2;
            case "cs_CZ":
               return 3;
            case "de_DE":
               return 4;
            case "el_GR":
               return 5;
            case "en_AP":
               return 6;
            case "en_GB":
               return 7;
            case "en_IN":
               return 8;
            case "en_PH":
               return 9;
            case "en_SG":
               return 10;
            case "en_US":
               return 11;
            case "es_AR":
               return 12;
            case "es_CL":
               return 13;
            case "es_CO":
               return 14;
            case "es_ES":
               return 15;
            case "es_LA":
               return 16;
            case "es_MX":
               return 17;
            case "fr_FR":
               return 18;
            case "hr_HR":
               return 19;
            case "id_ID":
               return 20;
            case "it_IT":
               return 21;
            case "lt_LT":
               return 22;
            case "ms_MY":
               return 23;
            case "pl_PL":
               return 24;
            case "pt_BR":
               return 25;
            case "pt_PT":
               return 26;
            case "ro_RO":
               return 27;
            case "ru_RU":
               return 28;
            case "th_TH":
               return 29;
            case "tr_TR":
               return 30;
            case "vi_VN":
               return 31;
            case "zh_TW":
               return 32;
            case "en_WO":
               return 33;
            default:
               return 1;
         }
      }
   }
}

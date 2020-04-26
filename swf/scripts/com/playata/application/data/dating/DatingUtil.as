package com.playata.application.data.dating
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.constants.CDating;
   import com.playata.application.data.constants.CDatingStep;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.localization.LocText;
   
   public class DatingUtil
   {
       
      
      public function DatingUtil()
      {
         super();
      }
      
      public static function getDatingTemplate(param1:int) : CDating
      {
         return CDating.fromId(param1);
      }
      
      public static function getDatingStepTemplate(param1:int, param2:int) : CDatingStep
      {
         return CDating.fromId(param1).getStep(param2);
      }
      
      public static function getRewardItemIdentifer(param1:int, param2:int, param3:Boolean) : String
      {
         var _loc5_:* = null;
         var _loc4_:CDatingStep = getDatingStepTemplate(param1,param2);
         if(_loc4_)
         {
            _loc5_ = "";
            if(!param3)
            {
               if(User.current.character.isMale)
               {
                  _loc5_ = _loc4_.rewardItemIdentifierM;
               }
               else
               {
                  _loc5_ = _loc4_.rewardItemIdentifierF;
               }
            }
            else if(User.current.character.isMale)
            {
               _loc5_ = _loc4_.rewardItemIdentifierMRepeat;
            }
            else
            {
               _loc5_ = _loc4_.rewardItemIdentifierFRepeat;
            }
            return _loc5_;
         }
         return null;
      }
      
      public static function getRewardItemIsRandom(param1:int, param2:int, param3:Boolean) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:String = getRewardItemIdentifer(param1,param2,param3);
         if(_loc4_ && _loc4_ != "")
         {
            _loc5_ = CItemTemplate.fromId(_loc4_);
            return !_loc5_ && _loc4_.indexOf("random") >= 0;
         }
         return false;
      }
      
      public static function getRewardItemIconImageUrl(param1:int, param2:int, param3:Boolean) : String
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(getRewardItemIsRandom(param1,param2,param3))
         {
            return ServerInfo.assetURL(Item.itemAssetPath + "random_i","png");
         }
         var _loc4_:String = getRewardItemIdentifer(param1,param2,param3);
         if(_loc4_ && _loc4_ != "")
         {
            _loc5_ = CItemTemplate.fromId(_loc4_);
            if(_loc5_)
            {
               _loc6_ = _loc5_.gender == "u"?"":!!User.current.character.isMale?"_m":"_f";
               return ServerInfo.assetURL(Item.itemAssetPath + _loc4_ + _loc6_ + "_i","png");
            }
         }
         return "";
      }
      
      public static function getRewardItemQuality(param1:int, param2:int, param3:Boolean) : int
      {
         var _loc5_:* = null;
         var _loc4_:String = getRewardItemIdentifer(param1,param2,param3);
         if(_loc4_ && _loc4_ != "")
         {
            if(getRewardItemIsRandom(param1,param2,param3))
            {
               if(_loc4_.indexOf("common") >= 0)
               {
                  return 1;
               }
               if(_loc4_.indexOf("rare") >= 0)
               {
                  return 2;
               }
               if(_loc4_.indexOf("epic") >= 0)
               {
                  return 3;
               }
            }
            else
            {
               _loc5_ = CItemTemplate.fromId(_loc4_);
               if(_loc5_)
               {
                  return _loc5_.quality;
               }
            }
         }
         return 0;
      }
      
      public static function getRewardItemName(param1:int, param2:int, param3:Boolean) : String
      {
         var _loc4_:String = getRewardItemIdentifer(param1,param2,param3);
         if(_loc4_ && _loc4_ != "")
         {
            if(_loc4_.indexOf("surprise_box") != -1)
            {
               _loc4_ = _loc4_.substr(0,_loc4_.lastIndexOf("_"));
            }
            return LocText.current.text("item/" + _loc4_ + "/name");
         }
         return "";
      }
      
      public static function getRewardStatPoints(param1:int, param2:int, param3:Boolean) : int
      {
         var _loc4_:CDatingStep = getDatingStepTemplate(param1,param2);
         if(_loc4_)
         {
            if(!param3)
            {
               return _loc4_.rewardStatPoints;
            }
            return _loc4_.rewardStatPointsRepeat;
         }
         return 0;
      }
      
      public static function getStage(param1:int) : int
      {
         var _loc2_:CDating = getDatingTemplate(param1);
         if(_loc2_)
         {
            return _loc2_.stage;
         }
         return 0;
      }
      
      public static function getRewardImageCount(param1:int) : int
      {
         if(param1 == 0)
         {
            return 2;
         }
         var _loc2_:int = 0;
         var _loc3_:CDating = getDatingTemplate(param1);
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_.stepIds;
         for each(var _loc4_ in _loc3_.stepIds)
         {
            if(AppEnvironment.appPlatform.isHidePantiesAllowed || getDatingStepTemplate(param1,_loc4_).usk16Image)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public static function hasRewardImage(param1:int, param2:int, param3:Boolean = false) : Boolean
      {
         if(param3)
         {
            return false;
         }
         if(param1 == 0)
         {
            return true;
         }
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            return true;
         }
         var _loc4_:CDatingStep = getDatingStepTemplate(param1,param2);
         return _loc4_.usk16Image;
      }
      
      public static function getRewardGirlPicture(param1:int, param2:int) : String
      {
         var _loc3_:* = null;
         var _loc4_:String = null;
         if(param1 == 0)
         {
            _loc4_ = "Session0_Tutorial";
         }
         else
         {
            _loc3_ = getDatingTemplate(param1);
            _loc4_ = _loc3_.identifier;
         }
         return LocText.current.text("dating/" + _loc4_ + "/" + param2 + "/reward_picture");
      }
      
      public static function getGirlImageUrl(param1:int, param2:int) : String
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         if(param1 == 0)
         {
            return ServerInfo.assetURL("dating/Session0_Tutorial_g","png");
         }
         _loc3_ = getDatingTemplate(param1);
         if(_loc3_)
         {
            _loc5_ = !!Environment.info.isTouchScreen?"png":"swf";
            _loc4_ = !!Environment.info.isTouchScreen?"_" + param2:"";
            if(AppEnvironment.appPlatform.isHidePantiesAllowed)
            {
               return ServerInfo.assetURL("dating_usk18/" + _loc3_.identifier + _loc4_ + "_g",_loc5_);
            }
            return ServerInfo.assetURL("dating/" + _loc3_.identifier + _loc4_ + "_g",_loc5_);
         }
         return "";
      }
      
      public static function getGirlRewardImageUrl(param1:int, param2:int, param3:String = "") : String
      {
         var _loc6_:* = false;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc5_:String = null;
         if(param1 == 0)
         {
            _loc5_ = "Session0_Tutorial";
            _loc6_ = param2 == 2;
         }
         else
         {
            _loc4_ = getDatingTemplate(param1);
            _loc8_ = _loc4_.getStep(param2);
            if(AppEnvironment.appPlatform.isHidePantiesAllowed)
            {
               _loc6_ = Boolean(_loc8_.genderedImage);
            }
            else
            {
               _loc6_ = Boolean(_loc8_.usk16GenderedImage);
            }
            _loc5_ = _loc4_.identifier;
         }
         if(_loc5_)
         {
            _loc7_ = null;
            if(AppEnvironment.appPlatform.isHidePantiesAllowed)
            {
               _loc7_ = "dating_usk18/" + _loc5_ + "_" + param2 + "_r";
            }
            else
            {
               _loc7_ = "dating/" + _loc5_ + "_" + param2 + "_r";
            }
            if(_loc6_)
            {
               _loc7_ = _loc7_ + ("_" + User.current.character.gender);
            }
            if(param3 != null && param3 != "")
            {
               _loc7_ = _loc7_ + param3;
            }
            return ServerInfo.assetURL(_loc7_,"jpg");
         }
         return "";
      }
      
      public static function getGirlThumbnailImageUrl(param1:int) : String
      {
         var _loc2_:* = null;
         var _loc3_:String = null;
         if(param1 == 0)
         {
            _loc3_ = "Session0_Tutorial";
         }
         else
         {
            _loc2_ = getDatingTemplate(param1);
            _loc3_ = _loc2_.identifier;
         }
         if(_loc3_)
         {
            return ServerInfo.assetURL("dating/" + _loc3_ + "_t","png");
         }
         return "";
      }
      
      public static function getName(param1:int) : String
      {
         var _loc2_:* = null;
         var _loc3_:String = null;
         if(param1 == 0)
         {
            _loc3_ = "Session0_Tutorial";
         }
         else
         {
            _loc2_ = getDatingTemplate(param1);
            _loc3_ = _loc2_.identifier;
         }
         return LocText.current.text("dating/" + _loc3_ + "/name");
      }
      
      public static function getIntroText(param1:int) : String
      {
         var _loc2_:CDating = getDatingTemplate(param1);
         return LocText.current.text("dating/" + _loc2_.identifier + "/intro");
      }
      
      public static function getBriefingText(param1:int, param2:int) : String
      {
         var _loc3_:CDating = getDatingTemplate(param1);
         return LocText.current.text("dating/" + _loc3_.identifier + "/" + param2 + "/briefing");
      }
      
      public static function getOutroText(param1:int, param2:int) : String
      {
         var _loc3_:CDating = getDatingTemplate(param1);
         return LocText.current.text("dating/" + _loc3_.identifier + "/" + param2 + "/outro");
      }
      
      public static function getBalloonText(param1:int, param2:int) : String
      {
         var _loc3_:CDating = getDatingTemplate(param1);
         return LocText.current.text("dating/" + _loc3_.identifier + "/" + param2 + "/balloon");
      }
      
      public static function getBalloonWorldmapText(param1:int, param2:int) : String
      {
         var _loc3_:CDating = getDatingTemplate(param1);
         return LocText.current.text("dating/" + _loc3_.identifier + "/" + param2 + "/balloon_worldmap");
      }
      
      public static function getImageText(param1:int, param2:int) : String
      {
         var _loc3_:* = null;
         var _loc4_:String = null;
         if(param1 == 0)
         {
            _loc4_ = "Session0_Tutorial";
         }
         else
         {
            _loc3_ = getDatingTemplate(param1);
            _loc4_ = _loc3_.identifier;
         }
         return LocText.current.text("dating/" + _loc4_ + "/" + param2 + "/image");
      }
      
      public static function getWinText(param1:int) : String
      {
         var _loc2_:CDating = getDatingTemplate(param1);
         return LocText.current.text("dating/" + _loc2_.identifier + "/win");
      }
      
      public static function getLostText(param1:int) : String
      {
         var _loc2_:CDating = getDatingTemplate(param1);
         return LocText.current.text("dating/" + _loc2_.identifier + "/lost");
      }
      
      public static function getUnlockText(param1:int) : String
      {
         var _loc2_:CDating = getDatingTemplate(param1);
         return LocText.current.text("dating/" + _loc2_.identifier + "/info_unlock");
      }
      
      public static function get isAvailable() : Boolean
      {
         return AppConfig.datingEnabled && AppEnvironment.appPlatform.datingFeatureEnabled;
      }
      
      public static function getRepeatKeyImageUrl(param1:int) : String
      {
         var _loc2_:CDating = getDatingTemplate(param1);
         if(_loc2_)
         {
            return ServerInfo.assetURL("dating/" + _loc2_.identifier + "_r","png");
         }
         return "";
      }
      
      public static function getRepeatKeyName(param1:int) : String
      {
         return LocText.current.text("dating/repeat_key_name",getName(param1));
      }
      
      public static function getRepeatKeyDescription(param1:int) : String
      {
         return LocText.current.text("dating/repeat_key_description",getName(param1));
      }
   }
}

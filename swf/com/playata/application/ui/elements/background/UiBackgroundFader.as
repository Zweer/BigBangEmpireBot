package com.playata.application.ui.elements.background
{
   import com.greensock.easing.Quad;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.BackgroundCache;
   import com.playata.framework.application.Environment;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.Align;
   import flash.geom.Point;
   import visuals.ui.elements.background.SymbolBackgroundFaderGeneric;
   
   public class UiBackgroundFader
   {
      
      public static var useMovieClipAnimations:Boolean = true;
       
      
      private var _fader:SymbolBackgroundFaderGeneric = null;
      
      private var _currentBackgroundType:int = 0;
      
      private var _backgroundCache:IntMap;
      
      private var _customPosition:Point = null;
      
      private var _fromCustomPosition:Point = null;
      
      private var _tweenBackground:Boolean = true;
      
      private var _tweenStartCallback:Function = null;
      
      private var _cacheBackgrounds:Boolean = true;
      
      private var _backgroundLoadedCallback:Function = null;
      
      public function UiBackgroundFader(param1:SymbolBackgroundFaderGeneric)
      {
         _backgroundCache = new IntMap();
         super();
         _fader = param1;
         _fader.bgLow.dummy.visible = false;
         _fader.bgHigh.dummy.visible = false;
         _cacheBackgrounds = !Environment.info.isNativeMobile;
      }
      
      public static function scaleWidthCenter(param1:IDisplayObject, param2:int = 0, param3:Number = -1, param4:Align = null) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(!LayoutUtil.isWidthAdjustedFormat)
         {
            param1.scale = Environment.layout.appHeight / Environment.layout.appDefaultHeight;
            if(param4 == null || param4 == Align.LEFT)
            {
               param1.x = 0;
            }
            else if(param4 == Align.RIGHT)
            {
               param1.x = -(Environment.layout.appDefaultWidth * param1.scale - Environment.layout.appDefaultWidth);
            }
            else if(param4 == Align.CENTER)
            {
               param1.x = -((Environment.layout.appDefaultWidth * param1.scale - Environment.layout.appDefaultWidth) / 2);
            }
            param1.y = 0;
         }
         else
         {
            param1.scale = Environment.layout.appWidth / (Environment.layout.appDefaultWidth - param2);
            param1.x = 0;
            _loc5_ = Environment.layout.appDefaultHeight * param1.scale;
            _loc6_ = _loc5_ - Environment.layout.appDefaultHeight;
            if(param1.scale > 1 && param3 >= 0)
            {
               param1.y = -(param3 * param1.scale - param3);
            }
            else
            {
               param1.y = -(_loc6_ / 2);
            }
         }
      }
      
      public function refreshAppSize() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:BackgroundCache = _backgroundCache.getData(_currentBackgroundType);
         if(!_loc1_)
         {
            return;
         }
         switch(int(_loc1_.scaleMode))
         {
            case 0:
               _fader.scale = 1;
               break;
            case 1:
               _loc2_ = 0;
               if(_loc1_.imageHeight == 1800)
               {
                  _loc2_ = 220;
               }
               if(_loc1_.imageWidth == 900)
               {
                  _loc2_ = 220;
               }
               if(!LayoutUtil.isWidthAdjustedFormat)
               {
                  if(_loc1_.imageHeight == 1800)
                  {
                     _fader.scale = Environment.layout.appWidth / (Environment.layout.appDefaultWidth - _loc2_);
                  }
                  else
                  {
                     _fader.scale = Environment.layout.appHeight / Environment.layout.appDefaultHeight;
                  }
                  _fader.x = 0;
                  _fader.y = 0;
                  break;
               }
               _fader.scale = Environment.layout.appWidth / (Environment.layout.appDefaultWidth - _loc2_);
               _loc3_ = Environment.layout.appDefaultHeight * _fader.scale;
               _loc4_ = _loc3_ - Environment.layout.appDefaultHeight;
               if(_fader.scale > 1 && _loc1_.scaleHeightOffset >= 0)
               {
                  _fader.y = -(_loc1_.scaleHeightOffset * _fader.scale - _loc1_.scaleHeightOffset);
                  break;
               }
               _fader.y = -(_loc4_ / 2);
               break;
         }
      }
      
      public function setBackground(param1:int, param2:Point = null, param3:Point = null, param4:Boolean = true, param5:Function = null, param6:Function = null) : void
      {
         backgroundType = param1;
         customPosition = param2;
         fromCustomPosition = param3;
         tweenBackground = param4;
         tweenStartCallback = param5;
         backgroundLoadedCallback = param6;
         _customPosition = customPosition;
         _fromCustomPosition = fromCustomPosition;
         _tweenBackground = tweenBackground;
         _tweenStartCallback = tweenStartCallback;
         _backgroundLoadedCallback = backgroundLoadedCallback;
         if(backgroundType == _currentBackgroundType)
         {
            if(_backgroundLoadedCallback != null && _backgroundCache.exists(_currentBackgroundType))
            {
               var cache:BackgroundCache = _backgroundCache.getData(_currentBackgroundType);
               _backgroundLoadedCallback(cache.image);
            }
            return;
         }
         _currentBackgroundType = backgroundType;
         if(_fader.darkener.visible && _fader.darkener.alpha == 0)
         {
            loadBackground();
         }
         else
         {
            _fader.darkener.killTweens();
            _fader.darkener.tweenTo(0.1,{
               "autoAlpha":1,
               "onComplete":function():void
               {
                  loadBackground();
               }
            });
         }
      }
      
      public function get currentBackgroundType() : int
      {
         return _currentBackgroundType;
      }
      
      private function loadBackground() : void
      {
         var _loc3_:* = null;
         _fader.bgLow.removeAllChildren(!_cacheBackgrounds);
         _fader.bgHigh.removeAllChildren(!_cacheBackgrounds);
         var _loc10_:IDisplayObjectContainer = null;
         var _loc6_:IDisplayObjectContainer = null;
         var _loc1_:String = null;
         var _loc12_:String = null;
         var _loc7_:String = null;
         var _loc5_:Boolean = false;
         var _loc8_:int = 1;
         var _loc2_:int = -1;
         var _loc11_:int = 1120;
         var _loc9_:int = 630;
         var _loc4_:String = "swf";
         if(!_backgroundCache.exists(_currentBackgroundType) || !_cacheBackgrounds)
         {
            if(!useMovieClipAnimations)
            {
               _loc4_ = "jpg";
            }
            var _loc13_:* = _currentBackgroundType;
            switch(_loc13_)
            {
               case 1:
                  _loc1_ = "SymbolBackgroundLowCharacter";
                  _loc12_ = "character";
                  _loc7_ = "ambience_appartment.mp3";
                  break;
               case 22:
                  _loc1_ = "SymbolBackgroundLowCharacter";
                  _loc12_ = "character_empty";
                  _loc7_ = "ambience_appartment.mp3";
                  break;
               case 2:
                  _loc1_ = "SymbolBackgroundLowDuels";
                  _loc12_ = _currentBackgroundType == 2?"duels":"duels_usk18";
                  _loc7_ = "ambience_duel.mp3";
                  break;
               case 1002:
                  _loc1_ = "SymbolBackgroundLowGuildArena";
                  _loc12_ = "guild_arena";
                  _loc7_ = "ambience_duel.mp3";
                  break;
               case 6:
               case 12:
                  _loc1_ = "SymbolBackgroundLowLocation1";
                  _loc12_ = _currentBackgroundType == 12?"location1":"location1_usk18";
                  _loc7_ = "ambience_location1.mp3";
                  break;
               case 1012:
               case 13:
                  _loc1_ = "SymbolBackgroundLowLocation2";
                  _loc12_ = _currentBackgroundType == 13?"location2":"location2_usk18";
                  _loc7_ = "ambience_location2.mp3";
                  break;
               case 1013:
               case 14:
                  _loc1_ = "SymbolBackgroundLowLocation3";
                  _loc12_ = _currentBackgroundType == 14?"location3":"location3_usk18";
                  _loc7_ = "ambience_location3.mp3";
                  break;
               case 1014:
               case 15:
                  _loc1_ = "SymbolBackgroundLowLocation4";
                  _loc12_ = _currentBackgroundType == 15?"location4":"location4_usk18";
                  _loc7_ = "ambience_location4.mp3";
                  break;
               case 1015:
               case 16:
                  _loc1_ = "SymbolBackgroundLowLocation5";
                  _loc12_ = _currentBackgroundType == 16?"location5":"location5_usk18";
                  _loc7_ = "ambience_location5.mp3";
                  break;
               case 1016:
               case 17:
                  _loc1_ = "SymbolBackgroundLowLocation6";
                  _loc12_ = _currentBackgroundType == 17?"location6":"location6_usk18";
                  _loc7_ = "ambience_location6.mp3";
                  break;
               case 1017:
               case 18:
                  _loc1_ = "SymbolBackgroundLowLocation7";
                  _loc12_ = _currentBackgroundType == 18?"location7":"location7_usk18";
                  _loc7_ = "ambience_location7.mp3";
                  break;
               case 1018:
               case 19:
                  _loc1_ = "SymbolBackgroundLowLocation8";
                  _loc12_ = _currentBackgroundType == 19?"location8":"location8_usk18";
                  _loc7_ = "ambience_location8.mp3";
                  break;
               case 1019:
               case 21:
                  _loc1_ = "SymbolBackgroundLowLocation8";
                  _loc12_ = _currentBackgroundType == 21?"location9":"location9_usk18";
                  _loc7_ = "ambience_location8.mp3";
                  break;
               case 1021:
                  _loc1_ = "SymbolBackgroundLowLocationOliviaJones";
                  _loc12_ = "location_olivia_jones";
                  _loc7_ = "ambience_location_olivia_jones.mp3";
                  break;
               case 20:
                  _loc1_ = "SymbolBackgroundLowShop";
                  _loc12_ = "shop";
                  _loc7_ = "ambience_shop.mp3";
                  break;
               case 3:
                  _loc1_ = "SymbolBackgroundLowWork";
                  _loc12_ = "work";
                  _loc7_ = "ambience_appartment.mp3";
                  break;
               case 4:
                  _loc1_ = "SymbolBackgroundLowGuild";
                  _loc12_ = "guild";
                  _loc7_ = "ambience_appartment.mp3";
                  break;
               case 5:
               case 30:
                  _loc1_ = "SymbolBackgroundLowDungeon1_1";
                  _loc12_ = _currentBackgroundType == 30?"dungeon_burning_bernie_1":"dungeon_burning_bernie_1_usk18";
                  _loc7_ = "ambience_dungeon1.mp3";
                  _loc5_ = true;
                  break;
               case 1030:
               case 31:
                  _loc1_ = "SymbolBackgroundLowDungeon1_2";
                  _loc12_ = _currentBackgroundType == 31?"dungeon_burning_bernie_2":"dungeon_burning_bernie_2_usk18";
                  _loc7_ = "ambience_dungeon1.mp3";
                  _loc5_ = true;
                  break;
               case 1031:
               case 32:
                  _loc1_ = "SymbolBackgroundLowDungeon1_3";
                  _loc12_ = _currentBackgroundType == 32?"dungeon_burning_bernie_3":"dungeon_burning_bernie_3_usk18";
                  _loc7_ = "ambience_dungeon1.mp3";
                  _loc5_ = true;
                  break;
               case 1032:
               case 33:
                  _loc1_ = "SymbolBackgroundLowDungeon2_1";
                  _loc12_ = _currentBackgroundType == 33?"dungeon_flaming_wheels_1":"dungeon_flaming_wheels_1_usk18";
                  _loc7_ = "ambience_dungeon2.mp3";
                  _loc5_ = true;
                  break;
               case 1033:
               case 34:
                  _loc1_ = "SymbolBackgroundLowDungeon2_2";
                  _loc12_ = _currentBackgroundType == 34?"dungeon_flaming_wheels_2":"dungeon_flaming_wheels_2_usk18";
                  _loc7_ = "ambience_dungeon2.mp3";
                  _loc5_ = true;
                  break;
               case 1034:
               case 35:
                  _loc1_ = "SymbolBackgroundLowDungeon2_3";
                  _loc12_ = _currentBackgroundType == 35?"dungeon_flaming_wheels_3":"dungeon_flaming_wheels_3_usk18";
                  _loc7_ = "ambience_dungeon2.mp3";
                  _loc5_ = true;
                  break;
               case 1035:
               case 36:
                  _loc1_ = "SymbolBackgroundLowDungeon1_1";
                  _loc12_ = _currentBackgroundType == 36?"dungeon_whiplash_1":"dungeon_whiplash_1_usk18";
                  _loc7_ = "ambience_dungeon3_1u2.mp3";
                  _loc5_ = true;
                  break;
               case 1036:
               case 37:
                  _loc1_ = "SymbolBackgroundLowDungeon1_2";
                  _loc12_ = _currentBackgroundType == 37?"dungeon_whiplash_2":"dungeon_whiplash_2_usk18";
                  _loc7_ = "ambience_dungeon3_1u2.mp3";
                  _loc5_ = true;
                  break;
               case 1037:
               case 38:
                  _loc1_ = "SymbolBackgroundLowDungeon1_3";
                  _loc12_ = _currentBackgroundType == 38?"dungeon_whiplash_3":"dungeon_whiplash_3_usk18";
                  _loc7_ = "ambience_dungeon3_3.mp3";
                  _loc5_ = true;
                  break;
               case 1038:
                  _loc1_ = "SymbolBackgroundLowCitymap";
                  _loc12_ = "citymap";
                  _loc7_ = "ambience_location4.mp3";
                  break;
               case 11:
                  _loc1_ = "SymbolBackgroundLowStatQuest1";
                  _loc12_ = "stat_quest_1";
                  _loc7_ = "ambience_appartment.mp3";
                  break;
               case 7:
                  _loc1_ = "SymbolBackgroundLowStatQuest2";
                  _loc12_ = "stat_quest_2";
                  _loc7_ = "ambience_appartment.mp3";
                  break;
               case 8:
                  _loc1_ = "SymbolBackgroundLowStatQuest3";
                  _loc12_ = "stat_quest_3";
                  _loc7_ = "ambience_appartment.mp3";
                  break;
               case 9:
                  _loc1_ = "SymbolBackgroundLowStatQuest4";
                  _loc12_ = "stat_quest_4";
                  _loc7_ = "ambience_appartment.mp3";
                  break;
               case 10:
               case 100:
                  _loc1_ = "SymbolBackgroundLowSlotmachine";
                  _loc12_ = _currentBackgroundType == 100?"slotmachine":"slotmachine_usk18";
                  _loc7_ = "ambience_dungeon1.mp3";
                  break;
               case 1100:
            }
            if(_cacheBackgrounds)
            {
               _loc10_ = UriSprite.load(_loc1_,-1,-1);
            }
            else
            {
               _loc10_ = new Sprite();
            }
            _loc6_ = UriSprite.load(Assets.assetURL("backgrounds_new/" + _loc12_ + "." + _loc4_,null),_loc11_,_loc9_,true,1,_backgroundLoadedCallback,false,true,useMovieClipAnimations);
            _backgroundCache.setData(_currentBackgroundType,new BackgroundCache(_loc11_,_loc9_,_loc10_,_loc6_,_loc7_,_loc5_,_loc8_,_loc2_));
         }
         else
         {
            _loc3_ = _backgroundCache.getData(_currentBackgroundType);
            _loc10_ = _loc3_.imageLow;
            _loc6_ = _loc3_.image;
            _loc7_ = _loc3_.soundUrl;
            _loc5_ = _loc3_.allowCustomPosition;
            if(_backgroundLoadedCallback != null)
            {
               _backgroundLoadedCallback(_loc6_);
            }
         }
         if(!_loc5_)
         {
            _fader.bgLow.x = 0;
            _fader.bgLow.y = 0;
            _fader.bgHigh.x = 0;
            _fader.bgHigh.y = 0;
         }
         setPosition(_customPosition,_fromCustomPosition,_tweenBackground,_tweenStartCallback);
         _loc10_.width = _loc11_;
         _loc10_.height = _loc9_;
         _fader.bgLow.addChild(_loc10_);
         _fader.bgHigh.addChild(_loc6_);
         _fader.darkener.tweenTo(0.1,{"autoAlpha":0});
         Environment.audio.playMusic(_loc7_);
         refreshAppSize();
      }
      
      public function setPosition(param1:Point, param2:Point, param3:Boolean, param4:Function = null) : void
      {
         _customPosition = param1;
         _fromCustomPosition = param2;
         _tweenBackground = param3;
         _tweenStartCallback = param4;
         _fader.bgLow.killTweens();
         _fader.bgHigh.killTweens();
         if(_customPosition)
         {
            if(_customPosition.x < 0)
            {
               _fader.bgLow.x = _customPosition.x;
               _fader.bgHigh.x = _customPosition.x;
            }
            else
            {
               _fader.bgLow.x = 0;
               _fader.bgHigh.x = 0;
            }
            if(_customPosition.y < 0)
            {
               _fader.bgLow.y = _customPosition.y;
               _fader.bgHigh.y = _customPosition.y;
            }
            else
            {
               _fader.bgLow.y = 0;
               _fader.bgHigh.y = 0;
            }
            if(_tweenBackground)
            {
               if(_tweenStartCallback != null)
               {
                  _tweenStartCallback();
               }
               _fader.bgLow.tweenFrom(1,{
                  "x":_fromCustomPosition.x,
                  "y":_fromCustomPosition.y,
                  "ease":Quad.easeInOut
               });
               _fader.bgHigh.tweenFrom(1,{
                  "x":_fromCustomPosition.x,
                  "y":_fromCustomPosition.y,
                  "ease":Quad.easeInOut
               });
            }
         }
      }
      
      public function playCurrentBackgroundMusic() : void
      {
         var _loc1_:BackgroundCache = _backgroundCache.getData(_currentBackgroundType);
         if(_loc1_)
         {
            Environment.audio.playMusic(_loc1_.soundUrl);
         }
      }
      
      public function get fader() : SymbolBackgroundFaderGeneric
      {
         return _fader;
      }
      
      public function clearCache() : void
      {
         _backgroundCache = new IntMap();
         UriSprite.cache.clearCache(getBackgroundAssetUrl("duels",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("location1",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("location2",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("location3",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("location4",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("location5",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("location6",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("location7",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("citymap",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("shop",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("stat_quest_1",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("stat_quest_2",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("stat_quest_3",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("stat_quest_4",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("dungeon_burning_bernie_1",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("dungeon_burning_bernie_2",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("dungeon_burning_bernie_3",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("dungeon_flaming_wheels_1",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("dungeon_flaming_wheels_2",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("dungeon_flaming_wheels_3",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("dungeon_whiplash_1",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("dungeon_whiplash_2",true));
         UriSprite.cache.clearCache(getBackgroundAssetUrl("dungeon_whiplash_3",true));
      }
      
      private function getBackgroundAssetUrl(param1:String, param2:Boolean = false) : String
      {
         var _loc3_:* = null;
         var _loc4_:String = ServerInfo.assetURL("backgrounds/" + param1,"swf");
         if(param2)
         {
            _loc3_ = getBackgroundMetricsFromLocation(param1);
            _loc4_ = _loc4_ + ("_" + _loc3_.width + "_" + _loc3_.height);
         }
         return _loc4_;
      }
      
      public function getBackgroundMetrics(param1:int) : UiBackgroundMetrics
      {
         var _loc3_:Number = 1120;
         var _loc2_:Number = 630;
         return new UiBackgroundMetrics(_loc3_,_loc2_);
      }
      
      private function getBackgroundMetricsFromLocation(param1:String) : UiBackgroundMetrics
      {
         var _loc3_:Number = 1120;
         var _loc2_:Number = 630;
         return new UiBackgroundMetrics(_loc3_,_loc2_);
      }
      
      public function reloadBackground() : void
      {
         loadBackground();
      }
   }
}

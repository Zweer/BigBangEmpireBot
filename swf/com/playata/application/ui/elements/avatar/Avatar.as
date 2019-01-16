package com.playata.application.ui.elements.avatar
{
   import com.greensock.easing.Ease;
   import com.greensock.easing.Quint;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.constants.CCharacterAppearance;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.item.Item;
   import com.playata.application.task.assets.UriDisplayObjectAsset;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.util.ObjectUtil;
   import com.playata.framework.display.flash.FlashDisplayUtil;
   import fl.motion.AdjustColor;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DisplacementMapFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Avatar extends Sprite
   {
      
      private static var BODY_CACHE:StringMap = new StringMap();
      
      private static var ZERO:Point = new Point();
      
      private static var TMP_BITMAP:BitmapData = new BitmapData(424,900,true,0);
      
      private static var TMP_BITMAP2:BitmapData = new BitmapData(424,900,true,0);
      
      private static var SKIN_COLOR_MATRIX_FILTER:ColorMatrixFilter = new ColorMatrixFilter();
      
      private static var HAIR_COLOR_MATRIX_FILTER:ColorMatrixFilter = new ColorMatrixFilter();
      
      private static var EYEBROWS_COLOR_MATRIX_FILTER:ColorMatrixFilter = new ColorMatrixFilter();
      
      private static var FACIAL_HAIR_COLOR_MATRIX_FILTER:ColorMatrixFilter = new ColorMatrixFilter();
      
      private static var GENITAL_HAIR_COLOR_MATRIX_FILTER:ColorMatrixFilter = new ColorMatrixFilter();
      
      private static var HAIR_DARKENER:ColorTransform = new ColorTransform(1,1,1,0.5);
      
      private static var ITEM_DRAW_MATRIX:Matrix = new Matrix(2,0,0,2);
      
      private static var BLINK_DURATION:int = 5;
      
      private static var BLINK_DELAY:int = 30;
      
      private static var F_BREATH:BitmapData = new SymbolCharacterFFemale_breath_source();
      
      private static var M_BREATH:BitmapData = new SymbolCharacterMMale_breath_source();
      
      private static var BREATH_MAX_VALUE:Number = 8;
      
      private static var BREATH_FRAMES:int = Math.round(120 / BREATH_FRAME_DELAY);
      
      private static var BREATH_FRAME_DELAY:int = 3;
      
      private static var CHARACTER_CACHE:Vector.<BitmapData> = new Vector.<BitmapData>(BREATH_FRAMES * 2,true);
      
      private static var _currentCache:String = "";
      
      private static var SKIN_COLORS:Object = {
         "m":{
            1:{
               "type":"adjust",
               "brightness":0,
               "contrast":0,
               "hue":0,
               "saturation":0
            },
            2:{
               "type":"adjust",
               "brightness":-12,
               "contrast":5,
               "hue":-5,
               "saturation":10
            },
            3:{
               "type":"transform",
               "redMultiplier":25,
               "greenMultiplier":0,
               "blueMultiplier":20
            },
            4:{
               "type":"transform",
               "redMultiplier":-20,
               "greenMultiplier":-40,
               "blueMultiplier":-10
            },
            5:{
               "type":"transform",
               "redMultiplier":-10,
               "greenMultiplier":15,
               "blueMultiplier":-15
            },
            6:{
               "type":"adjust",
               "brightness":-77,
               "contrast":15,
               "hue":0,
               "saturation":0
            },
            7:{
               "type":"adjust",
               "brightness":-100,
               "contrast":0,
               "hue":0,
               "saturation":0
            }
         },
         "f":{
            1:{
               "type":"adjust",
               "brightness":0,
               "contrast":0,
               "hue":0,
               "saturation":0
            },
            2:{
               "type":"adjust",
               "brightness":-12,
               "contrast":5,
               "hue":-5,
               "saturation":10
            },
            3:{
               "type":"transform",
               "redMultiplier":25,
               "greenMultiplier":0,
               "blueMultiplier":20
            },
            4:{
               "type":"transform",
               "redMultiplier":-20,
               "greenMultiplier":-40,
               "blueMultiplier":-10
            },
            5:{
               "type":"transform",
               "redMultiplier":-10,
               "greenMultiplier":15,
               "blueMultiplier":-15
            },
            6:{
               "type":"adjust",
               "brightness":-77,
               "contrast":15,
               "hue":0,
               "saturation":0
            },
            7:{
               "type":"adjust",
               "brightness":-100,
               "contrast":0,
               "hue":0,
               "saturation":0
            }
         }
      };
      
      private static var HAIR_COLORS:Object = {
         1:{
            "r":3,
            "g":0,
            "b":23,
            "brightness":-39,
            "contrast":-63
         },
         2:{
            "r":60,
            "g":0,
            "b":32,
            "brightness":-71,
            "contrast":-59
         },
         3:{
            "r":189,
            "g":15,
            "b":0,
            "brightness":-80,
            "contrast":-35
         },
         4:{
            "r":251,
            "g":121,
            "b":68,
            "brightness":100,
            "contrast":8
         },
         5:{
            "r":134,
            "g":85,
            "b":14,
            "brightness":100,
            "contrast":-50
         },
         6:{
            "r":135,
            "g":98,
            "b":0,
            "brightness":-43,
            "contrast":-39
         },
         7:{
            "r":168,
            "g":94,
            "b":18,
            "brightness":32,
            "contrast":-26
         },
         8:{
            "r":117,
            "g":73,
            "b":26,
            "brightness":44,
            "contrast":-43
         },
         9:{
            "r":102,
            "g":101,
            "b":105,
            "brightness":48,
            "contrast":-43
         },
         10:{
            "r":171,
            "g":89,
            "b":55,
            "brightness":-100,
            "contrast":2
         },
         11:{
            "r":75,
            "g":24,
            "b":0,
            "brightness":-100,
            "contrast":-71
         },
         12:{
            "r":255,
            "g":255,
            "b":246,
            "brightness":-60,
            "contrast":3
         },
         13:{
            "r":61,
            "g":172,
            "b":235,
            "brightness":32,
            "contrast":36
         },
         14:{
            "r":182,
            "g":43,
            "b":125,
            "brightness":-57,
            "contrast":14
         },
         15:{
            "r":105,
            "g":6,
            "b":125,
            "brightness":-73,
            "contrast":-43
         },
         16:{
            "r":255,
            "g":171,
            "b":43,
            "brightness":-76,
            "contrast":-40
         },
         17:{
            "r":255,
            "g":185,
            "b":142,
            "brightness":-96,
            "contrast":-51
         },
         18:{
            "r":247,
            "g":124,
            "b":167,
            "brightness":-61,
            "contrast":-12
         },
         19:{
            "r":101,
            "g":231,
            "b":89,
            "brightness":-61,
            "contrast":-12
         },
         20:{
            "r":66,
            "g":198,
            "b":182,
            "brightness":-60,
            "contrast":-22
         },
         21:{
            "r":228,
            "g":221,
            "b":198,
            "brightness":-73,
            "contrast":-38
         },
         22:{
            "r":6,
            "g":8,
            "b":91,
            "brightness":-68,
            "contrast":-24
         },
         23:{
            "r":252,
            "g":167,
            "b":167,
            "brightness":-68,
            "contrast":-24
         },
         24:{
            "r":214,
            "g":192,
            "b":233,
            "brightness":-70,
            "contrast":-29
         }
      };
      
      private static var _enableAnimations:Boolean = true;
       
      
      private var _isMale:Boolean = false;
      
      private var _large:Boolean = false;
      
      private var _animated:Boolean = false;
      
      private var _hidePantiesAllowed:Boolean = false;
      
      private var _hideBraAllowed:Boolean = false;
      
      private var _currentSettings:AppearanceSettings = null;
      
      private var _settingsHash:String;
      
      private var _itemsToLoad:Vector.<UriDisplayObjectAsset>;
      
      private var _bodyBitmap:Bitmap;
      
      private var _bodyBitmapFrontHair:Bitmap;
      
      private var _bodyBitmapFacialHair:Bitmap;
      
      private var _bodyBitmapData:BitmapData;
      
      private var _bodyBitmapDataBase:BitmapData;
      
      private var _bodyBitmapDataFacialHair:BitmapData;
      
      private var _bodyBitmapDataFrontHair:BitmapData;
      
      private var _drawRect:Rectangle;
      
      private var _playing:Boolean;
      
      private var _frameTicks:int = 0;
      
      private var _itemsCopied:Boolean;
      
      private var _allLoaded:Boolean;
      
      private var _avatarCompleted:Boolean = false;
      
      private var _breathFilter:DisplacementMapFilter;
      
      private var _headBehindHairs:Boolean;
      
      private var _censorBars:MovieClip;
      
      private var _censorBarsTopNeeded:Boolean;
      
      private var _censorBarsBottomNeeded:Boolean;
      
      private var _measurePerformance:Boolean;
      
      private var _renderTimes:Vector.<int>;
      
      private var _itemLayers:Sprite = null;
      
      private var _layerItemHead:DisplayObject = null;
      
      public function Avatar(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false)
      {
         _itemsToLoad = new Vector.<UriDisplayObjectAsset>();
         _renderTimes = new Vector.<int>(0);
         super();
         _large = param1;
         _animated = param2;
         _hidePantiesAllowed = param3;
         _hideBraAllowed = param4;
         _bodyBitmapDataBase = new BitmapData(424,900,true,0);
         _drawRect = _bodyBitmapDataBase.rect;
         _bodyBitmapData = _bodyBitmapDataBase.clone();
         _bodyBitmapDataFrontHair = _bodyBitmapDataBase.clone();
         _bodyBitmapDataFacialHair = _bodyBitmapDataBase.clone();
         _bodyBitmap = new Bitmap(_bodyBitmapData,"auto",true);
         var _loc5_:* = 0.5;
         _bodyBitmap.scaleY = _loc5_;
         _bodyBitmap.scaleX = _loc5_;
         addChild(_bodyBitmap);
         _itemLayers = new Sprite();
         _itemLayers.addChild(new MovieClip()).name = "layerItemLegsBack";
         _itemLayers.addChild(new MovieClip()).name = "layerItemChestBack";
         _itemLayers.addChild(new MovieClip()).name = "layerItemBoots";
         _itemLayers.addChild(new MovieClip()).name = "layerItemLegsFront";
         _itemLayers.addChild(new MovieClip()).name = "layerItemChestFront";
         _itemLayers.addChild(new MovieClip()).name = "layerItemBelt";
         _itemLayers.addChild(new MovieClip()).name = "layerItemHead";
         addChild(_itemLayers);
         _layerItemHead = _itemLayers.getChildByName("layerItemHead");
         _bodyBitmapFacialHair = new Bitmap(_bodyBitmapDataFacialHair,"auto",true);
         _loc5_ = 0.5;
         _bodyBitmapFacialHair.scaleY = _loc5_;
         _bodyBitmapFacialHair.scaleX = _loc5_;
         _itemLayers.addChild(_bodyBitmapFacialHair);
         _bodyBitmapFrontHair = new Bitmap(_bodyBitmapDataFrontHair,"auto",true);
         _loc5_ = 0.5;
         _bodyBitmapFrontHair.scaleY = _loc5_;
         _bodyBitmapFrontHair.scaleX = _loc5_;
         _itemLayers.addChild(_bodyBitmapFrontHair);
         emptyLayer("layerItemHead");
         emptyLayer("layerItemChestBack");
         emptyLayer("layerItemChestFront");
         emptyLayer("layerItemBelt");
         emptyLayer("layerItemLegsBack");
         emptyLayer("layerItemLegsFront");
         emptyLayer("layerItemBoots");
         blendMode = "layer";
      }
      
      public static function get enableAnimations() : Boolean
      {
         return _enableAnimations;
      }
      
      public static function set enableAnimations(param1:Boolean) : void
      {
         _enableAnimations = param1;
         if(!param1)
         {
            clearCharacterCache();
         }
      }
      
      private static function clearCharacterCache() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < BREATH_FRAMES * 2)
         {
            if(CHARACTER_CACHE[_loc1_])
            {
               CHARACTER_CACHE[_loc1_].dispose();
               CHARACTER_CACHE[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      private static function getBodyBitmap(param1:String) : BitmapData
      {
         var _loc2_:BitmapData = BODY_CACHE.getData(param1);
         if(!_loc2_)
         {
            _loc2_ = ObjectUtil.instantiateByClassName(param1,true) as BitmapData;
            BODY_CACHE.setData(param1,_loc2_);
         }
         return _loc2_;
      }
      
      public static function getAppearanceValueIndex(param1:Vector.<int>, param2:int) : int
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_ == param2)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function get large() : Boolean
      {
         return _large;
      }
      
      public function dispose() : void
      {
         removeEventListener("enterFrame",onCheckLoadingStatus);
      }
      
      public function getBitMapdataByteArray(param1:Number, param2:Rectangle) : IByteArray
      {
         return FlashDisplayUtil.getFlashDisplayObjectAsByteArray(this,param1,param2,null);
      }
      
      public function get isAvatarImageLoaded() : Boolean
      {
         return _avatarCompleted && _allLoaded && _censorBars == null;
      }
      
      public function get isFriendBarImageLoaded() : Boolean
      {
         return _avatarCompleted && _allLoaded && _censorBars == null;
      }
      
      public function update(param1:AppearanceSettings) : void
      {
         var _loc3_:String = param1.asJsonString + (!!_large?"_HD":"");
         if(_loc3_ == _settingsHash)
         {
            return;
         }
         _settingsHash = _loc3_;
         _allLoaded = false;
         _avatarCompleted = false;
         _itemsCopied = false;
         _itemLayers.visible = true;
         removeEventListener("enterFrame",onCheckLoadingStatus);
         var _loc2_:Boolean = playing;
         playing = false;
         _currentSettings = param1;
         _isMale = _currentSettings.gender == "m";
         _itemsToLoad.length = 0;
         createBodyImage();
         setEquipment(4,_currentSettings);
         setEquipment(2,_currentSettings);
         setEquipment(1,_currentSettings);
         setEquipment(3,_currentSettings);
         setEquipment(5,_currentSettings);
         areAllItemsLoaded();
         if(_allLoaded && _censorBars)
         {
            onCensorBarsHidden();
         }
         else if(!_allLoaded)
         {
            addEventListener("enterFrame",onCheckLoadingStatus);
         }
         if(_loc2_)
         {
            playing = true;
         }
         copySourceToVisibleBitmap(!_animated);
         if(_animated)
         {
            drawBodyPart("eyes_type",_bodyBitmapData);
            _bodyBitmapData.unlock();
         }
         _avatarCompleted = true;
      }
      
      public function hideCensorBars() : void
      {
         if(_censorBars)
         {
            _censorBars.stop();
            if(_censorBars.parent)
            {
               _censorBars.stop();
               _censorBars.removeEventListener("censorBarsHidden",onCensorBarsHidden);
               if(_censorBars.parent)
               {
                  _censorBars.parent.removeChild(_censorBars);
               }
               _censorBars = null;
            }
         }
      }
      
      public function get averageRenderTime() : Number
      {
         if(_renderTimes.length == 0)
         {
            return 0;
         }
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _renderTimes;
         for each(var _loc1_ in _renderTimes)
         {
            _loc2_ = _loc2_ + _loc1_;
         }
         return _loc2_ / _renderTimes.length;
      }
      
      public function get measurePerformance() : Boolean
      {
         return _measurePerformance;
      }
      
      public function set measurePerformance(param1:Boolean) : void
      {
         _renderTimes.length = 0;
         _measurePerformance = param1;
      }
      
      public function areAllItemsLoaded(param1:Boolean = false) : Boolean
      {
         if(_allLoaded)
         {
            return true;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _itemsToLoad;
         for each(var _loc2_ in _itemsToLoad)
         {
            if(!_loc2_.isCompleted)
            {
               return false;
            }
         }
         if(param1)
         {
            var _loc6_:int = 0;
            var _loc5_:* = _itemsToLoad;
            for each(_loc2_ in _itemsToLoad)
            {
               _loc2_.showInstant();
            }
         }
         _allLoaded = true;
         return true;
      }
      
      public function get playing() : Boolean
      {
         return _playing;
      }
      
      public function set playing(param1:Boolean) : void
      {
         if(_playing == param1)
         {
            return;
         }
         _playing = param1;
         if(_playing)
         {
            addEventListener("enterFrame",onAnimate);
            if(_currentCache != _settingsHash)
            {
               clearCharacterCache();
               _currentCache = _settingsHash;
            }
            resetAnimationValues();
         }
         else
         {
            removeEventListener("enterFrame",onAnimate);
         }
      }
      
      private function copySourceToVisibleBitmap(param1:Boolean) : void
      {
         _bodyBitmapData.lock();
         _bodyBitmapData.copyPixels(_bodyBitmapDataBase,_drawRect,ZERO);
         if(!_animated)
         {
            _bodyBitmapData.copyPixels(_bodyBitmapDataFrontHair,_drawRect,ZERO,null,null,true);
         }
         if(param1)
         {
            _bodyBitmapData.unlock();
         }
      }
      
      private function createBodyImage() : void
      {
         var _loc5_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         _bodyBitmapDataBase.lock();
         _bodyBitmapDataBase.fillRect(_drawRect,0);
         var _loc2_:Boolean = _currentSettings.isMale;
         drawBodyPart("shadow");
         prepareHairColorFilter();
         drawBackHair();
         TMP_BITMAP.lock();
         TMP_BITMAP.fillRect(_drawRect,0);
         drawBodyPart("body",TMP_BITMAP);
         if(_currentSettings.isFemale)
         {
            switch(int(getChestItemQuality()))
            {
               case 0:
               case 1:
                  drawBodyPart("common",TMP_BITMAP);
                  break;
               case 2:
                  drawBodyPart("rare",TMP_BITMAP);
                  break;
               case 3:
                  drawBodyPart("epic",TMP_BITMAP);
            }
         }
         drawBodyPart("head_type",TMP_BITMAP);
         drawBodyPart("nose_type",TMP_BITMAP);
         drawBodyPart("mouth_type",TMP_BITMAP);
         setSkinColor();
         drawLightMouthParts();
         drawTattoo("tattoo_arm_left",TMP_BITMAP);
         drawTattoo("tattoo_arm_right",TMP_BITMAP);
         drawTattoo("tattoo_body",TMP_BITMAP);
         drawTattoo("tattoo_leg_left",TMP_BITMAP);
         drawTattoo("tattoo_leg_right",TMP_BITMAP);
         TMP_BITMAP.unlock();
         _bodyBitmapDataBase.copyPixels(TMP_BITMAP,_drawRect,ZERO,null,null,true);
         if(!_currentSettings.hasData("show_chest_item") || _currentSettings.show_chest_item == true)
         {
            _loc5_ = _currentSettings.chest;
         }
         else
         {
            _loc5_ = null;
            if(_currentSettings.isFemale && _currentSettings.chest != null && !_currentSettings.hasData("bra_quality"))
            {
               _currentSettings.bra_quality = CItemTemplate.fromId(_currentSettings.chest).quality;
            }
         }
         var _loc1_:Boolean = false;
         if(_loc5_)
         {
            _loc7_ = getDisplayOption(_loc5_);
            _loc1_ = _loc7_ == 7 || _loc7_ == 8;
         }
         if(!_currentSettings.hasData("show_legs_item") || _currentSettings.show_legs_item == true)
         {
            _loc6_ = _currentSettings.legs;
         }
         else
         {
            _loc6_ = null;
         }
         var _loc3_:Boolean = !_loc6_ && !_loc1_;
         if(_loc3_)
         {
            if(_currentSettings.hasData("panties_type") && _currentSettings.panties_type == 0 && _hidePantiesAllowed)
            {
               TMP_BITMAP.lock();
               TMP_BITMAP.fillRect(_drawRect,0);
               drawBodyPart("genitals_type",TMP_BITMAP);
               setSkinColor();
               TMP_BITMAP.unlock();
               _bodyBitmapDataBase.copyPixels(TMP_BITMAP,_drawRect,ZERO,null,null,true);
               prepareGenitalHairColorFilter();
               TMP_BITMAP.lock();
               TMP_BITMAP.fillRect(_drawRect,0);
               drawBodyPart("genitals_hair_type",TMP_BITMAP);
               TMP_BITMAP.applyFilter(TMP_BITMAP,_drawRect,ZERO,GENITAL_HAIR_COLOR_MATRIX_FILTER);
               _bodyBitmapDataBase.copyPixels(TMP_BITMAP,_drawRect,ZERO,null,null,true);
            }
            else
            {
               drawBodyPart("panties_type");
            }
         }
         var _loc4_:Boolean = !_loc2_ && !_loc5_;
         if(_loc4_)
         {
            drawBodyPart("bra_type");
         }
         if(_loc2_ && !_loc3_ || !_loc2_ && (!_loc4_ || !_loc3_))
         {
            if(_censorBars && (_censorBars is SymbolCharacterFCensorBars && _loc2_ || _censorBars is SymbolCharacterMCensorBars && !_loc2_))
            {
               _censorBars.stop();
               _censorBars.removeEventListener("censorBarsHidden",onCensorBarsHidden);
               if(_censorBars.parent)
               {
                  _censorBars.parent.removeChild(_censorBars);
               }
               _censorBars = null;
            }
            if(!_censorBars)
            {
               _censorBars = !!_loc2_?new SymbolCharacterMCensorBars():new SymbolCharacterFCensorBars();
               var _loc8_:* = 0.5;
               _censorBars.scaleY = _loc8_;
               _censorBars.scaleX = _loc8_;
               addChild(_censorBars);
               _censorBars.addEventListener("censorBarsHidden",onCensorBarsHidden);
            }
            _censorBarsTopNeeded = !_loc2_ && !_loc4_;
            _censorBarsBottomNeeded = !_loc3_;
            if(!_loc2_)
            {
               _censorBars.top.visible = false;
            }
            _censorBars.bottom.visible = false;
            _censorBars.gotoAndPlay("show");
         }
         else if(_censorBars)
         {
            _censorBars.stop();
            _censorBars.removeEventListener("censorBarsHidden",onCensorBarsHidden);
            if(_censorBars.parent)
            {
               _censorBars.parent.removeChild(_censorBars);
            }
            _censorBars = null;
         }
         if(!_animated)
         {
            drawBodyPart("eyes_type");
         }
         drawBodyPart("decoration_type");
         prepareFrontHair();
         if(_animated)
         {
            _breathFilter = new DisplacementMapFilter(!!_loc2_?M_BREATH:F_BREATH,ZERO,1,2,0,0,"ignore");
         }
         else
         {
            _bodyBitmapDataBase.copyPixels(_bodyBitmapDataFacialHair,_drawRect,ZERO,null,null,true);
         }
         _bodyBitmapDataBase.unlock();
         _bodyBitmap.smoothing = true;
      }
      
      private function onCensorBarsHidden(param1:Event = null) : void
      {
         _censorBars.removeEventListener("censorBarsHidden",onCensorBarsHidden);
         if(_censorBars.parent)
         {
            _censorBars.parent.removeChild(_censorBars);
         }
         _censorBars = null;
      }
      
      private function drawLightMouthParts() : void
      {
         TMP_BITMAP2.lock();
         var _loc1_:String = getAppearanceImageLinkeage("mouth_type");
         var _loc2_:BitmapData = getBodyBitmap(_loc1_);
         TMP_BITMAP2.threshold(_loc2_,_loc2_.rect,new Point(),"<=",15658734,0,16711680,true);
         TMP_BITMAP2.unlock();
         TMP_BITMAP.draw(TMP_BITMAP2,null,null,"hardlight");
      }
      
      private function drawBackHair() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(getDisplayOption(_currentSettings.head) == 5 && (!_currentSettings.hasData("show_head_item") || _currentSettings.show_head_item))
         {
            return;
         }
         _loc1_ = getAppearanceImageLinkeage("hair_back");
         if(_loc1_ && (!_currentSettings.show_head_item || _currentSettings.show_head_item && getDisplayOption(_currentSettings.head) != 6))
         {
            _loc2_ = getBodyBitmap(_loc1_);
            TMP_BITMAP.lock();
            TMP_BITMAP.fillRect(_drawRect,0);
            TMP_BITMAP.copyPixels(_loc2_,_loc2_.rect,ZERO);
            TMP_BITMAP.applyFilter(TMP_BITMAP,_drawRect,ZERO,HAIR_COLOR_MATRIX_FILTER);
            TMP_BITMAP.draw(_loc2_,null,HAIR_DARKENER,"overlay");
            TMP_BITMAP.unlock();
            _bodyBitmapDataBase.copyPixels(TMP_BITMAP,_drawRect,ZERO,null,null,true);
         }
         _loc1_ = getAppearanceImageLinkeage("hair_middle");
         if(_loc1_)
         {
            _loc2_ = getBodyBitmap(_loc1_);
            TMP_BITMAP.lock();
            TMP_BITMAP.fillRect(_drawRect,0);
            TMP_BITMAP.copyPixels(_loc2_,_loc2_.rect,ZERO);
            TMP_BITMAP.applyFilter(TMP_BITMAP,_drawRect,ZERO,HAIR_COLOR_MATRIX_FILTER);
            TMP_BITMAP.draw(_loc2_,null,HAIR_DARKENER,"overlay");
            TMP_BITMAP.unlock();
            _bodyBitmapDataBase.copyPixels(TMP_BITMAP,_drawRect,ZERO,null,null,true);
         }
      }
      
      private function prepareFrontHair() : void
      {
         var _loc1_:* = null;
         prepareEyebrowsColorFilter();
         _bodyBitmapDataFacialHair.lock();
         _loc1_ = getAppearanceImageLinkeage("facial_hair_type");
         if(_loc1_)
         {
            prepareFacialHairColorFilter();
            TMP_BITMAP.lock();
            TMP_BITMAP.fillRect(_drawRect,0);
            drawBodyPart("facial_hair_type",TMP_BITMAP);
            TMP_BITMAP.applyFilter(TMP_BITMAP,_drawRect,ZERO,FACIAL_HAIR_COLOR_MATRIX_FILTER);
            TMP_BITMAP.unlock();
            _bodyBitmapDataFacialHair.copyPixels(TMP_BITMAP,_drawRect,ZERO);
         }
         else
         {
            _bodyBitmapDataFacialHair.fillRect(_drawRect,0);
         }
         TMP_BITMAP.lock();
         TMP_BITMAP.fillRect(_drawRect,0);
         drawBodyPart("eyebrows_type",TMP_BITMAP);
         TMP_BITMAP.applyFilter(TMP_BITMAP,_drawRect,ZERO,EYEBROWS_COLOR_MATRIX_FILTER);
         TMP_BITMAP.unlock();
         _bodyBitmapDataFacialHair.copyPixels(TMP_BITMAP,_drawRect,ZERO,null,null,true);
         _bodyBitmapDataFacialHair.draw(TMP_BITMAP,null,HAIR_DARKENER,"overlay");
         _bodyBitmapDataFacialHair.unlock();
         _itemLayers.removeChild(_bodyBitmapFacialHair);
         _itemLayers.addChildAt(_bodyBitmapFacialHair,_itemLayers.getChildIndex(_layerItemHead));
         _bodyBitmapFacialHair.visible = true;
         _bodyBitmapDataFrontHair.lock();
         if(getDisplayOption(_currentSettings.head) == 5 && (!_currentSettings.hasData("show_head_item") || _currentSettings.show_head_item))
         {
            _bodyBitmapDataFrontHair.fillRect(_drawRect,0);
            _bodyBitmapDataFrontHair.unlock();
            return;
         }
         TMP_BITMAP2.lock();
         TMP_BITMAP2.fillRect(_drawRect,0);
         drawBodyPart("hair_front",TMP_BITMAP2);
         TMP_BITMAP2.unlock();
         _bodyBitmapDataFrontHair.copyPixels(TMP_BITMAP2,_drawRect,ZERO);
         _bodyBitmapDataFrontHair.applyFilter(_bodyBitmapDataFrontHair,_drawRect,ZERO,HAIR_COLOR_MATRIX_FILTER);
         _bodyBitmapDataFrontHair.draw(TMP_BITMAP2,null,HAIR_DARKENER,"overlay");
         _bodyBitmapDataFrontHair.unlock();
         _itemLayers.removeChild(_bodyBitmapFrontHair);
         if(getDisplayOption(_currentSettings.head) == 9 && _currentSettings.show_head_item)
         {
            _headBehindHairs = true;
            _itemLayers.addChild(_bodyBitmapFrontHair);
         }
         else
         {
            _headBehindHairs = false;
            _itemLayers.addChildAt(_bodyBitmapFrontHair,_itemLayers.getChildIndex(_layerItemHead));
         }
         _bodyBitmapFrontHair.visible = true;
      }
      
      private function prepareHairColorFilter() : void
      {
         var _loc1_:Object = HAIR_COLORS[_currentSettings.hair_color];
         var _loc2_:AdjustColor = new AdjustColor();
         var _loc4_:int = 0;
         _loc2_.saturation = _loc4_;
         _loc2_.hue = _loc4_;
         _loc2_.brightness = _loc1_.brightness;
         _loc2_.contrast = _loc1_.contrast;
         var _loc3_:Array = _loc2_.CalculateFinalFlatArray();
         _loc3_[4] = _loc1_.r + _loc3_[4];
         _loc3_[9] = _loc1_.g + _loc3_[9];
         _loc3_[14] = _loc1_.b + _loc3_[14];
         HAIR_COLOR_MATRIX_FILTER.matrix = _loc3_;
      }
      
      private function prepareEyebrowsColorFilter() : void
      {
         var _loc1_:Object = HAIR_COLORS[_currentSettings.eyebrows_color];
         var _loc2_:AdjustColor = new AdjustColor();
         var _loc4_:int = 0;
         _loc2_.saturation = _loc4_;
         _loc2_.hue = _loc4_;
         _loc2_.brightness = _loc1_.brightness;
         _loc2_.contrast = _loc1_.contrast;
         var _loc3_:Array = _loc2_.CalculateFinalFlatArray();
         _loc3_[4] = _loc1_.r + _loc3_[4];
         _loc3_[9] = _loc1_.g + _loc3_[9];
         _loc3_[14] = _loc1_.b + _loc3_[14];
         EYEBROWS_COLOR_MATRIX_FILTER.matrix = _loc3_;
      }
      
      private function prepareFacialHairColorFilter() : void
      {
         var _loc1_:Object = HAIR_COLORS[_currentSettings.facial_hair_color];
         var _loc2_:AdjustColor = new AdjustColor();
         var _loc4_:int = 0;
         _loc2_.saturation = _loc4_;
         _loc2_.hue = _loc4_;
         _loc2_.brightness = _loc1_.brightness;
         _loc2_.contrast = _loc1_.contrast;
         var _loc3_:Array = _loc2_.CalculateFinalFlatArray();
         _loc3_[4] = _loc1_.r + _loc3_[4];
         _loc3_[9] = _loc1_.g + _loc3_[9];
         _loc3_[14] = _loc1_.b + _loc3_[14];
         FACIAL_HAIR_COLOR_MATRIX_FILTER.matrix = _loc3_;
      }
      
      private function prepareGenitalHairColorFilter() : void
      {
         var _loc1_:Object = HAIR_COLORS[_currentSettings.genitals_hair_color];
         var _loc2_:AdjustColor = new AdjustColor();
         var _loc4_:int = 0;
         _loc2_.saturation = _loc4_;
         _loc2_.hue = _loc4_;
         _loc2_.brightness = _loc1_.brightness;
         _loc2_.contrast = _loc1_.contrast;
         var _loc3_:Array = _loc2_.CalculateFinalFlatArray();
         _loc3_[4] = _loc1_.r + _loc3_[4];
         _loc3_[9] = _loc1_.g + _loc3_[9];
         _loc3_[14] = _loc1_.b + _loc3_[14];
         GENITAL_HAIR_COLOR_MATRIX_FILTER.matrix = _loc3_;
      }
      
      private function getChestItemQuality() : int
      {
         var _loc1_:String = _currentSettings.chest;
         if(!_loc1_)
         {
            if(_currentSettings.hasData("bra_quality"))
            {
               return parseInt(_currentSettings.bra_quality as String);
            }
            return 1;
         }
         if(CItemTemplate.exists(_loc1_))
         {
            return CItemTemplate.fromId(_loc1_).quality;
         }
         return 1;
      }
      
      private function drawBodyPart(param1:String, param2:BitmapData = null, param3:Point = null) : void
      {
         var _loc6_:* = null;
         var _loc4_:String = getAppearanceImageLinkeage(param1);
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:BitmapData = getBodyBitmap(_loc4_);
         if(_loc5_)
         {
            _loc6_ = param2 == null?_bodyBitmapDataBase:param2;
            _loc6_.copyPixels(_loc5_,_loc5_.rect,param3 || ZERO,null,null,true);
         }
      }
      
      private function drawTattoo(param1:String, param2:BitmapData = null, param3:Point = null) : void
      {
         var _loc6_:* = null;
         var _loc4_:String = getAppearanceImageLinkeage(param1);
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:BitmapData = getBodyBitmap(_loc4_);
         if(_loc5_)
         {
            _loc6_ = param2 == null?_bodyBitmapDataBase:param2;
            _loc6_.draw(_loc5_,null,null,"multiply");
         }
      }
      
      private function setSkinColor() : void
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         if(!_currentSettings.hasData("skin_color"))
         {
            return;
         }
         var _loc4_:int = _currentSettings.skin_color;
         var _loc1_:String = _currentSettings.gender;
         var _loc2_:Object = SKIN_COLORS[_currentSettings.gender][_loc4_];
         if(_loc2_ && _loc2_.type == "adjust")
         {
            _loc3_ = new AdjustColor();
            _loc3_.brightness = _loc2_.brightness;
            _loc3_.contrast = _loc2_.contrast;
            _loc3_.hue = _loc2_.hue;
            _loc3_.saturation = _loc2_.saturation;
            _loc5_ = _loc3_.CalculateFinalFlatArray();
         }
         else
         {
            _loc5_ = [1,0,0,0,_loc2_["redMultiplier"] * 0.3,0,1,0,0,_loc2_["greenMultiplier"] * 0.3,0,0,1,0,_loc2_["blueMultiplier"] * 0.3,0,0,0,1,0];
         }
         SKIN_COLOR_MATRIX_FILTER.matrix = _loc5_;
         TMP_BITMAP.applyFilter(TMP_BITMAP,_drawRect,ZERO,SKIN_COLOR_MATRIX_FILTER);
      }
      
      private function getDisplayOption(param1:String) : int
      {
         var _loc2_:int = 0;
         if(param1 != null)
         {
            if(CItemTemplate.exists(param1))
            {
               _loc2_ = CItemTemplate.fromId(param1).displayOptions;
               return _loc2_;
            }
         }
         return 0;
      }
      
      private function getEquipmentIdentifier(param1:int) : String
      {
         var _loc2_:String = null;
         switch(int(param1) - 1)
         {
            case 0:
               _loc2_ = "head";
               break;
            case 1:
               _loc2_ = "chest";
               break;
            case 2:
               _loc2_ = "belt";
               break;
            case 3:
               _loc2_ = "legs";
               break;
            case 4:
               _loc2_ = "boots";
            default:
               _loc2_ = "boots";
            default:
               _loc2_ = "boots";
            default:
               _loc2_ = "boots";
            default:
               _loc2_ = "boots";
         }
         if(_loc2_ != null && _currentSettings.hasData(_loc2_,true))
         {
            return _currentSettings.getString(_loc2_);
         }
         return null;
      }
      
      private function setEquipment(param1:int, param2:AppearanceSettings) : void
      {
         var _loc8_:* = null;
         var _loc11_:int = 0;
         var _loc4_:* = null;
         var _loc10_:Boolean = false;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc3_:String = null;
         var _loc7_:String = null;
         switch(int(param1) - 1)
         {
            case 0:
               _loc3_ = "head";
               _loc7_ = "layerItemHead";
               if(param2.hasData("show_head_item") && param2.show_head_item == false)
               {
                  param2.setData(_loc3_,null);
               }
               else
               {
                  _loc8_ = param2.getString(_loc3_);
                  if(_loc8_ != null)
                  {
                     _loc11_ = getDisplayOption(_loc8_);
                  }
               }
               break;
            case 1:
               _loc3_ = "chest";
               _loc7_ = "layerItemChestFront";
               if(param2.hasData("show_chest_item") && param2.show_chest_item == false)
               {
                  param2.setData(_loc3_,null);
                  emptyLayer("layerItemChestBack");
                  emptyLayer("layerItemChestFront");
               }
               else
               {
                  _loc8_ = param2.getString(_loc3_);
                  if(_loc8_ != null)
                  {
                     _loc11_ = getDisplayOption(_loc8_);
                     if(_loc11_ == 1 || _loc11_ == 0)
                     {
                        _loc7_ = "layerItemChestFront";
                        emptyLayer("layerItemChestBack");
                     }
                     else if(_loc11_ == 2)
                     {
                        _loc7_ = "layerItemChestBack";
                        emptyLayer("layerItemChestFront");
                     }
                     else if(_loc11_ == 3)
                     {
                        _loc4_ = getEquipmentIdentifier(5);
                        _loc10_ = true;
                        if(_loc4_ != null && (!param2.hasData("show_boots_item") || param2.show_boots_item == true))
                        {
                           _loc6_ = getDisplayOption(_loc4_);
                           if(_loc6_ == 4)
                           {
                              _loc10_ = false;
                           }
                        }
                        if(_loc10_)
                        {
                           _loc7_ = "layerItemChestFront";
                           emptyLayer("layerItemChestBack");
                        }
                        else
                        {
                           _loc7_ = "layerItemChestBack";
                           emptyLayer("layerItemChestFront");
                        }
                     }
                     else if(_loc11_ == 7)
                     {
                        _loc7_ = "layerItemChestBack";
                        emptyLayer("layerItemChestFront");
                        emptyLayer("layerItemLegsFront");
                        emptyLayer("layerItemLegsBack");
                     }
                     else if(_loc11_ == 8)
                     {
                        _loc7_ = "layerItemChestFront";
                        emptyLayer("layerItemChestBack");
                        emptyLayer("layerItemLegsFront");
                        emptyLayer("layerItemLegsBack");
                     }
                  }
                  else
                  {
                     emptyLayer("layerItemChestFront");
                     emptyLayer("layerItemChestBack");
                  }
               }
               break;
            case 2:
               _loc3_ = "belt";
               _loc7_ = "layerItemBelt";
               if(param2.hasData("show_belt_item") && param2.show_belt_item == false)
               {
                  param2.setData(_loc3_,null);
               }
               break;
            case 3:
               _loc3_ = "legs";
               _loc7_ = "layerItemLegsFront";
               if(param2.hasData("show_legs_item") && param2.show_legs_item == false)
               {
                  param2.setData(_loc3_,null);
                  emptyLayer("layerItemLegsFront");
                  emptyLayer("layerItemLegsBack");
               }
               else
               {
                  _loc8_ = param2.getString(_loc3_);
                  if(_loc8_ != null)
                  {
                     _loc11_ = getDisplayOption(_loc8_);
                     if(_loc11_ == 1)
                     {
                        _loc7_ = "layerItemLegsFront";
                        emptyLayer("layerItemLegsBack");
                     }
                     else if(_loc11_ == 3)
                     {
                        _loc4_ = getEquipmentIdentifier(5);
                        _loc10_ = true;
                        if(_loc4_ != null && (!param2.hasData("show_boots_item") || param2.show_boots_item == true))
                        {
                           _loc6_ = getDisplayOption(_loc4_);
                           if(_loc6_ == 4)
                           {
                              _loc10_ = false;
                           }
                        }
                        if(_loc10_)
                        {
                           _loc7_ = "layerItemLegsFront";
                           emptyLayer("layerItemLegsBack");
                        }
                        else
                        {
                           _loc7_ = "layerItemLegsBack";
                           emptyLayer("layerItemLegsFront");
                        }
                     }
                     else
                     {
                        _loc7_ = "layerItemLegsBack";
                        emptyLayer("layerItemLegsFront");
                     }
                  }
                  else
                  {
                     _loc7_ = "layerItemLegsBack";
                     emptyLayer("layerItemLegsFront");
                  }
               }
               break;
            case 4:
               _loc3_ = "boots";
               _loc7_ = "layerItemBoots";
               if(param2.hasData("show_boots_item") && param2.show_boots_item == false)
               {
                  param2.setData(_loc3_,null);
               }
            default:
               _loc3_ = "boots";
               _loc7_ = "layerItemBoots";
               if(param2.hasData("show_boots_item") && param2.show_boots_item == false)
               {
                  param2.setData(_loc3_,null);
               }
            default:
               _loc3_ = "boots";
               _loc7_ = "layerItemBoots";
               if(param2.hasData("show_boots_item") && param2.show_boots_item == false)
               {
                  param2.setData(_loc3_,null);
               }
            default:
               _loc3_ = "boots";
               _loc7_ = "layerItemBoots";
               if(param2.hasData("show_boots_item") && param2.show_boots_item == false)
               {
                  param2.setData(_loc3_,null);
               }
            default:
               _loc3_ = "boots";
               _loc7_ = "layerItemBoots";
               if(param2.hasData("show_boots_item") && param2.show_boots_item == false)
               {
                  param2.setData(_loc3_,null);
               }
         }
         if(_loc3_ != null && _loc7_ != null)
         {
            if(!param2.hasData(_loc3_,true))
            {
               emptyLayer(_loc7_);
               return;
            }
            _loc5_ = getEquipmentImageUrl(param2.getString(_loc3_),param2.gender);
            _loc9_ = updateLayer(_loc7_,_loc5_);
            if(_censorBars && _loc9_)
            {
               if(param1 == 2 && _censorBarsTopNeeded && !isAssetLoaded(_loc9_))
               {
                  _censorBars.top.visible = true;
                  if(_loc11_ == 7 || _loc11_ == 8)
                  {
                     _censorBars.bottom.visible = true;
                  }
               }
               if(param1 == 4 && _censorBarsBottomNeeded && !isAssetLoaded(_loc9_))
               {
                  _censorBars.bottom.visible = true;
               }
            }
         }
      }
      
      private function isAssetLoaded(param1:UriDisplayObjectAsset) : Boolean
      {
         if(!param1.isDownloaded)
         {
            return false;
         }
         if(param1.realLoader && param1.realLoader.alpha < 1)
         {
            return false;
         }
         if(param1.alpha < 1)
         {
            return false;
         }
         return true;
      }
      
      private function emptyLayer(param1:String) : void
      {
         var _loc5_:int = 0;
         var _loc3_:MovieClip = _itemLayers.getChildByName(param1) as MovieClip;
         var _loc4_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         _loc5_ = 0;
         while(_loc5_ < _loc3_.numChildren)
         {
            _loc4_.push(_loc3_.getChildAt(_loc5_));
            _loc5_++;
         }
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for each(var _loc2_ in _loc4_)
         {
            _loc3_.removeChild(_loc2_);
         }
      }
      
      private function updateLayer(param1:String, param2:String) : UriDisplayObjectAsset
      {
         emptyLayer(param1);
         if(param2 == null)
         {
            return null;
         }
         var _loc4_:int = 212;
         var _loc5_:int = 450;
         var _loc3_:DisplayObjectContainer = UriDisplayObjectAsset.load(param2,_loc4_,_loc5_,true,5);
         if(param2.indexOf("SymbolCharacter") == -1)
         {
            _itemsToLoad.push(_loc3_);
         }
         (_itemLayers.getChildByName(param1) as MovieClip).addChild(_loc3_);
         return _loc3_ as UriDisplayObjectAsset;
      }
      
      private function getEquipmentImageUrl(param1:String, param2:String) : String
      {
         var _loc3_:String = !!_large?"items_hd/":"items/";
         return Assets.assetURL(_loc3_ + Item.getBaseIdentifier(param1) + "_" + param2,"png");
      }
      
      private function getAppearanceImageLinkeage(param1:String) : String
      {
         var _loc13_:Boolean = false;
         var _loc7_:* = undefined;
         var _loc9_:Boolean = false;
         var _loc11_:CCharacterAppearance = null;
         var _loc6_:Vector.<int> = null;
         var _loc4_:Vector.<Boolean> = null;
         if(param1 == "hair_back")
         {
            _loc11_ = CCharacterAppearance.fromId(_currentSettings.gender);
            _loc6_ = _loc11_.hairType;
            _loc4_ = _loc11_.hairBack;
            if(_loc4_.length == 0)
            {
               return null;
            }
            _loc13_ = _loc4_[getAppearanceValueIndex(_loc6_,_currentSettings.hair_type)];
            if(!_loc13_)
            {
               return null;
            }
         }
         if(param1 == "hair_middle")
         {
            _loc11_ = CCharacterAppearance.fromId(_currentSettings.gender);
            _loc6_ = _loc11_.hairType;
            _loc7_ = _loc11_.hairMiddle;
            if(_loc7_.length == 0)
            {
               return null;
            }
            _loc9_ = _loc7_[getAppearanceValueIndex(_loc6_,_currentSettings.hair_type)];
            if(!_loc9_)
            {
               return null;
            }
         }
         var _loc5_:String = _currentSettings.gender;
         var _loc12_:String = "";
         var _loc10_:String = "";
         var _loc2_:int = -1;
         var _loc14_:* = param1;
         switch(_loc14_)
         {
            case "shadow":
               _loc12_ = "Shadow";
               break;
            case "body":
               _loc12_ = "Body";
               break;
            case "common":
               _loc12_ = "BodyCommon";
               break;
            case "rare":
               _loc12_ = "BodyRare";
               break;
            case "epic":
               _loc12_ = "BodyEpic";
               break;
            case "decoration_type":
               _loc12_ = "Extra";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "eyebrows_type":
               _loc12_ = "Brows";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "eyes_type":
               _loc12_ = "Eyes";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "eyes_blink":
               _loc12_ = "Eyes";
               _loc10_ = "b";
               _loc2_ = _currentSettings.eyes_type;
               break;
            case "facial_hair_type":
               _loc12_ = "Fhair";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "hair_front":
               _loc12_ = "Hair";
               _loc2_ = _currentSettings.hair_type;
               break;
            case "hair_back":
               _loc12_ = "Hair";
               _loc10_ = "b";
               _loc2_ = _currentSettings.hair_type;
               break;
            case "hair_middle":
               _loc12_ = "Hair";
               _loc10_ = "m";
               _loc2_ = _currentSettings.hair_type;
               break;
            case "head_type":
               _loc12_ = "Face";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "mouth_type":
               _loc12_ = "Mouth";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "nose_type":
               _loc12_ = "Nose";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "tattoo_arm_left":
               _loc12_ = "Tattoo_arm_left";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "tattoo_arm_right":
               _loc12_ = "Tattoo_arm_right";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "tattoo_body":
               _loc12_ = "Tattoo_body";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "tattoo_leg_left":
               _loc12_ = "Tattoo_leg_left";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "tattoo_leg_right":
               _loc12_ = "Tattoo_leg_right";
               _loc2_ = _currentSettings.getAppearance(param1);
               break;
            case "bra_type":
               _loc12_ = "Bra";
               if(!_currentSettings.hasData(param1))
               {
                  _loc2_ = 1;
               }
               else
               {
                  _loc2_ = _currentSettings.getAppearance(param1);
               }
               if(_loc2_ == 0 && _hideBraAllowed)
               {
                  return null;
               }
               break;
            case "panties_type":
               _loc12_ = "Panties";
               if(!_currentSettings.hasData(param1))
               {
                  _loc2_ = 1;
               }
               else
               {
                  _loc2_ = _currentSettings.getAppearance(param1);
               }
               if(_loc2_ == 0 && _hidePantiesAllowed)
               {
                  return null;
               }
               break;
            case "genitals_type":
               _loc12_ = "Genitals";
               _loc2_ = _currentSettings.getAppearance(param1);
               if(!_currentSettings.hasData(param1))
               {
                  _loc2_ = 1;
               }
               else
               {
                  _loc2_ = _currentSettings.getAppearance(param1);
               }
               break;
            case "genitals_hair_type":
               _loc12_ = "GenitalsHair";
               _loc2_ = _currentSettings.getAppearance(param1);
               if(!_currentSettings.hasData(param1))
               {
                  _loc2_ = 1;
               }
               else
               {
                  _loc2_ = _currentSettings.getAppearance(param1);
               }
               break;
            default:
               throw new Error("Unhandled appearance type: " + param1);
         }
         if(_loc2_ == 0 && param1 != "panties_type" && param1 != "bra_type")
         {
            return null;
         }
         if(param1 == "head_type" && _currentSettings.facial_hair_type == 1)
         {
            _loc10_ = "b";
         }
         if(param1 == "bra_type")
         {
            _loc10_ = "Common";
            switch(int(getChestItemQuality()) - 1)
            {
               case 0:
                  _loc10_ = "Common";
                  break;
               case 1:
                  _loc10_ = "Rare";
                  break;
               case 2:
                  _loc10_ = "Epic";
            }
         }
         if(param1 == "tattoo_body" && _loc5_ == "f")
         {
            switch(int(getChestItemQuality()))
            {
               case 0:
               case 1:
                  _loc10_ = "_1";
                  break;
               case 2:
                  _loc10_ = "_2";
                  break;
               case 3:
                  _loc10_ = "_3";
            }
         }
         var _loc3_:String = _loc2_ >= 0?_loc2_.toString():"";
         var _loc8_:String = "SymbolCharacter" + _loc5_.toUpperCase() + _loc12_ + _loc3_ + _loc10_;
         return _loc8_;
      }
      
      private function onCheckLoadingStatus(param1:Event) : void
      {
         if(areAllItemsLoaded())
         {
            removeEventListener("enterFrame",onCheckLoadingStatus);
            if(_censorBars)
            {
               _censorBars.gotoAndPlay("hide");
            }
         }
      }
      
      private function resetAnimationValues() : void
      {
         _frameTicks = 0;
      }
      
      private function onAnimate(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = NaN;
         var _loc2_:* = null;
         if(!_allLoaded)
         {
            return;
         }
         if(!_itemsCopied)
         {
            prepareFinalAnimationBitmaps();
            resetAnimationValues();
            if(!enableAnimations)
            {
               copySourceToVisibleBitmap(false);
               drawBodyPart("eyes_type",_bodyBitmapData);
               _bodyBitmapData.copyPixels(_bodyBitmapDataFrontHair,_drawRect,ZERO,null,null,true);
               _bodyBitmapData.unlock();
            }
         }
         else if(enableAnimations)
         {
            _frameTicks = Number(_frameTicks) + 1;
         }
         else
         {
            resetAnimationValues();
            return;
         }
         if(_frameTicks % BREATH_FRAME_DELAY > 0)
         {
            return;
         }
         var _loc3_:int = _frameTicks / BREATH_FRAME_DELAY % (BREATH_FRAMES * 2);
         if(CHARACTER_CACHE[_loc3_] != null)
         {
            _bodyBitmapData.lock();
            _bodyBitmapData.copyPixels(CHARACTER_CACHE[_loc3_],_drawRect,ZERO);
            _bodyBitmapData.unlock();
         }
         else
         {
            _loc4_ = Runtime.getTimer();
            copySourceToVisibleBitmap(false);
            if(_loc3_ > BLINK_DELAY && _loc3_ < BLINK_DELAY + BLINK_DURATION)
            {
               drawBodyPart("eyes_blink",_bodyBitmapData);
            }
            else
            {
               drawBodyPart("eyes_type",_bodyBitmapData);
            }
            _bodyBitmapData.copyPixels(_bodyBitmapDataFrontHair,_drawRect,ZERO,null,null,true);
            _loc5_ = 0;
            _loc2_ = Quint.easeOut;
            if(_loc3_ < BREATH_FRAMES)
            {
               _loc5_ = Number(_loc2_.getRatio(_loc3_ / BREATH_FRAMES));
            }
            else
            {
               _loc5_ = Number(1 - _loc2_.getRatio((_loc3_ - BREATH_FRAMES) / BREATH_FRAMES));
            }
            _loc5_ = Number(_loc5_ * BREATH_MAX_VALUE);
            _breathFilter.scaleX = _loc5_ * 0.8;
            _breathFilter.scaleY = _loc5_;
            _bodyBitmapData.applyFilter(_bodyBitmapData,_drawRect,ZERO,_breathFilter);
            _bodyBitmapData.unlock();
            CHARACTER_CACHE[_loc3_] = _bodyBitmapData.clone();
            if(measurePerformance)
            {
               _renderTimes.push(Runtime.getTimer() - _loc4_);
            }
         }
      }
      
      private function prepareFinalAnimationBitmaps() : void
      {
         TMP_BITMAP.lock();
         TMP_BITMAP.fillRect(_drawRect,0);
         TMP_BITMAP.copyPixels(_bodyBitmapDataFacialHair,_drawRect,ZERO,null,null,true);
         if(_headBehindHairs)
         {
            TMP_BITMAP.draw(_layerItemHead,ITEM_DRAW_MATRIX,null,null,null,true);
            TMP_BITMAP.copyPixels(_bodyBitmapDataFrontHair,_drawRect,ZERO,null,null,true);
         }
         else
         {
            TMP_BITMAP.copyPixels(_bodyBitmapDataFrontHair,_drawRect,ZERO,null,null,true);
            TMP_BITMAP.draw(_layerItemHead,ITEM_DRAW_MATRIX,null,null,null,true);
         }
         TMP_BITMAP.unlock();
         _bodyBitmapDataFrontHair.lock();
         _bodyBitmapDataFrontHair.copyPixels(TMP_BITMAP,_drawRect,ZERO);
         _bodyBitmapDataFrontHair.unlock();
         _layerItemHead.visible = false;
         _bodyBitmapFrontHair.visible = false;
         _bodyBitmapFacialHair.visible = false;
         _bodyBitmapDataBase.lock();
         _bodyBitmapDataBase.draw(_itemLayers,ITEM_DRAW_MATRIX,null,null,null,true);
         _bodyBitmapDataBase.unlock();
         _itemLayers.visible = false;
         _layerItemHead.visible = true;
         _itemsCopied = true;
      }
   }
}

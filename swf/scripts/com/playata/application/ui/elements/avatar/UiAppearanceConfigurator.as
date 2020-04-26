package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.constants.CCharacterAppearance;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   
   public class UiAppearanceConfigurator
   {
      
      private static var DIFFERENT_FACE_STYLES:int = 2;
       
      
      protected var _configurator:IDisplayObjectContainer = null;
      
      protected var _onUpdate:Function = null;
      
      protected var _currentSettings:AppearanceSettings;
      
      protected var _costCoins:int;
      
      protected var _costPremium:int;
      
      protected var _prices:StringMap;
      
      protected var _relevantAppearances:Array;
      
      public function UiAppearanceConfigurator(param1:IDisplayObjectContainer, param2:Function, param3:Array)
      {
         _currentSettings = new AppearanceSettings({});
         super();
         _configurator = param1;
         _onUpdate = param2;
         _costPremium = 0;
         _costCoins = 0;
         _relevantAppearances = param3;
         _prices = new StringMap();
         var _loc6_:int = 0;
         var _loc5_:* = param3;
         for each(var _loc4_ in param3)
         {
            _prices.setData(_loc4_,new PriceInformation());
         }
         _currentSettings.gender = NumberUtil.randomInt(0,1) == 1?"m":"f";
         initAppearances();
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
      
      public static function getAvailableAppearances(param1:String, param2:int = -1, param3:int = -1) : StringMap
      {
         var _loc7_:* = undefined;
         var _loc9_:* = undefined;
         var _loc5_:* = undefined;
         var _loc10_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:CCharacterAppearance = CCharacterAppearance.fromId(param1);
         var _loc11_:StringMap = new StringMap();
         var _loc13_:int = 0;
         var _loc12_:* = _loc4_.constantKeys;
         for each(var _loc8_ in _loc4_.constantKeys)
         {
            if(!(_loc8_ == "hair_back" || _loc8_ == "hair_middle" || _loc8_.indexOf("change_cost") > 0 || _loc8_.indexOf("change_required_level") > 0 || _loc8_.indexOf("_style") > 0))
            {
               _loc11_.setData(_loc8_,new Vector.<int>(0));
               _loc7_ = _loc4_.getIntVector(_loc8_);
               _loc9_ = _loc4_.getIntVector(_loc8_ + "_change_required_level");
               _loc5_ = _loc4_.getIntVector(_loc8_ + "_style");
               _loc10_ = 0;
               while(_loc10_ < _loc7_.length)
               {
                  _loc6_ = _loc7_[_loc10_];
                  if(!(_loc9_ != null && param3 >= 0 && _loc9_[_loc10_] > param3))
                  {
                     if(!(_loc5_ != null && param2 >= 0 && _loc5_[_loc10_] != param2))
                     {
                        _loc11_.getData(_loc8_).push(_loc6_);
                     }
                  }
                  _loc10_++;
               }
               continue;
            }
         }
         return _loc11_;
      }
      
      public function get costCoins() : int
      {
         return _costCoins;
      }
      
      public function get costPremium() : int
      {
         return _costPremium;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _configurator.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         return _configurator.visible;
      }
      
      public function dispose() : void
      {
         _configurator = null;
      }
      
      public function get isMale() : Boolean
      {
         return _currentSettings.gender == "m";
      }
      
      public function set currentSettings(param1:AppearanceSettings) : void
      {
         _currentSettings = new AppearanceSettings({});
         _currentSettings.gender = param1.gender;
         var _loc2_:StringMap = getAvailableAppearances(_currentSettings.gender);
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_.keys;
         for each(var _loc3_ in _loc2_.keys)
         {
            _currentSettings.setAppearance(_loc3_,param1.getAppearance(_loc3_));
            if(_relevantAppearances.indexOf(_loc3_) >= 0)
            {
               updatePriceTag(_loc3_);
            }
         }
         if(param1.gender == "f")
         {
            if(param1.hasData("bra_quality"))
            {
               _currentSettings.bra_quality = param1.bra_quality;
            }
            else if(param1.chest != null)
            {
               _currentSettings.bra_quality = CItemTemplate.fromId(param1.chest).quality;
            }
            else
            {
               _currentSettings.bra_quality = "_common";
            }
         }
      }
      
      public function get currentSettings() : AppearanceSettings
      {
         if(!_currentSettings.hasData("facial_hair_type"))
         {
            _currentSettings.facial_hair_type = 0;
         }
         if(!_currentSettings.hasData("bra_type"))
         {
            _currentSettings.bra_type = 0;
         }
         return new AppearanceSettings(_currentSettings);
      }
      
      public function refreshLocalization() : void
      {
      }
      
      public function getRelevantSettings(param1:AppearanceSettings) : AppearanceSettings
      {
         var _loc4_:AppearanceSettings = new AppearanceSettings({});
         _loc4_.gender = param1.gender;
         var _loc2_:StringMap = getAvailableAppearances(_currentSettings.gender);
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_.keys;
         for each(var _loc3_ in _loc2_.keys)
         {
            if(_relevantAppearances.indexOf(_loc3_) >= 0)
            {
               _loc4_.setAppearance(_loc3_,_currentSettings.getAppearance(_loc3_));
            }
            else
            {
               _loc4_.setAppearance(_loc3_,param1.getAppearance(_loc3_));
            }
         }
         return _loc4_;
      }
      
      protected function initAppearances() : void
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:int = User.current == null?1:User.current.character.level;
         var _loc1_:StringMap = getAvailableAppearances(_currentSettings.gender,NumberUtil.randomInt(0,DIFFERENT_FACE_STYLES - 1),_loc5_);
         var _loc7_:int = 0;
         var _loc6_:* = _loc1_.keys;
         for each(var _loc2_ in _loc1_.keys)
         {
            _loc3_ = _loc1_.getData(_loc2_);
            if(_loc3_.length > 0)
            {
               if((_loc2_ == "facial_hair_type" || _loc2_ == "decoration_type") && NumberUtil.randomInt(0,1) == 1)
               {
                  _currentSettings.setAppearance(_loc2_,_loc3_[0]);
               }
               else if(_loc2_ == "skin_color")
               {
                  _currentSettings.setAppearance(_loc2_,_loc3_[0]);
               }
               else if(_loc2_.indexOf("tattoo_") == 0)
               {
                  _currentSettings.setAppearance(_loc2_,_loc3_[0]);
               }
               else if(_loc2_ == "bra_type")
               {
                  _currentSettings.setAppearance(_loc2_,_loc3_[1]);
               }
               else if(_loc2_ == "panties_type")
               {
                  _currentSettings.setAppearance(_loc2_,_loc3_[1]);
               }
               else if(_loc2_ == "genitals_type")
               {
                  _currentSettings.setAppearance(_loc2_,_loc3_[0]);
               }
               else if(_loc2_ == "genitals_hair_type")
               {
                  _currentSettings.setAppearance(_loc2_,_loc3_[0]);
               }
               else if(_loc2_ == "genitals_hair_color")
               {
                  _currentSettings.setAppearance(_loc2_,_loc3_[0]);
               }
               else if(_loc2_ == "photo_sexuality_type")
               {
                  _currentSettings.setAppearance(_loc2_,_loc3_[0]);
               }
               else
               {
                  _loc4_ = NumberUtil.randomInt(0,_loc3_.length - 1);
                  _currentSettings.setAppearance(_loc2_,_loc3_[_loc4_]);
               }
            }
            if(_relevantAppearances.indexOf(_loc2_) >= 0)
            {
               updatePriceTag(_loc2_);
            }
         }
         _currentSettings.eyebrows_color = _currentSettings.hair_color;
         _currentSettings.facial_hair_color = _currentSettings.hair_color;
         if(_currentSettings.gender == "m")
         {
            _currentSettings.deleteData("bra_quality");
         }
         else
         {
            _currentSettings.bra_quality = "_common";
         }
      }
      
      protected function onClickChangeAppearanceRight(param1:InteractionEvent) : void
      {
         var _loc2_:String = (param1.target as UiButton).tagAsString;
         _currentSettings.setAppearance(_loc2_,getNextAppearanceValue(_loc2_,1));
         updatePriceTag(_loc2_);
      }
      
      protected function onClickChangeAppearanceLeft(param1:InteractionEvent) : void
      {
         var _loc2_:String = (param1.target as UiButton).tagAsString;
         _currentSettings.setAppearance(_loc2_,getNextAppearanceValue(_loc2_,-1));
         updatePriceTag(_loc2_);
      }
      
      protected function getNextAppearanceValue(param1:String, param2:int) : int
      {
         var _loc4_:int = User.current == null?0:User.current.character.level;
         var _loc3_:Vector.<int> = getAvailableAppearances(_currentSettings.gender,-1,_loc4_).getData(param1);
         var _loc6_:int = _currentSettings.getAppearance(param1);
         var _loc5_:int = getAppearanceValueIndex(_loc3_,_loc6_);
         _loc5_ = _loc5_ + param2;
         if(_loc5_ == _loc3_.length)
         {
            _loc5_ = 0;
         }
         else if(_loc5_ < 0)
         {
            _loc5_ = _loc3_.length - 1;
         }
         _loc6_ = _loc3_[_loc5_];
         return _loc6_;
      }
      
      protected function updatePriceTag(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc9_:int = 0;
         var _loc5_:CCharacterAppearance = CCharacterAppearance.fromId(_currentSettings.gender);
         var _loc8_:Vector.<int> = _loc5_.getIntVector(param1);
         var _loc12_:int = _currentSettings.getAppearance(param1);
         var _loc7_:int = getAppearanceValueIndex(_loc8_,_loc12_);
         var _loc11_:Vector.<int> = _loc5_.getIntVector(param1 + "_change_cost_coins");
         var _loc6_:Vector.<int> = _loc5_.getIntVector(param1 + "_change_cost_premium");
         if(_loc11_ == null || _loc6_ == null)
         {
            return;
         }
         var _loc10_:IDisplayObject = _configurator.getChildByName("iconCoins_" + param1);
         var _loc2_:IDisplayObject = _configurator.getChildByName("iconPremium_" + param1);
         var _loc3_:ILabel = _configurator.getChildByName("txtPriceCoins_" + param1) as ILabel;
         var _loc13_:ILabel = _configurator.getChildByName("txtPricePremium_" + param1) as ILabel;
         if(_loc10_ == null || _loc2_ == null || _loc3_ == null || _loc13_ == null)
         {
            return;
         }
         _loc3_.text = "";
         _loc13_.text = "";
         var _loc14_:Boolean = false;
         _loc2_.visible = _loc14_;
         _loc10_.visible = _loc14_;
         _prices.getData(param1).amount = 0;
         if(User.current != null && User.current.character.getCurrentSettings().getAppearance(param1) != _loc12_)
         {
            _loc4_ = _loc11_[_loc7_];
            if(_loc4_ > 0)
            {
               _loc10_.visible = true;
               _loc3_.text = LocText.current.formatHugeNumber(_loc4_);
               _prices.getData(param1).isPremium = false;
               _prices.getData(param1).amount = _loc4_;
            }
            _loc9_ = _loc6_[_loc7_];
            if(_loc9_ > 0)
            {
               _loc2_.visible = true;
               _loc13_.text = LocText.current.formatHugeNumber(_loc9_);
               _prices.getData(param1).isPremium = true;
               _prices.getData(param1).amount = _loc9_;
            }
         }
         updateTotalPrice();
      }
      
      private function updateTotalPrice() : void
      {
         _costCoins = 0;
         _costPremium = 0;
         var _loc3_:int = 0;
         var _loc2_:* = _prices;
         for each(var _loc1_ in _prices)
         {
            if(_loc1_.isPremium)
            {
               _costPremium = _costPremium + _loc1_.amount;
            }
            else
            {
               _costCoins = _costCoins + _loc1_.amount;
            }
         }
         (_configurator.getChildByName("txtPriceCoinsTotal") as ILabel).text = _costCoins > 0?LocText.current.formatHugeNumber(_costCoins):"";
         _configurator.getChildByName("iconCoinsTotal").visible = _costCoins > 0;
         (_configurator.getChildByName("txtPricePremiumTotal") as ILabel).text = _costPremium > 0?LocText.current.formatHugeNumber(_costPremium):"";
         _configurator.getChildByName("iconPremiumTotal").visible = _costPremium > 0;
      }
   }
}

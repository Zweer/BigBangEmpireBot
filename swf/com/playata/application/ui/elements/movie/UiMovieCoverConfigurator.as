package com.playata.application.ui.elements.movie
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.movie.MovieCoverSettings;
   import com.playata.application.ui.elements.avatar.PriceInformation;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieCoverGeneric;
   
   public class UiMovieCoverConfigurator
   {
       
      
      public var currentSet:String;
      
      public var characterLevel:int;
      
      protected var _configurator:SymbolDialogMovieCoverGeneric = null;
      
      protected var _onUpdate:Function = null;
      
      protected var _currentSettings:MovieCoverSettings;
      
      protected var _costCoins:int;
      
      protected var _costPremium:int;
      
      protected var _prices:StringMap;
      
      protected var _relevantAppearances:Vector.<String>;
      
      private var _initialSettings:MovieCoverSettings;
      
      private var _btnLeftRect:UiButton;
      
      private var _btnLeftBorder:UiButton;
      
      private var _btnLeftBackground:UiButton;
      
      private var _btnLeftLayout:UiButton;
      
      private var _btnLeftActor:UiButton;
      
      private var _btnLeftFilter:UiButton;
      
      private var _btnLeftFont:UiButton;
      
      private var _btnRightRect:UiButton;
      
      private var _btnRightBorder:UiButton;
      
      private var _btnRightBackground:UiButton;
      
      private var _btnRightLayout:UiButton;
      
      private var _btnRightActor:UiButton;
      
      private var _btnRightFilter:UiButton;
      
      private var _btnRightFont:UiButton;
      
      public function UiMovieCoverConfigurator(param1:SymbolDialogMovieCoverGeneric, param2:Function)
      {
         _currentSettings = new MovieCoverSettings({});
         super();
         _configurator = param1;
         _btnLeftRect = new UiButton(param1.btnLeftRect,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftBorder = new UiButton(param1.btnLeftBorder,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftBackground = new UiButton(param1.btnLeftBackground,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftLayout = new UiButton(param1.btnLeftLayout,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftActor = new UiButton(param1.btnLeftActor,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftFilter = new UiButton(param1.btnLeftFilter,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftFont = new UiButton(param1.btnLeftFont,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceLeft);
         _btnRightRect = new UiButton(param1.btnRightRect,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceRight);
         _btnRightBorder = new UiButton(param1.btnRightBorder,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceRight);
         _btnRightBackground = new UiButton(param1.btnRightBackground,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceRight);
         _btnRightLayout = new UiButton(param1.btnRightLayout,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceRight);
         _btnRightActor = new UiButton(param1.btnRightActor,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceRight);
         _btnRightFilter = new UiButton(param1.btnRightFilter,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceRight);
         _btnRightFont = new UiButton(param1.btnRightFont,LocText.current.text("screen/movie_cover/button_switch_cover_tooltip"),onClickChangeAppearanceRight);
         _btnLeftRect.tag = "cover_rect_type";
         _btnLeftBorder.tag = "cover_border_type";
         _btnLeftBackground.tag = "cover_background_type";
         _btnLeftLayout.tag = "cover_layout_new_type";
         _btnLeftActor.tag = "cover_actor_type";
         _btnLeftFilter.tag = "cover_filter_type";
         _btnLeftFont.tag = "cover_font_type";
         _btnRightRect.tag = "cover_rect_type";
         _btnRightBorder.tag = "cover_border_type";
         _btnRightBackground.tag = "cover_background_type";
         _btnRightLayout.tag = "cover_layout_new_type";
         _btnRightActor.tag = "cover_actor_type";
         _btnRightFilter.tag = "cover_filter_type";
         _btnRightFont.tag = "cover_font_type";
         param1.txtRect.text = LocText.current.text("screen/movie_cover/rect");
         param1.txtBorder.text = LocText.current.text("screen/movie_cover/border");
         param1.txtBackground.text = LocText.current.text("screen/movie_cover/background");
         param1.txtLayout.text = LocText.current.text("screen/movie_cover/layout");
         param1.txtActor.text = LocText.current.text("screen/movie_cover/actor");
         param1.txtFilter.text = LocText.current.text("screen/movie_cover/filter");
         param1.txtFont.text = LocText.current.text("screen/movie_cover/font");
         _onUpdate = param2;
         _costPremium = 0;
         _costCoins = 0;
         _relevantAppearances = new <String>["cover_rect_type","cover_border_type","cover_background_type","cover_layout_new_type","cover_font_type","cover_actor_type","cover_filter_type"];
         _prices = new StringMap();
         var _loc5_:int = 0;
         var _loc4_:* = _relevantAppearances;
         for each(var _loc3_ in _relevantAppearances)
         {
            _prices.setData(_loc3_,new PriceInformation());
         }
         _initialSettings = new MovieCoverSettings({});
         initAppearances();
         updatePrices();
      }
      
      public static function getAppearanceValueIndex(param1:Array, param2:int) : int
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
      
      public function get costCoins() : int
      {
         return _costCoins;
      }
      
      public function get costPremium() : int
      {
         return _costPremium;
      }
      
      public function dispose() : void
      {
         _btnLeftRect.dispose();
         _btnLeftBorder.dispose();
         _btnLeftBackground.dispose();
         _btnLeftLayout.dispose();
         _btnLeftActor.dispose();
         _btnLeftFilter.dispose();
         _btnLeftFont.dispose();
         _btnRightRect.dispose();
         _btnRightBorder.dispose();
         _btnRightBackground.dispose();
         _btnRightLayout.dispose();
         _btnRightActor.dispose();
         _btnRightFilter.dispose();
         _btnRightFont.dispose();
         _btnLeftRect = null;
         _btnLeftBorder = null;
         _btnLeftBackground = null;
         _btnLeftLayout = null;
         _btnLeftActor = null;
         _btnLeftFilter = null;
         _btnLeftFont = null;
         _btnRightRect = null;
         _btnRightBorder = null;
         _btnRightBackground = null;
         _btnRightLayout = null;
         _btnRightActor = null;
         _btnRightFilter = null;
         _btnRightFont = null;
         _configurator = null;
      }
      
      public function set initalSettings(param1:MovieCoverSettings) : void
      {
         _initialSettings = param1;
         currentSettings = param1;
      }
      
      public function set currentSettings(param1:MovieCoverSettings) : void
      {
         _currentSettings = new MovieCoverSettings({});
         var _loc2_:Object = Constants.current.constant("movie_cover_settings");
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for(var _loc3_ in _loc2_)
         {
            if(!(_loc3_.indexOf("change_cost") > 0 || _loc3_.indexOf("_set") > 0))
            {
               _currentSettings.setAppearance(_loc3_,param1.getAppearance(_loc3_));
               if(_relevantAppearances.indexOf(_loc3_) >= 0)
               {
                  updatePriceTag(_loc3_);
               }
            }
         }
         updatePrices();
      }
      
      public function get currentSettings() : MovieCoverSettings
      {
         return _currentSettings;
      }
      
      public function initAppearances() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Object = Constants.current.constant("movie_cover_settings");
         var _loc5_:int = 0;
         var _loc4_:* = _loc1_;
         for(var _loc2_ in _loc1_)
         {
            if(!(_loc2_.indexOf("change_cost") > 0 || _loc2_.indexOf("_set") > 0))
            {
               do
               {
                  _loc3_ = NumberUtil.randomInt(0,_loc1_[_loc2_].length - 1);
               }
               while(!canAppearanceIndexUsedInSet(_loc2_,_loc3_));
               
               _currentSettings.setAppearance(_loc2_,_loc1_[_loc2_][_loc3_]);
               if(_relevantAppearances.indexOf(_loc2_) >= 0)
               {
                  updatePriceTag(_loc2_);
               }
            }
         }
      }
      
      protected function onClickChangeAppearanceRight(param1:InteractionEvent) : void
      {
         var _loc2_:String = (param1.target as UiButton).tagAsString;
         _currentSettings.setAppearance(_loc2_,getNextAppearanceValue(_loc2_,1));
         updatePriceTag(_loc2_);
         updatePrices();
      }
      
      protected function onClickChangeAppearanceLeft(param1:InteractionEvent) : void
      {
         var _loc2_:String = (param1.target as UiButton).tagAsString;
         _currentSettings.setAppearance(_loc2_,getNextAppearanceValue(_loc2_,-1));
         updatePriceTag(_loc2_);
         updatePrices();
      }
      
      private function getNextAppearanceValue(param1:String, param2:int) : int
      {
         var _loc3_:Array = Constants.current.constant("movie_cover_settings")[param1];
         var _loc5_:int = _currentSettings.getAppearance(param1);
         var _loc4_:int = getAppearanceValueIndex(_loc3_,_loc5_);
         do
         {
            _loc4_ = _loc4_ + param2;
            if(_loc4_ == _loc3_.length)
            {
               _loc4_ = 0;
            }
            else if(_loc4_ < 0)
            {
               _loc4_ = _loc3_.length - 1;
            }
         }
         while(!canAppearanceIndexUsedInSet(param1,_loc4_));
         
         _loc5_ = _loc3_[_loc4_];
         return _loc5_;
      }
      
      private function updatePriceTag(param1:String) : void
      {
         var _loc6_:int = 0;
         var _loc8_:Array = Constants.current.constant("movie_cover_settings")[param1];
         var _loc12_:int = _currentSettings.getAppearance(param1);
         var _loc7_:int = getAppearanceValueIndex(_loc8_,_loc12_);
         var _loc11_:Array = Constants.current.constant("movie_cover_settings")[param1 + "_change_cost_coins"];
         var _loc5_:Array = Constants.current.constant("movie_cover_settings")[param1 + "_change_cost_premium"];
         if(_loc11_ == null || _loc5_ == null)
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
         var _loc4_:int = _initialSettings.getAppearance(param1) != _currentSettings.getAppearance(param1)?_loc11_[_loc7_]:0;
         if(_loc4_ > 0)
         {
            _loc10_.visible = true;
            _loc6_ = Math.round(_loc4_ * GameUtil.gameCurrencyPerTime(characterLevel));
            _loc3_.text = LocText.current.formatHugeNumber(_loc6_);
            _prices.getData(param1).isPremium = false;
            _prices.getData(param1).amount = _loc6_;
         }
         var _loc9_:int = _initialSettings.getAppearance(param1) != _currentSettings.getAppearance(param1)?_loc5_[_loc7_]:0;
         if(_loc9_ > 0)
         {
            _loc2_.visible = true;
            _loc13_.text = LocText.current.formatHugeNumber(_loc9_);
            _prices.getData(param1).isPremium = true;
            _prices.getData(param1).amount = _loc9_;
         }
      }
      
      private function updatePrices() : void
      {
         _costPremium = 0;
         _costCoins = 0;
         var _loc3_:int = 0;
         var _loc2_:* = _prices.values;
         for each(var _loc1_ in _prices.values)
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
      }
      
      private function canAppearanceIndexUsedInSet(param1:String, param2:int) : Boolean
      {
         var _loc3_:String = Constants.current.constant("movie_cover_settings")[param1 + "_set"][param2];
         return _loc3_ == "all" || _loc3_ == currentSet || _loc3_ == "usk18" && AppEnvironment.appPlatform.isHidePantiesAllowed;
      }
      
      public function randomize() : void
      {
         initAppearances();
         updatePrices();
      }
   }
}

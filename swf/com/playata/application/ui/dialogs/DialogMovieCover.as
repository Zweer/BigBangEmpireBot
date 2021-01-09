package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.movie.MovieCoverSettings;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumAndGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.movie.UiMovieCover;
   import com.playata.application.ui.elements.movie.UiMovieCoverConfigurator;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieCoverGeneric;
   
   public class DialogMovieCover extends UiDialog
   {
       
      
      private var _btnClose:UiButton;
      
      private var _btnSaveCover:UiPremiumAndGameCurrencyButton;
      
      private var _cover:UiMovieCover;
      
      private var _configurator:UiMovieCoverConfigurator;
      
      private var _currentSettings:Object;
      
      private var _itemList:Array;
      
      private var _btnRandomize:UiButton;
      
      public function DialogMovieCover()
      {
         var _loc2_:SymbolDialogMovieCoverGeneric = new SymbolDialogMovieCoverGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/movie_cover/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/movie_cover/info");
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _btnSaveCover = new UiPremiumAndGameCurrencyButton(_loc2_.btnContinue,LocText.current.text("dialog/movie_cover/button_change_cover"),0,0,"",onClickSaveCover);
         _btnRandomize = new UiButton(_loc2_.btnRandomize,LocText.current.text("screen/create_character/button_random_tooltip"),onClickRandomize);
         _cover = new UiMovieCover(_loc2_.cover);
         _configurator = new UiMovieCoverConfigurator(_loc2_,onCoverUpdated);
         var _loc1_:Character = User.current.character;
         _configurator.characterLevel = _loc1_.level;
         _configurator.currentSet = _loc1_.movie.setIdentifier;
         _configurator.initalSettings = MovieCoverSettings.decodeMovieCoverImageSettings(_loc1_.movie.coverSettings);
      }
      
      override public function show() : void
      {
         super.show();
         onCoverUpdated(_configurator.currentSettings);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnClose.dispose();
         _btnClose = null;
         _btnSaveCover.dispose();
         _btnSaveCover = null;
         _configurator.dispose();
      }
      
      private function onCoverUpdated(param1:MovieCoverSettings) : void
      {
         _currentSettings = param1;
         var _loc3_:MovieCoverSettings = new MovieCoverSettings({});
         var _loc8_:int = 0;
         var _loc7_:* = param1.keys;
         for each(var _loc5_ in param1.keys)
         {
            _loc3_.setData(_loc5_,param1.getData(_loc5_));
         }
         _loc3_.title = User.current.character.movie.title;
         _loc3_.gender = User.current.character.gender;
         var _loc4_:AppearanceSettings = User.current.character.getCurrentSettings(8);
         var _loc10_:int = 0;
         var _loc9_:* = _loc4_.keys;
         for each(_loc5_ in _loc4_.keys)
         {
            _loc3_.setData(_loc5_,_loc4_.getData(_loc5_));
         }
         updateItemList(_loc3_.gender,param1.cover_rect_type);
         cleanSettings(_loc3_);
         var _loc6_:String = GameUtil.compressMovieCoverSettings(_loc3_,_itemList);
         _cover.showWithSettings(_loc6_);
         var _loc2_:Boolean = areSettingsEqual(_loc6_,User.current.character.movie.coverSettings);
         _btnSaveCover.premiumAmount = _configurator.costPremium;
         _btnSaveCover.gameCurrencyAmount = _configurator.costCoins;
         _btnSaveCover.buttonEnabled = !_loc2_;
      }
      
      private function areSettingsEqual(param1:String, param2:String) : Boolean
      {
         var _loc3_:String = param1.split(";").sort().join(";");
         var _loc4_:String = param2.split(";").sort().join(";");
         return _loc3_ == _loc4_;
      }
      
      private function updateItemList(param1:String, param2:int) : void
      {
         var _loc3_:Object = {
            "f":{},
            "m":{}
         };
         _loc3_["f"][1] = ["head","chest","legs","belt","boots"];
         _loc3_["f"][2] = ["head","chest","legs","belt","boots"];
         _loc3_["f"][3] = ["head","chest","legs","belt","boots"];
         _loc3_["f"][4] = ["head","chest","legs","belt","boots"];
         _loc3_["f"][5] = ["head","chest","legs","belt","boots"];
         _loc3_["m"][1] = ["head","chest","legs","belt","boots"];
         _loc3_["m"][2] = ["head","chest","legs","belt","boots"];
         _loc3_["m"][3] = ["head","chest","legs","belt","boots"];
         _loc3_["m"][4] = ["head","chest","legs","belt","boots"];
         _loc3_["m"][5] = ["head","chest","legs","belt","boots"];
         _itemList = _loc3_[param1][param2];
      }
      
      private function cleanSettings(param1:MovieCoverSettings) : void
      {
         var _loc2_:Array = ["head","chest","belt","legs","boots","missiles"];
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            if(_itemList.indexOf(_loc3_) == -1)
            {
               param1.deleteData(_loc3_.toString());
            }
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSaveCover(param1:InteractionEvent) : void
      {
         var _loc2_:MovieCoverSettings = new MovieCoverSettings({});
         var _loc5_:int = 0;
         var _loc4_:* = _configurator.currentSettings.keys;
         for each(var _loc3_ in _configurator.currentSettings.keys)
         {
            _loc2_.setData(_loc3_,_configurator.currentSettings.getData(_loc3_));
         }
         Environment.application.sendActionRequest("setMovieCover",_loc2_,handleRequests);
      }
      
      private function onClickRandomize(param1:InteractionEvent) : void
      {
         _configurator.randomize();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("setMovieCover" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _configurator.initalSettings = MovieCoverSettings.decodeMovieCoverImageSettings(User.current.character.movie.coverSettings);
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughGameCurrencyDialog(_configurator.costCoins);
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_configurator.costPremium);
         }
         else if(param1.error.indexOf("errSetMovieCoverInvalidLayoutForSet") >= 0)
         {
            _loc2_ = param1.error.split("_")[1];
            _loc3_ = _loc2_;
            switch(_loc3_)
            {
               case "background":
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/movie_cover_invalid/title"),LocText.current.text("dialog/movie_cover_invalid_background/text"),LocText.current.text("general/button_ok")));
                  break;
               case "border":
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/movie_cover_invalid/title"),LocText.current.text("dialog/movie_cover_invalid_border/text"),LocText.current.text("general/button_ok")));
            }
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}

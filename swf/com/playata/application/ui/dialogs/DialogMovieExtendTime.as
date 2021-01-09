package com.playata.application.ui.dialogs
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Bounce;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumDiscountButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieExtendTimeGeneric;
   
   public class DialogMovieExtendTime extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnBuyForGameCurrency:UiGameCurrencyButton = null;
      
      private var _btnBuyForPremiumCurrency:UiPremiumDiscountButton = null;
      
      private var _callbackExtended:Function = null;
      
      private var _callbackNotExtended:Function = null;
      
      public function DialogMovieExtendTime(param1:Movie, param2:Function, param3:Function)
      {
         var _loc9_:int = 0;
         _isOpen = true;
         _callbackExtended = param2;
         _callbackNotExtended = param3;
         var _loc8_:SymbolDialogMovieExtendTimeGeneric = new SymbolDialogMovieExtendTimeGeneric();
         super(_loc8_);
         _queued = false;
         var _loc7_:int = CConstant.movie_extend_time_premium_amount;
         var _loc6_:int = CConstant.movie_extend_time_amount;
         var _loc5_:int = GameUtil.getMovieExtendTimeGameCurrengy(User.current.character.level);
         _loc8_.txtDialogTitle.text = LocText.current.text("dialog/movie_extend_time/title");
         _loc8_.txtInfo.text = LocText.current.text("dialog/movie_extend_time/text_info",TimeUtil.secondsToString(_loc6_));
         _btnClose = new UiButton(_loc8_.btnClose,"",onClickClose);
         _btnBuyForGameCurrency = new UiGameCurrencyButton(_loc8_.btnBuyForCoins,_loc5_,LocText.current.text("dialog/movie_extend_time/button_extend_time"),"",onClickBuyCoins);
         _btnBuyForPremiumCurrency = new UiPremiumDiscountButton(_loc8_.btnBuyForPremiumCurrency,_loc7_,"",LocText.current.text("dialog/movie_extend_time/button_extend_time"),"","",onClickBuyPremium);
         _btnBuyForPremiumCurrency.premium = true;
         var _loc4_:int = GameUtil.getMovieExtendTimeDiscountMaxLevel(User.current.character.level);
         if(_loc4_ > 0)
         {
            _loc8_.discountHint.level.text = _loc4_.toString();
            _loc9_ = 100 - GameUtil.getMovieExtendTimePremiumCurrengy(User.current.character.level) / _loc7_ * 100;
            _loc8_.discountHint.caption.text = LocText.current.text("dialog/movie_extend_time/discount_hint",_loc9_);
            _loc8_.discountHint.level.autoFontSize = true;
            _loc8_.discountHint.caption.autoFontSize = true;
            _loc8_.discountHint.caption.x = -(_loc8_.discountHint.level.width + _loc8_.discountHint.caption.width + 2) * 0.5;
            _loc8_.discountHint.level.x = _loc8_.discountHint.caption.x + _loc8_.discountHint.caption.width + 2;
            _loc8_.discountHint.bg.width = -_loc8_.discountHint.caption.x * 2 + 18;
         }
         else
         {
            _loc8_.discountHint.visible = false;
         }
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
         var _loc1_:SymbolDialogMovieExtendTimeGeneric = _vo as SymbolDialogMovieExtendTimeGeneric;
         if(_loc1_.discountHint.visible)
         {
            Runtime.delayFunction(_btnBuyForPremiumCurrency.discountTo,1,[GameUtil.getMovieExtendTimePremiumCurrengy(User.current.character.level)]);
            _loc1_.discountHint.tweenFrom(1.5,{
               "delay":3,
               "scaleX":0,
               "scaleY":0,
               "ease":Bounce.easeOut
            });
            _loc1_.discountHint.tweenTo(0.5,{
               "delay":8,
               "scaleX":0,
               "scaleY":0,
               "ease":Back.easeIn
            });
         }
      }
      
      override public function dispose() : void
      {
         Runtime.killDelayedFunction(_btnBuyForPremiumCurrency.discountTo);
         var _loc1_:SymbolDialogMovieExtendTimeGeneric = _vo as SymbolDialogMovieExtendTimeGeneric;
         _loc1_.discountHint.killTweens();
         _btnClose.dispose();
         _btnClose = null;
         _btnBuyForGameCurrency.dispose();
         _btnBuyForGameCurrency = null;
         _btnBuyForPremiumCurrency.dispose();
         _btnBuyForPremiumCurrency = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close(_callbackNotExtended);
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function onClickBuyCoins(param1:InteractionEvent) : void
      {
         if(!_btnBuyForGameCurrency.buttonEnabled)
         {
            return;
         }
         _btnBuyForGameCurrency.buttonEnabled = false;
         _btnBuyForPremiumCurrency.buttonEnabled = false;
         Environment.application.sendActionRequest("extendMovieTime",{"use_premium":false},handleRequests);
      }
      
      private function onClickBuyPremium(param1:InteractionEvent) : void
      {
         if(!_btnBuyForGameCurrency.buttonEnabled)
         {
            return;
         }
         _btnBuyForGameCurrency.buttonEnabled = false;
         _btnBuyForPremiumCurrency.buttonEnabled = false;
         Environment.application.sendActionRequest("extendMovieTime",{"use_premium":true},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("extendMovieTime" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(_callbackExtended != null)
            {
               _callbackExtended();
            }
            close();
         }
         else
         {
            _btnBuyForGameCurrency.buttonEnabled = true;
            _btnBuyForPremiumCurrency.buttonEnabled = true;
            if(param1.error == "errRemovePremiumCurrencyNotEnough")
            {
               ViewManager.instance.showNotEnoughPremiumDialog(GameUtil.getMovieExtendTimePremiumCurrengy(User.current.character.level));
            }
            else if(param1.error == "errRemoveGameCurrencyNotEnough")
            {
               ViewManager.instance.showNotEnoughGameCurrencyDialog(GameUtil.getMovieExtendTimeGameCurrengy(User.current.character.level));
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}

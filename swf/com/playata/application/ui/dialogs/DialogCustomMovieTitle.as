package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogCustomMovieTitleGeneric;
   
   public class DialogCustomMovieTitle extends UiDialog
   {
       
      
      private var _btnClose:UiButton;
      
      private var _btnCustomize:UiPremiumButton;
      
      public function DialogCustomMovieTitle()
      {
         var _loc1_:SymbolDialogCustomMovieTitleGeneric = new SymbolDialogCustomMovieTitleGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/movie_title/title");
         _loc1_.txtInfo.text = LocText.current.text("dialog/movie_title_customize/info");
         _loc1_.txtDisclaimer.text = LocText.current.text("dialog/movie_title_customize/disclaimer");
         _loc1_.txtDisclaimer.autoFontSize = true;
         _loc1_.txtCharInfo.text = LocText.current.text("dialog/movie_title_customize/info_max_length",User.current.character.movie.title.length,CConstant.movie_title_customize_max_length);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnCustomize = new UiPremiumButton(_loc1_.btnRefreshTitle,CConstant.movie_title_customize_premium_cost,"",LocText.current.text("dialog/movie_title/button_customize_title"),"",LocText.current.text("dialog/movie_title/button_customize_title_same_title_hint"),onClickCustomize);
         _btnCustomize.premium = true;
         _btnCustomize.buttonEnabled = false;
         _loc1_.inputMovieTitle.text = User.current.character.movie.title;
         _loc1_.inputMovieTitle.maxChars = CConstant.movie_title_customize_max_length;
         _loc1_.inputMovieTitle.autoFontSize = true;
         _loc1_.inputMovieTitle.onChange.add(handleTextChanged);
      }
      
      private function handleTextChanged(param1:ITextInput) : void
      {
         var _loc2_:SymbolDialogCustomMovieTitleGeneric = _vo as SymbolDialogCustomMovieTitleGeneric;
         _loc2_.inputMovieTitle.text = StringUtil.replace(_loc2_.inputMovieTitle.text,"\r","");
         _loc2_.inputMovieTitle.text = StringUtil.replace(_loc2_.inputMovieTitle.text,"\n","");
         _btnCustomize.buttonEnabled = _loc2_.inputMovieTitle.text != User.current.character.movie.title && _loc2_.inputMovieTitle.text.length >= CConstant.movie_title_customize_min_length && _loc2_.inputMovieTitle.text.length <= CConstant.movie_title_customize_max_length;
         _loc2_.txtCharInfo.text = LocText.current.text("dialog/movie_title_customize/info_max_length",_loc2_.inputMovieTitle.text.length,CConstant.movie_title_customize_max_length);
         _loc2_.inputMovieTitle.autoFontSize = true;
         if(_loc2_.inputMovieTitle.text == User.current.character.movie.title)
         {
            _btnCustomize.premiumTooltip = LocText.current.text("dialog/movie_title/button_customize_title_same_title_hint");
         }
         else if(_loc2_.inputMovieTitle.text.length > CConstant.movie_title_customize_max_length)
         {
            _btnCustomize.premiumTooltip = LocText.current.text("dialog/movie_title/button_customize_title_to_long_hint",CConstant.movie_title_customize_max_length);
         }
         else if(_loc2_.inputMovieTitle.text.length < CConstant.movie_title_customize_min_length)
         {
            _btnCustomize.premiumTooltip = LocText.current.text("dialog/movie_title/button_customize_title_to_short_hint",CConstant.movie_title_customize_min_length);
         }
         else
         {
            _btnCustomize.premiumTooltip = LocText.current.text("dialog/movie_title/button_customize_title_hint",CConstant.movie_title_customize_premium_cost);
         }
      }
      
      private function onClickCustomize(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogCustomMovieTitleGeneric = _vo as SymbolDialogCustomMovieTitleGeneric;
         Environment.application.sendActionRequest("customizeMovieTitle",{"movie_title":_loc2_.inputMovieTitle.text},handleRequests);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnClose.dispose();
         _btnClose = null;
         _btnCustomize.dispose();
         _btnCustomize = null;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("customizeMovieTitle" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(CConstant.movie_title_refresh_premium_cost);
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}

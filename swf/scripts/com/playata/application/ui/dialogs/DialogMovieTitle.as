package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieTitleGeneric;
   
   public class DialogMovieTitle extends UiDialog
   {
       
      
      private var _btnClose:UiButton;
      
      private var _btnRefresh:UiPremiumButton;
      
      private var _btnCustomTitle:UiButton;
      
      public function DialogMovieTitle()
      {
         var _loc1_:SymbolDialogMovieTitleGeneric = new SymbolDialogMovieTitleGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/movie_title/title");
         _loc1_.txtInfo.text = LocText.current.text("dialog/movie_title/info");
         _btnClose = new UiTextButton(_loc1_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _btnCustomTitle = new UiButton(_loc1_.btnCustomTitle,LocText.current.text("dialog/movie_title/button_customize_tooltip"),onClickCustomTitle);
         _btnRefresh = new UiPremiumButton(_loc1_.btnRefreshTitle,CConstant.movie_title_refresh_premium_cost,"",LocText.current.text("dialog/movie_title/button_refresh_title"),"",LocText.current.text("dialog/movie_title/button_refresh_title_hint"),onClickRefresh);
         _btnRefresh.premium = true;
         refresh();
      }
      
      private function refresh() : void
      {
         (_vo as SymbolDialogMovieTitleGeneric).txtMovieTitle.text = User.current.character.movie.title;
      }
      
      private function onClickRefresh(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("refreshMovieTitle",{},handleRequests);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickCustomTitle(param1:InteractionEvent) : void
      {
         close();
         Environment.panelManager.showDialog(new DialogCustomMovieTitle());
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnClose.dispose();
         _btnClose = null;
         _btnRefresh.dispose();
         _btnRefresh = null;
         _btnCustomTitle.dispose();
         _btnCustomTitle = null;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("refreshMovieTitle" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            refresh();
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

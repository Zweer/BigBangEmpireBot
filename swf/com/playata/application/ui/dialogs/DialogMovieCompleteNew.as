package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.effects.IEffect;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.movie.UiMovieCover;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieCompleteNewGeneric;
   
   public class DialogMovieCompleteNew extends UiDialog
   {
      
      private static var _isOpen:Boolean;
       
      
      private var _movie:Movie = null;
      
      private var _btnClose:UiTextButton = null;
      
      private var _cover:UiMovieCover;
      
      private var _effectLight:IEffect;
      
      private var _effectConfetti:IEffect;
      
      public function DialogMovieCompleteNew(param1:Movie)
      {
         _movie = param1;
         _isOpen = true;
         _queued = false;
         var _loc2_:SymbolDialogMovieCompleteNewGeneric = new SymbolDialogMovieCompleteNewGeneric();
         super(_loc2_);
         _loc2_.txtMovieTitle.text = _movie.title;
         _loc2_.txtMovieTitle.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
         _loc2_.txtMovieTitle.y = -165 + (115 - _loc2_.txtMovieTitle.height) * 0.5;
         _loc2_.rating.gotoAndStop(param1.claimedStars + 1);
         if(param1.fans > 0)
         {
            _loc2_.txtRewardCaption.text = LocText.current.text("dialog/movie_complete/rewards_caption");
            _loc2_.txtRewardInfo.text = LocText.current.text("dialog/movie_complete/rewards_info");
            _loc2_.txtNewFans.text = LocText.current.text("dialog/movie_complete/new_fans",LocText.current.formatHugeNumber(_movie.fans));
         }
         else
         {
            _loc2_.txtRewardInfo.text = LocText.current.text("dialog/movie_complete/rewards_info_no_fans");
            _loc2_.txtRewardCaption.visible = false;
            _loc2_.txtNewFans.visible = false;
            _loc2_.iconFans.visible = false;
         }
         _cover = new UiMovieCover(_loc2_.cover);
         _cover.showWithSettings(_movie.coverSettings);
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         Environment.audio.playFX("movie_complete.mp3");
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
         if(_movie.claimedStars > 0)
         {
            EffectsLayer.instance.show(113,{},_vo.parent,1);
         }
         if(_movie.claimedStars > 2)
         {
            _effectConfetti = EffectsLayer.instance.show(101,{},_vo.parent,1);
         }
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent = null) : void
      {
         Environment.application.sendActionRequest("finishMovie",{},handleRequests);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("finishMovie" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            if(PanelCitymap.unlockedDungeon != "" && panelManager.dialogManager.getVisibleDialog(DialogLevelUp) == null)
            {
               ViewManager.instance.showPanel("citymap");
            }
            else
            {
               ViewManager.instance.showPanel("movie_offers");
            }
            if(_movie.claimedStars == 3)
            {
               if(User.current.character.selectableMoviesCount == 2)
               {
                  Environment.panelManager.showDialog(new DialogSelectMovie());
               }
            }
         }
         else if(param1.error == "errFinishMovieNotFinished")
         {
            Runtime.delayFunction(onClickClose,1);
         }
         else if(param1.error != "errFinishMovieNoActiveMovie")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
         if(AppEnvironment.appPlatform.isFacebook)
         {
            platform.publishFeed(ServerInfo.movieCoverURLByHash(_movie.coverSettings),LocText.current.text("facebook/object/complete_movie/title",_movie.title),LocText.current.text("facebook/object/complete_movie/description",User.current.character.name,_movie.title,(_movie.rating / 10).toFixed(1).replace(/\./g,LocText.current.text("base/numbers/comma_separator"))));
         }
         if(_effectConfetti)
         {
            _effectConfetti.shutDown();
         }
         if(_effectLight)
         {
            _effectLight.shutDown();
         }
      }
   }
}

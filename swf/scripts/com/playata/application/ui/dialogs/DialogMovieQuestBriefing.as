package com.playata.application.ui.dialogs
{
   import com.playata.application.data.movie.MovieQuest;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.movie.UiMovieQuestBriefingContent;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.application.ui.panels.PanelStatQuest;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieQuestBriefingGeneric;
   
   public class DialogMovieQuestBriefing extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnStartQuest:UiTextButton = null;
      
      private var _btnPreviousQuest:UiButton = null;
      
      private var _btnNextQuest:UiButton = null;
      
      private var _movieQuest:MovieQuest = null;
      
      private var _movieQuestContent:UiMovieQuestBriefingContent = null;
      
      public function DialogMovieQuestBriefing(param1:MovieQuest)
      {
         _movieQuest = param1;
         _isOpen = true;
         var _loc3_:SymbolDialogMovieQuestBriefingGeneric = new SymbolDialogMovieQuestBriefingGeneric();
         super(_loc3_);
         _queued = false;
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnStartQuest = new UiTextButton(_loc3_.btnStartQuest,LocText.current.text("dialog/movie_quest_briefing/button_start"),"",onClickStartQuest);
         _btnPreviousQuest = new UiButton(_loc3_.btnPreviousQuest,LocText.current.text("dialog/movie_quest_briefing/button_previous_quest"),onClickPreviousQuest);
         _btnNextQuest = new UiButton(_loc3_.btnNextQuest,LocText.current.text("dialog/movie_quest_briefing/button_next_quest"),onClickNextQuest);
         var _loc4_:* = 0;
         _loc3_.txtType.text = LocText.current.text("screen/movie_quest/button_instant_quest_tooltip");
         if(_loc3_.txtType.textWidth > _loc4_)
         {
            _loc4_ = Number(_loc3_.txtType.textWidth);
         }
         _loc3_.txtType.text = LocText.current.text("screen/movie_quest/button_fight_quest_tooltip");
         if(_loc3_.txtType.textWidth > _loc4_)
         {
            _loc4_ = Number(_loc3_.txtType.textWidth);
         }
         _loc3_.txtType.text = LocText.current.text("screen/movie_quest/button_stat_quest_tooltip");
         if(_loc3_.txtType.textWidth > _loc4_)
         {
            _loc4_ = Number(_loc3_.txtType.textWidth);
         }
         var _loc5_:Number = _btnNextQuest.content.x - (_btnPreviousQuest.content.x + _btnPreviousQuest.content.width);
         var _loc2_:Number = _loc4_ + 50;
         if(_loc2_ > _loc5_)
         {
            _btnPreviousQuest.x = _btnPreviousQuest.x - Math.round((_loc2_ - _loc5_) / 2);
            _btnNextQuest.x = _btnNextQuest.x + Math.round((_loc2_ - _loc5_) / 2);
         }
         _movieQuestContent = new UiMovieQuestBriefingContent(_loc3_.questContent);
         setCurrentData();
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      private function setCurrentData() : void
      {
         var _loc1_:SymbolDialogMovieQuestBriefingGeneric = _vo as SymbolDialogMovieQuestBriefingGeneric;
         if(_movieQuest.isInstantQuest)
         {
            _loc1_.txtType.text = LocText.current.text("screen/movie_quest/button_instant_quest_tooltip");
         }
         else if(_movieQuest.isFightQuest)
         {
            _loc1_.txtType.text = LocText.current.text("screen/movie_quest/button_fight_quest_tooltip");
         }
         else if(_movieQuest.isStatQuest)
         {
            _loc1_.txtType.text = LocText.current.text("screen/movie_quest/button_stat_quest_tooltip");
         }
         _movieQuestContent.refresh(_movieQuest);
      }
      
      override public function dispose() : void
      {
         _isOpen = false;
         _btnClose.dispose();
         _btnClose = null;
         _btnStartQuest.dispose();
         _btnStartQuest = null;
         _btnPreviousQuest.dispose();
         _btnPreviousQuest = null;
         _btnNextQuest.dispose();
         _btnNextQuest = null;
         _movieQuestContent.dispose();
         _movieQuestContent = null;
         super.dispose();
      }
      
      private function onClickStartQuest(param1:InteractionEvent) : void
      {
         if(!_btnStartQuest.buttonEnabled)
         {
            return;
         }
         _btnStartQuest.buttonEnabled = false;
         Environment.application.sendActionRequest("startMovieQuest",{"movie_quest_id":_movieQuest.id},handleRequests);
      }
      
      private function onClickPreviousQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Array = User.current.character.movie.movieQuestIds;
         var _loc3_:int = _loc2_.indexOf(_movieQuest.id);
         if(_loc3_ == 0)
         {
            _loc3_ = _loc2_.length;
         }
         _movieQuest = User.current.character.movie.movieQuests.getData(_loc2_[_loc3_ - 1]);
         setCurrentData();
      }
      
      private function onClickNextQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Array = User.current.character.movie.movieQuestIds;
         var _loc3_:int = _loc2_.indexOf(_movieQuest.id);
         if(_loc3_ == _loc2_.length - 1)
         {
            _loc3_ = -1;
         }
         _movieQuest = User.current.character.movie.movieQuests.getData(_loc2_[_loc3_ + 1]);
         setCurrentData();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function startMovieQuest() : void
      {
         if(_btnStartQuest == null)
         {
            return;
         }
         if(!_btnStartQuest.buttonEnabled)
         {
            return;
         }
         _btnStartQuest.buttonEnabled = false;
         _btnStartQuest.visible = false;
         _btnClose.visible = false;
         var start:Function = function():void
         {
            Environment.application.sendActionRequest("startMovieQuest",{"movie_quest_id":_movieQuest.id},handleRequests);
         };
         Runtime.delayFunction(start,1);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         if("startMovieQuest" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
         if(response.error == "")
         {
            Environment.application.updateData(response.data);
            close();
            if(User.current.character.movie.isOpen)
            {
               if(_movieQuest.isFightQuest)
               {
                  if(User.current.showMovieBattles)
                  {
                     PanelBattle.activeMovieQuest = _movieQuest;
                     ViewManager.instance.showPanel("battle");
                  }
                  else
                  {
                     PanelBattle.lastViewedMode = 4;
                     MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
                  }
               }
               else if(_movieQuest.isStatQuest)
               {
                  PanelStatQuest.movieMode = true;
                  PanelStatQuest.datingStep = null;
                  if(User.current.showMovieStatAnimation)
                  {
                     ViewManager.instance.showPanel("stat_quest");
                  }
                  else
                  {
                     PanelStatQuest.lastViewedMode = 4;
                     MessageRouter.dispatch(new Message("ViewMessage.notifyStatQuestFinished",null,this));
                  }
               }
               else
               {
                  var startMovieCompleted:Function = function():void
                  {
                     Environment.panelManager.showDialog(new DialogMovieQuestComplete(_movieQuest));
                  };
                  Runtime.delayFunction(startMovieCompleted,1);
               }
            }
         }
         else if(response.error == "errStartMovieQuestNoActiveMovie")
         {
            close();
         }
         else if(response.error == "errRemoveMovieQuestEnergyNotEnough")
         {
            _btnStartQuest.buttonEnabled = true;
            Environment.panelManager.showDialog(new DialogOutOfMovieEnergy(startMovieQuest));
         }
         else if(response.error != "errStartMovieQuestInvalidQuest")
         {
            Environment.reportError(response.error,response.request);
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnStartQuest;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}

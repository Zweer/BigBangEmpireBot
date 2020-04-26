package com.playata.application.ui.dialogs
{
   import com.playata.application.data.herobook.Herobook;
   import com.playata.application.data.herobook.HerobookObjective;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.bonus.UiDailyBonusHerobook;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.herobook.UiHerobookLine;
   import com.playata.application.ui.elements.herobook.UiHerobookObjectiveComplete;
   import com.playata.application.ui.elements.herobook.UiHerobookObjectiveInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogHerobookGeneric;
   
   public class DialogHerobook extends UiDialog
   {
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _line1:UiHerobookLine = null;
      
      private var _line2:UiHerobookLine = null;
      
      private var _line3:UiHerobookLine = null;
      
      private var _line4:UiHerobookLine = null;
      
      private var _line5:UiHerobookLine = null;
      
      private var _objectiveInfo:UiHerobookObjectiveInfo = null;
      
      private var _objectiveComplete:UiHerobookObjectiveComplete = null;
      
      private var _herobook:Herobook = null;
      
      private var _dailyBonus:UiDailyBonusHerobook = null;
      
      public function DialogHerobook(param1:Herobook)
      {
         var _loc2_:SymbolDialogHerobookGeneric = new SymbolDialogHerobookGeneric();
         super(_loc2_);
         _queued = false;
         _herobook = param1;
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnHelp = new UiButton(_loc2_.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _line1 = new UiHerobookLine(_loc2_.line1,switchToInfo,refresh);
         _line2 = new UiHerobookLine(_loc2_.line2,switchToInfo,refresh);
         _line3 = new UiHerobookLine(_loc2_.line3,switchToInfo,refresh);
         _line4 = new UiHerobookLine(_loc2_.line4,switchToInfo,refresh);
         _line5 = new UiHerobookLine(_loc2_.line5,switchToInfo,refresh);
         _objectiveInfo = new UiHerobookObjectiveInfo(_loc2_.goalInfo,switchToList,switchToCompleteFromInfo);
         _objectiveComplete = new UiHerobookObjectiveComplete(_loc2_.goalComplete,switchToList,close);
         _dailyBonus = new UiDailyBonusHerobook(_loc2_.dailyBonusHerobook,1);
         _loc2_.goalInfo.x = 440;
         _loc2_.goalComplete.x = 370;
         refresh();
      }
      
      override public function show() : void
      {
         super.show();
         if(!User.current.character.hasTutorialFlag("tutorial_herobook_shown"))
         {
            showTutorialDialog();
            User.current.character.setTutorialFlag("tutorial_herobook_shown");
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnHelp.dispose();
         _btnHelp = null;
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
         _line3.dispose();
         _line3 = null;
         _line4.dispose();
         _line4 = null;
         _objectiveInfo.dispose();
         _objectiveInfo = null;
         _objectiveComplete.dispose();
         _objectiveComplete = null;
         _dailyBonus.dispose();
         _dailyBonus = null;
         super.dispose();
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/herobook/title"),LocText.current.text("dialog/tutorial/herobook/text"),null));
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function refresh() : void
      {
         if(!_line1)
         {
            return;
         }
         var _loc1_:Vector.<HerobookObjective> = _herobook.getCollectableInactiveObjectives();
         if(_loc1_ != null)
         {
            refreshList(_loc1_);
            Runtime.delayFunction(switchToInfo,0.6,[_loc1_[0]]);
         }
         else
         {
            refreshList(_herobook.objectives);
         }
         _dailyBonus.refresh();
      }
      
      private function refreshList(param1:Vector.<HerobookObjective>) : void
      {
         _line1.refresh(param1.length > 0?param1[0]:null,1,false);
         _line2.refresh(param1.length > 1?param1[1]:null,2,false);
         _line3.refresh(param1.length > 2?param1[2]:null,3,false);
         _line4.refresh(param1.length > 3?param1[3]:null,4,param1.length > 2);
         _line5.refresh(param1.length > 4?param1[4]:null,5,param1.length > 2);
      }
      
      private function stopTweens() : void
      {
         var _loc1_:SymbolDialogHerobookGeneric = _vo as SymbolDialogHerobookGeneric;
         _line1.content.killTweens(true);
         _line2.content.killTweens(true);
         _line3.content.killTweens(true);
         _line4.content.killTweens(true);
         _line5.content.killTweens(true);
         _loc1_.goalInfo.killTweens(true);
         _loc1_.goalComplete.killTweens(true);
      }
      
      private function switchToList() : void
      {
         if(!_line1)
         {
            return;
         }
         var _loc2_:SymbolDialogHerobookGeneric = _vo as SymbolDialogHerobookGeneric;
         stopTweens();
         var _loc1_:* = 0.3;
         _line1.content.tweenTo(_loc1_,{"x":-408});
         _line2.content.tweenTo(_loc1_,{"x":-408});
         _line3.content.tweenTo(_loc1_,{"x":-408});
         _line4.content.tweenTo(_loc1_,{"x":-408});
         _line5.content.tweenTo(_loc1_,{"x":-408});
         _loc2_.goalInfo.tweenTo(_loc1_,{"x":440});
         _loc2_.goalComplete.tweenTo(_loc1_,{"x":370});
         this.refresh();
         Environment.audio.playFX("ui_dialog_open.mp3");
      }
      
      private function switchToInfo(param1:HerobookObjective) : void
      {
         if(!_objectiveInfo)
         {
            return;
         }
         var _loc3_:SymbolDialogHerobookGeneric = _vo as SymbolDialogHerobookGeneric;
         if(param1.isCollected)
         {
            return;
         }
         if(!param1.isCollectable)
         {
            _objectiveInfo.content.visible = true;
            _objectiveComplete.content.visible = false;
            _objectiveInfo.refresh(param1);
         }
         else
         {
            _objectiveInfo.content.visible = false;
            _objectiveComplete.content.visible = true;
            _objectiveComplete.refresh(param1);
         }
         stopTweens();
         var _loc2_:* = 0.3;
         _line1.content.tweenTo(_loc2_,{"x":-1250});
         _line2.content.tweenTo(_loc2_,{"x":-1250});
         _line3.content.tweenTo(_loc2_,{"x":-1250});
         _line4.content.tweenTo(_loc2_,{"x":-1250});
         _line5.content.tweenTo(_loc2_,{"x":-1250});
         _loc3_.goalInfo.tweenTo(_loc2_,{"x":-408});
         _loc3_.goalComplete.tweenTo(_loc2_,{"x":-408});
         Environment.audio.playFX("ui_dialog_open.mp3");
      }
      
      private function switchToCompleteFromInfo(param1:HerobookObjective) : void
      {
         objective = param1;
         if(!_objectiveInfo.content.visible)
         {
            return;
         }
         if(!objective.isCollectable)
         {
            return;
         }
         _objectiveComplete.content.visible = true;
         _objectiveComplete.refresh(objective);
         stopTweens();
         _objectiveComplete.content.x = 370;
         var duration:Number = 0.3;
         _objectiveInfo.content.tweenTo(duration,{"x":-1030});
         _objectiveComplete.content.tweenTo(duration,{"x":-408});
         var cleanupCallback:Function = function():void
         {
            if(!_objectiveInfo)
            {
               return;
            }
            _objectiveInfo.content.visible = false;
            _objectiveInfo.content.x = -408;
         };
         Runtime.delayFunction(cleanupCallback,0.3);
         Environment.audio.playFX("ui_dialog_open.mp3");
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}

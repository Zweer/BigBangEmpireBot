package com.playata.application.ui.dialogs
{
   import com.playata.application.data.duel.MissedDuel;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.duel.UiMissedDuelsContent;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.panels.PanelDuels;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMissedDuelsGeneric;
   
   public class DialogMissedDuels extends UiDialog
   {
      
      public static const SCROLL_VALUE:int = 5;
      
      public static var MAX_LINES:int = 7;
       
      
      private var _btnClose:UiButton = null;
      
      private var _duelContent:UiMissedDuelsContent;
      
      private var _modeHistory:Boolean;
      
      public function DialogMissedDuels(param1:Vector.<MissedDuel>, param2:Boolean)
      {
         _modeHistory = param2;
         User.current.character.shownMissedDuels = param1.length;
         var _loc3_:SymbolDialogMissedDuelsGeneric = new SymbolDialogMissedDuelsGeneric();
         super(_loc3_);
         _duelContent = new UiMissedDuelsContent(_loc3_.missedDuelContent,param1,param2,onClickClose);
         _queued = false;
         if(_modeHistory)
         {
            MAX_LINES = 10;
         }
         else
         {
            MAX_LINES = 7;
         }
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _duelContent.show();
         updateTitle();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _duelContent.dispose();
         _duelContent = null;
         super.dispose();
      }
      
      private function updateTitle() : void
      {
         var _loc1_:SymbolDialogMissedDuelsGeneric = _vo as SymbolDialogMissedDuelsGeneric;
         if(_modeHistory)
         {
            _loc1_.txtDialogTitle.text = LocText.current.text("dialog/missed_duels/title_history");
         }
         else
         {
            _loc1_.txtDialogTitle.text = LocText.current.text("dialog/missed_duels/title");
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimMissedDuelsRewards",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimMissedDuelsRewards" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(ViewManager.instance.activePanelInstance is PanelDuels)
            {
               (ViewManager.instance.activePanelInstance as PanelDuels).refreshHistoryButton();
            }
            ViewManager.instance.baseUserPanel.refreshMissedDuelsBubble();
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}

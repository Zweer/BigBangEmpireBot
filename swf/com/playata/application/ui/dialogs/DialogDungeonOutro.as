package com.playata.application.ui.dialogs
{
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.data.dungeon.DungeonLevel;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDungeonOutroGeneric;
   
   public class DialogDungeonOutro extends UiDialog
   {
      
      private static var _isOpen:Boolean;
       
      
      private var _dungeon:Dungeon = null;
      
      private var _btnClose:UiTextButton = null;
      
      public function DialogDungeonOutro(param1:Dungeon)
      {
         _isOpen = true;
         _dungeon = param1;
         _queued = false;
         var _loc2_:SymbolDialogDungeonOutroGeneric = new SymbolDialogDungeonOutroGeneric();
         super(_loc2_);
         _loc2_.txtDialogTitle.text = _dungeon.completeTitle;
         _loc2_.txtInfo.text = _dungeon.completeText;
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _loc2_.photoLevel1.photo.removeAllChildren();
         _loc2_.photoLevel2.photo.removeAllChildren();
         _loc2_.photoLevel3.photo.removeAllChildren();
         var _loc3_:DungeonLevel = param1.getLevel(1);
         var _loc5_:DungeonLevel = param1.getLevel(2);
         var _loc4_:DungeonLevel = param1.getLevel(3);
         _loc2_.photoLevel1.photo.addChild(UriSprite.load(_loc3_.imageUrl,102,103,true,1,null,true));
         _loc2_.photoLevel2.photo.addChild(UriSprite.load(_loc5_.imageUrl,102,103,true,1,null,true));
         _loc2_.photoLevel3.photo.addChild(UriSprite.load(_loc4_.imageUrl,102,103,true,1,null,true));
         _loc2_.txtDoneLevel1.text = LocText.current.text("screen/dungeons/done");
         _loc2_.txtDoneLevel2.text = LocText.current.text("screen/dungeons/done");
         _loc2_.txtDoneLevel3.text = LocText.current.text("screen/dungeons/done");
         _loc2_.txtDoneLevel1.visible = _loc3_.isFinished;
         _loc2_.txtDoneLevel2.visible = _loc5_.isFinished;
         _loc2_.txtDoneLevel3.visible = _loc4_.isFinished;
         _loc2_.iconCheckmarkLevel1.visible = _loc2_.txtDoneLevel1.visible;
         _loc2_.iconCheckmarkLevel2.visible = _loc2_.txtDoneLevel2.visible;
         _loc2_.iconCheckmarkLevel3.visible = _loc2_.txtDoneLevel3.visible;
         _loc2_.txtFinished.text = LocText.current.text("dialog/dungeon_outro/completed");
         _loc2_.txtTimeUp.text = LocText.current.text("dialog/dungeon_outro/time_up");
         _loc2_.txtFinished.visible = param1.isFinished;
         _loc2_.txtTimeUp.visible = !_loc2_.txtFinished.visible;
         if(param1.isFinished)
         {
            Environment.audio.playFX("event_dungeon_complete.mp3");
         }
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
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
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("closeDungeon",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("closeDungeon" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            PanelCitymap.lastAction = 1;
            if(User.current.character.onMap)
            {
               ViewManager.instance.showPanel("citymap");
            }
            else
            {
               ViewManager.instance.showPanel("quests");
            }
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}

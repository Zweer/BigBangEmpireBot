package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.data.dungeon.DungeonLevel;
   import com.playata.application.ui.elements.dungeon.UiDungeonLevelInfo;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDungeonStatusGeneric;
   
   public class DialogDungeonStatus extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton;
      
      private var _levelLine1:UiDungeonLevelInfo;
      
      private var _levelLine2:UiDungeonLevelInfo;
      
      private var _levelLine3:UiDungeonLevelInfo;
      
      public function DialogDungeonStatus(param1:Dungeon, param2:Boolean = false)
      {
         var _loc3_:SymbolDialogDungeonStatusGeneric = new SymbolDialogDungeonStatusGeneric();
         super(_loc3_);
         _btnClose = new UiTextButton(_loc3_.btnClose,!!param2?LocText.current.text("dialog/dungeon_status/button_start_initial"):LocText.current.text("general/button_ok"),"",onClickClose);
         _loc3_.txtDialogTitle.text = param1.name;
         _loc3_.txtInfo.text = param1.descriptionText;
         _loc3_.txtLevelsCaption.text = LocText.current.text("dialog/dungeon_status/levels_caption");
         _loc3_.photo.photo.removeAllChildren();
         var _loc4_:DungeonLevel = param1.getLevel(1);
         var _loc6_:DungeonLevel = param1.getLevel(2);
         var _loc5_:DungeonLevel = param1.getLevel(3);
         _levelLine1 = new UiDungeonLevelInfo(_loc3_.level1,param1,_loc4_);
         _levelLine2 = new UiDungeonLevelInfo(_loc3_.level2,param1,_loc6_);
         _levelLine3 = new UiDungeonLevelInfo(_loc3_.level3,param1,_loc5_);
         _loc3_.photo.photo.setUriSprite(GameUtil.getDungeonPreviewImageUrl(param1.identifier),102,103,true,1,null,true);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _levelLine1.dispose();
         _levelLine2.dispose();
         _levelLine3.dispose();
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}

package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDungeonUnlockedGeneric;
   
   public class DialogDungeonUnlocked extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _onCloseCallback:Function;
      
      public function DialogDungeonUnlocked(param1:String, param2:Function)
      {
         _onCloseCallback = param2;
         var _loc3_:SymbolDialogDungeonUnlockedGeneric = new SymbolDialogDungeonUnlockedGeneric();
         super(_loc3_);
         _queued = false;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_unlocked/title");
         _loc3_.txtInfo.text = LocText.current.text("dialog/dungeon_unlocked/text",LocText.current.text("dungeon/" + param1 + "/name"));
         _btnClose = new UiTextButton(_loc3_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _loc3_.photo.photo.setUriSprite(GameUtil.getDungeonPreviewImageUrl(param1),102,103,true,1,null,true);
         Environment.audio.playFX("event_dungeon_unlocked.mp3");
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close(_onCloseCallback);
      }
   }
}

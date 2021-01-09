package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.guild.UiGuildEmblemContent;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildEmblemGeneric;
   
   public class DialogGuildEmblem extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _emblemContent:UiGuildEmblemContent = null;
      
      public function DialogGuildEmblem(param1:Guild)
      {
         var _loc2_:SymbolDialogGuildEmblemGeneric = new SymbolDialogGuildEmblemGeneric();
         super(_loc2_);
         _emblemContent = new UiGuildEmblemContent(param1,_loc2_.emblemContent,close);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_emblem/title");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _emblemContent.dispose();
         _emblemContent = null;
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}

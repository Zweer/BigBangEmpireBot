package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.streaming.UiStreamingActors;
   import com.playata.application.ui.elements.streaming.UiStreamingSettings;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogStreamingActorsGeneric;
   
   public class DialogStreamingActors extends UiDialog
   {
       
      
      private var _actors:UiStreamingActors = null;
      
      private var _settings:UiStreamingSettings = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnTabSettings:UiTabButton = null;
      
      private var _btnTabActors:UiTabButton = null;
      
      public function DialogStreamingActors()
      {
         var _loc1_:SymbolDialogStreamingActorsGeneric = new SymbolDialogStreamingActorsGeneric();
         super(_loc1_);
         _queued = false;
         _actors = new UiStreamingActors(_loc1_.actorsContent);
         _settings = new UiStreamingSettings(_loc1_.settingsContent);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnTabActors = new UiTabButton(_loc1_.btnTabActors,LocText.current.text("dialog/streaming_actors/btn_tab_actors"),"",onClickActors);
         _btnTabSettings = new UiTabButton(_loc1_.btnTabSettings,LocText.current.text("dialog/streaming_actors/btn_tab_settings"),"",onClickSettings);
         onClickActors(null);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickActors(param1:InteractionEvent) : void
      {
         _actors.visible = true;
         _actors.refreshList(true);
         _settings.visible = false;
         _btnTabActors.tabbed = true;
         _btnTabSettings.tabbed = false;
      }
      
      private function onClickSettings(param1:InteractionEvent) : void
      {
         _actors.visible = false;
         _settings.visible = true;
         _settings.refreshList(true);
         _btnTabActors.tabbed = false;
         _btnTabSettings.tabbed = true;
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _actors.dispose();
         _actors = null;
         _settings.dispose();
         _settings = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnTabSettings.dispose();
         _btnTabSettings = null;
         _btnTabActors.dispose();
         _btnTabActors = null;
         super.dispose();
      }
   }
}

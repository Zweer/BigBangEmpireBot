package com.playata.application.ui.dialogs
{
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.dating.UiDatingPictures;
   import com.playata.application.ui.elements.fan_foto.UiFanFotoPictures;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDatingPicturesGeneric;
   
   public class DialogDatingPictures extends UiDialog
   {
       
      
      private var _dating:UiDatingPictures;
      
      private var _fanFoto:UiFanFotoPictures;
      
      private var _btnClose:UiButton = null;
      
      private var _btnTabDating:UiTabButton;
      
      private var _btnTabFanFoto:UiTabButton;
      
      public function DialogDatingPictures(param1:Boolean = true)
      {
         var _loc2_:SymbolDialogDatingPicturesGeneric = new SymbolDialogDatingPicturesGeneric();
         super(_loc2_);
         _queued = false;
         _dating = new UiDatingPictures(_loc2_.dating,close);
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         if(User.current.character.dating && (User.current.character.fanFoto && User.current.character.hasTutorialFlag("fan_foto_tag1")))
         {
            _fanFoto = new UiFanFotoPictures(_loc2_.fanFoto,close);
            _loc2_.dating.txtDialogTitle.visible = false;
            _loc2_.fanFoto.txtTitle.visible = false;
            _btnTabDating = new UiTabButton(_loc2_.btnTabDating,LocText.current.text("dialog/dating_pictures/btn_tab"),"",onClickDating);
            _btnTabFanFoto = new UiTabButton(_loc2_.btnTabFanFoto,LocText.current.text("dialog/fan_foto_pictures/btn_tab"),"",onClickFanFoto);
         }
         else
         {
            _loc2_.btnTabDating.visible = false;
            _loc2_.btnTabFanFoto.visible = false;
            _loc2_.fanFoto.visible = false;
         }
         if(param1 || !_fanFoto)
         {
            onClickDating(null);
         }
         else
         {
            onClickFanFoto(null);
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         close();
      }
      
      private function onClickDating(param1:InteractionEvent) : void
      {
         _dating.visible = true;
         _dating.refreshList(true);
         if(_fanFoto)
         {
            _fanFoto.visible = false;
            _btnTabDating.tabbed = true;
            _btnTabFanFoto.tabbed = false;
         }
      }
      
      private function onClickFanFoto(param1:InteractionEvent) : void
      {
         _dating.visible = false;
         if(_fanFoto)
         {
            _fanFoto.visible = true;
            _fanFoto.refreshList(true);
            _btnTabDating.tabbed = false;
            _btnTabFanFoto.tabbed = true;
            if(!User.current.character.hasTutorialFlag("fan_foto_tag2"))
            {
               _btnTabDating.buttonEnabled = false;
               _btnTabFanFoto.buttonEnabled = false;
            }
         }
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _dating.dispose();
         _dating = null;
         if(_fanFoto)
         {
            _fanFoto.dispose();
            _fanFoto = null;
         }
         _btnClose.dispose();
         _btnClose = null;
         if(_btnTabDating)
         {
            _btnTabDating.dispose();
            _btnTabDating = null;
         }
         if(_btnTabFanFoto)
         {
            _btnTabFanFoto.dispose();
            _btnTabFanFoto = null;
         }
         super.dispose();
      }
   }
}

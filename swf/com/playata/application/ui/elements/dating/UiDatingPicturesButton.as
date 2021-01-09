package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogDatingPictures;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.dating.SymbolButtonDatingPicturesGeneric;
   
   public class UiDatingPicturesButton extends UiButton
   {
       
      
      private var _realContent:SymbolButtonDatingPicturesGeneric;
      
      public function UiDatingPicturesButton(param1:SymbolButtonDatingPicturesGeneric)
      {
         _realContent = param1;
         super(param1,"",onClickDatingPictures);
         visible = false;
      }
      
      public function refresh() : void
      {
         if(!DatingUtil.isAvailable)
         {
            visible = false;
            return;
         }
         var _loc1_:Character = User.current.character;
         visible = _loc1_.level >= CConstant.dating_unlock_level && _loc1_.hasTutorialFlag("tutorial_finished");
         _realContent.info.visible = false;
      }
      
      private function onClickDatingPictures(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         Environment.panelManager.showDialog(new DialogDatingPictures(true));
      }
   }
}

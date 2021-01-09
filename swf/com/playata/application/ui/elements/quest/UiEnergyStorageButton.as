package com.playata.application.ui.elements.quest
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.storage.SymbolButtonEnergyStorageGeneric;
   
   public class UiEnergyStorageButton extends UiButton
   {
       
      
      private var _realContent:SymbolButtonEnergyStorageGeneric;
      
      public function UiEnergyStorageButton(param1:SymbolButtonEnergyStorageGeneric, param2:Function)
      {
         _realContent = param1;
         super(param1,"",param2);
      }
      
      public function refresh() : void
      {
         if(!User.current)
         {
            return;
         }
         var _loc1_:Character = User.current.character;
         if(_loc1_.level < CConstant.storage_unlock_level)
         {
            visible = false;
            return;
         }
         visible = true;
         buttonEnabled = _loc1_.currentEnergyStorage > 0;
         if(_loc1_.isStorageUpgraded)
         {
            _realContent.icon.gotoAndStop("upgraded");
         }
         else
         {
            _realContent.icon.gotoAndStop("normal");
         }
         tooltip = LocText.current.text("screen/quests/energy_storage_tooltip",_loc1_.currentEnergyStorage,_loc1_.maximumEnergyStorage);
      }
   }
}

package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.optical_changes.OpticalChange;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeSlotGeneric;
   
   public class UiOpticalChangeIconSlot
   {
       
      
      private var _content:SymbolOpticalChangeSlotGeneric;
      
      private var _opticalChange:OpticalChange;
      
      public function UiOpticalChangeIconSlot(param1:SymbolOpticalChangeSlotGeneric)
      {
         super();
         _content = param1;
      }
      
      public function dispose() : void
      {
         _content = null;
         _opticalChange = null;
      }
      
      public function refresh(param1:OpticalChange, param2:Boolean = false) : void
      {
         _opticalChange = param1;
         _content.locked.removeAllChildren(true);
         _content.unlocked.removeAllChildren(true);
         if(param1.isUnlocked || param2)
         {
            _content.unlocked.setUriSprite(param1.iconImageUrl,80,80,true,1);
         }
         else
         {
            _content.locked.setUriSprite(param1.iconImageUrl,80,80,true,1);
         }
         _content.iconBorderCommon.visible = param1.rarity == 1;
         _content.iconBorderRare.visible = param1.rarity == 2;
         _content.iconBorderEpic.visible = param1.rarity == 3;
         _content.iconEffect.visible = param1.hasEffect;
         if(_content.iconEffect.visible)
         {
            _content.iconEffect.setUriSprite(param1.getEffectIconUrl,60,60,false,-1);
         }
      }
   }
}

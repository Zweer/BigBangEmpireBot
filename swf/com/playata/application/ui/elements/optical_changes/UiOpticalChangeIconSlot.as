package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.optical_changes.OpticalChange;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeSlotGeneric;
   
   public class UiOpticalChangeIconSlot
   {
       
      
      private var _content:SymbolOpticalChangeSlotGeneric = null;
      
      private var _opticalChange:OpticalChange = null;
      
      private var _filter:GrayscaleFilter = null;
      
      public function UiOpticalChangeIconSlot(param1:SymbolOpticalChangeSlotGeneric)
      {
         super();
         _content = param1;
         _filter = new GrayscaleFilter();
      }
      
      public function dispose() : void
      {
         _content = null;
         _opticalChange = null;
      }
      
      public function refresh(param1:OpticalChange, param2:Boolean = false) : void
      {
         _opticalChange = param1;
         _content.icon.removeAllChildren(true);
         _content.icon.setUriSprite(param1.iconImageUrl,80,80,true,1);
         _content.icon.removeAllFilters();
         if(!param1.isUnlocked && !param2)
         {
            _content.icon.addFilter(_filter);
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

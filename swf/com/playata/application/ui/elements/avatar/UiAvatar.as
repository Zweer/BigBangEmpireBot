package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   
   public class UiAvatar
   {
       
      
      private var _avatar:SymbolAvatarGeneric = null;
      
      private var _ownCharacter:Boolean = false;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _visual:IAvatarVisual = null;
      
      public function UiAvatar(param1:SymbolAvatarGeneric, param2:Boolean, param3:Boolean = false, param4:Boolean = false)
      {
         super();
         _avatar = param1;
         _ownCharacter = param2;
         _tooltip = new UiTextTooltip(_avatar.tooltipLayer,"");
         _visual = new UiAvatarLayeredVisual(_avatar,param3,param4);
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
         _avatar.dispose();
         _avatar = null;
         _visual.dispose();
         _visual = null;
      }
      
      public function mirror() : void
      {
         _avatar.scaleX = _avatar.scaleX * -1;
      }
      
      public function update(param1:AppearanceSettings, param2:Boolean) : void
      {
         _ownCharacter = param2;
         if(_ownCharacter)
         {
            if(param1.isMale)
            {
               _tooltip.text = LocText.current.text("general/character_male_tooltip");
            }
            else
            {
               _tooltip.text = LocText.current.text("general/character_female_tooltip");
            }
         }
         else
         {
            _tooltip.text = "";
         }
         _visual.update(param1);
      }
      
      public function startAnimation() : void
      {
         _visual.startAnimation();
      }
      
      public function stopAnimation() : void
      {
         _visual.stopAnimation();
      }
      
      public function set measurePerformance(param1:Boolean) : void
      {
         _visual.measurePerformance = param1;
      }
      
      public function get averageRenderTime() : Number
      {
         return _visual.averageRenderTime;
      }
      
      public function get container() : Sprite
      {
         return _avatar;
      }
   }
}

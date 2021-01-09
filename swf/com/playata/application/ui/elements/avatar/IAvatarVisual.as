package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.framework.core.IDisposable;
   
   public interface IAvatarVisual extends IDisposable
   {
       
      
      function update(param1:AppearanceSettings) : void;
      
      function set measurePerformance(param1:Boolean) : void;
      
      function get averageRenderTime() : Number;
      
      function startAnimation() : void;
      
      function stopAnimation() : void;
   }
}

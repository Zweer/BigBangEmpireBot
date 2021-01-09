package com.playata.application.ui.elements.citymap
{
   import com.playata.application.data.quest.Quest;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   
   public interface ICitymapQuestButton
   {
       
      
      function get quest() : Quest;
      
      function get tooltip() : Tooltip;
      
      function get displayObject() : IDisplayObject;
      
      function destroy() : void;
   }
}

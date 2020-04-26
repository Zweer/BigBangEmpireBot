package com.playata.application.ui.elements.generic
{
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.localization.LocText;
   
   public class UiOnlinePoint
   {
       
      
      private var _content:Sprite = null;
      
      private var _nameField:ILabel = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiOnlinePoint(param1:Sprite, param2:ILabel)
      {
         super();
         _content = param1;
         _nameField = param2;
         _tooltip = new UiTextTooltip(_content,"");
      }
      
      public function refresh(param1:Boolean, param2:String, param3:int = 8) : void
      {
         _content.visible = param1;
         if(_nameField)
         {
            _content.x = Math.round(_nameField.x + _nameField.textWidth + param3);
         }
         _tooltip.text = LocText.current.text("general/status_online",param2);
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
         _nameField = null;
         _content = null;
      }
   }
}

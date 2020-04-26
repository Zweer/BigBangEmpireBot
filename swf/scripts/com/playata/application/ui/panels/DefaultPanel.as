package com.playata.application.ui.panels
{
   import com.playata.application.ui.elements.generic.UiPanel;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ITextField;
   
   public class DefaultPanel extends UiPanel
   {
       
      
      protected var _excludedFontScalingTextfields:Vector.<ILabel> = null;
      
      public function DefaultPanel(param1:IDisplayObjectContainer)
      {
         super(param1);
         hide();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         refresh();
      }
      
      public function refresh() : void
      {
      }
      
      public function reset() : void
      {
      }
      
      public function refreshPanelLocalization() : void
      {
      }
      
      public function get excludedFontScalingTextFields() : Vector.<ILabel>
      {
         return _excludedFontScalingTextfields;
      }
      
      public function addExcludedFontScalingTextfield(param1:ILabel) : void
      {
         if(!_excludedFontScalingTextfields)
         {
            _excludedFontScalingTextfields = new Vector.<ILabel>();
         }
         _excludedFontScalingTextfields.push(param1);
      }
      
      public function createCenteredTextButton(param1:ITextField) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(param1);
         _loc2_.x = param1.x + param1.width / 2;
         _loc2_.y = param1.y + param1.height / 2;
         param1.x = -(param1.width / 2);
         param1.y = -(param1.height / 2);
         return _loc2_;
      }
      
      protected function get appWidthCenterCorrection() : Number
      {
         return Math.round((Environment.layout.appWidth - Environment.layout.appDefaultWidth) * 0.5);
      }
      
      protected function get appHeightCenterCorrection() : Number
      {
         return Math.round((Environment.layout.appHeight - Environment.layout.appDefaultHeight) * 0.5);
      }
   }
}

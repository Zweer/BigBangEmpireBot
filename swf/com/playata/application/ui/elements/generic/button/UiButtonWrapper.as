package com.playata.application.ui.elements.generic.button
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Sine;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   
   public class UiButtonWrapper
   {
       
      
      private var _tooltipLayer:InteractiveDisplayObject;
      
      private var _callback:Function;
      
      private var _callbackMouseOver:Function;
      
      private var _callbackMouseOut:Function;
      
      private var _mouseOverMode:String = "growTweened";
      
      private var _content:IDisplayObject;
      
      private var _originalScaleX:Number;
      
      private var _originalScaleY:Number;
      
      public function UiButtonWrapper(param1:IDisplayObjectContainer, param2:Function = null, param3:Function = null, param4:Function = null)
      {
         super();
         _callback = param2;
         _callbackMouseOver = param3;
         _callbackMouseOut = param4;
         _content = param1;
         _originalScaleX = _content.scaleX;
         _originalScaleY = _content.scaleY;
         _tooltipLayer = new InteractiveDisplayObject(param1["tooltipLayer"]);
         _tooltipLayer.onClick.add(handleClick);
         _tooltipLayer.onInteractionOut.add(handleInteractionOut);
         _tooltipLayer.onInteractionOver.add(handleInteractionOver);
      }
      
      public function dispose() : void
      {
         _tooltipLayer.dispose();
         _tooltipLayer = null;
         _content = null;
      }
      
      public function set clickCallback(param1:Function) : void
      {
         _callback = param1;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         param1.stopPropagation();
         if(_callback != null)
         {
            _callback(param1);
         }
      }
      
      protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         var _loc2_:* = mouseOverMode;
         switch(_loc2_)
         {
            case "none":
               break;
            case "grow":
               _content.scaleX = 1.1 * _originalScaleX;
               _content.scaleY = 1.1 * _originalScaleY;
               break;
            case "growTweened":
               _content.tweenTo(0.3,{
                  "scaleX":_originalScaleX * 1.1,
                  "scaleY":_originalScaleY * 1.1,
                  "ease":Back.easeOut
               });
               break;
            default:
               throw Error("Unsupported mouse over mode! mode=" + mouseOverMode);
         }
         if(_callbackMouseOver != null)
         {
            _callbackMouseOver(param1);
         }
      }
      
      protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         var _loc2_:* = mouseOverMode;
         switch(_loc2_)
         {
            case "none":
               break;
            case "grow":
               _content.scaleX = _originalScaleX;
               _content.scaleY = _originalScaleY;
               break;
            case "growTweened":
               _content.tweenTo(0.2,{
                  "scaleX":_originalScaleX,
                  "scaleY":_originalScaleY,
                  "ease":Sine.easeIn
               });
               break;
            default:
               throw Error("Unsupported mouse over mode! mode=" + mouseOverMode);
         }
         if(_callbackMouseOut != null)
         {
            _callbackMouseOut(param1);
         }
      }
      
      public function set mouseOverMode(param1:String) : void
      {
         _mouseOverMode = param1;
      }
      
      public function get mouseOverMode() : String
      {
         if(_mouseOverMode == "none")
         {
            return _mouseOverMode;
         }
         return _mouseOverMode;
      }
   }
}

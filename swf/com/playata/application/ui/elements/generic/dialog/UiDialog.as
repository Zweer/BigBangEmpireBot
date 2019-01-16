package com.playata.application.ui.elements.generic.dialog
{
   import com.greensock.easing.Quint;
   import com.playata.application.AppEnvironment;
   import com.playata.application.platform.AppPlatform;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.display.ui.panels.PanelManager;
   
   public class UiDialog extends Dialog
   {
       
      
      protected var _vo:IDisplayObjectContainer = null;
      
      protected var _onShownCallback:Function = null;
      
      protected var _closeCallback:Function = null;
      
      protected var _isClosing:Boolean = false;
      
      protected var _xOffset:Number = 0;
      
      protected var _yOffset:Number = 0;
      
      protected var _excludedFontScalingTextfields:Vector.<ILabel> = null;
      
      public function UiDialog(param1:IDisplayObjectContainer, param2:Boolean = true)
      {
         _vo = param1;
         super(param1,param2);
      }
      
      public function get panelManager() : PanelManager
      {
         return Environment.panelManager;
      }
      
      public function get platform() : AppPlatform
      {
         return AppEnvironment.appPlatform;
      }
      
      override public function onShow() : void
      {
         _vo.x = Environment.layout.appWidth / 2 + _xOffset;
         _vo.y = Environment.layout.appHeight / 2 + _yOffset;
         if(Environment.platform.isSteam)
         {
            _vo.y = Environment.layout.appDefaultHeight / 2 + _yOffset;
         }
         var _loc1_:TypedObject = new TypedObject({
            "scaleX":0,
            "scaleY":0,
            "ease":Quint.easeOut
         });
         if(_onShownCallback != null)
         {
            _loc1_.setFunction("onComplete",_onShownCallback);
         }
         _vo.tweenFrom(0.6,_loc1_);
         Environment.audio.playFX("ui_dialog_open.mp3");
         show();
         super.onShow();
      }
      
      override public function onClose(param1:Function = null) : void
      {
         if(_isClosing)
         {
            return;
         }
         _isClosing = true;
         _closeCallback = param1;
         Environment.audio.playFX("ui_dialog_open.mp3");
         _vo.tweenTo(0.2,{
            "scaleX":0,
            "scaleY":0,
            "ease":Quint.easeIn,
            "onComplete":onClosed
         });
      }
      
      public function show() : void
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
      
      private function onClosed() : void
      {
         _vo.killTweens();
         super.onClose(_closeCallback);
         _isClosing = false;
      }
      
      public function get content() : IDisplayObjectContainer
      {
         return _vo;
      }
   }
}

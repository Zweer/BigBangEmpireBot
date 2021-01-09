package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.ui.TextInputType;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.lib.flash.FlashKeyboardEvent;
   import com.playata.framework.input.lib.flash.FlashSoftKeyboardEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.SoftKeyboardEvent;
   import flash.text.TextField;
   
   public class FlashTextInput extends FlashTextField implements ITextInput
   {
       
      
      protected var _onChange:ISignal = null;
      
      protected var _onKeyDown:ISignal = null;
      
      protected var _onSoftKeyboardActivate:ISignal = null;
      
      protected var _onSoftKeyboardDeactivate:ISignal = null;
      
      public function FlashTextInput(param1:TypedObject, param2:TextField = null)
      {
         super(param1,param2);
         interactionEnabled = true;
         if(hasSetting("displayAsPassword",param1))
         {
            _textField.displayAsPassword = getBooleanSetting("displayAsPassword",param1,false);
         }
      }
      
      public static function setNativeInstance(param1:ITextInput, param2:TextField) : void
      {
         (param1 as FlashTextInput)._textField = param2;
         (param1 as FlashTextInput)._displayObject = param2;
         param1.interactionEnabled = true;
         (param1 as FlashTextInput).applyStyles();
      }
      
      public static function fromNative(param1:TextField) : FlashTextInput
      {
         return new FlashTextInput(null,param1);
      }
      
      private function onChangeHandler(param1:Event) : void
      {
         if(!§§pop())
         {
            _onChange.dispatch(this);
         }
      }
      
      private function onKeyDownHandler(param1:KeyboardEvent) : void
      {
         if(!§§pop())
         {
            _onKeyDown.dispatch(new FlashKeyboardEvent(this,param1));
         }
      }
      
      private function onSoftKeyboardActivateHandler(param1:SoftKeyboardEvent) : void
      {
         if(!§§pop())
         {
            _onSoftKeyboardActivate.dispatch(new FlashSoftKeyboardEvent(this,param1));
         }
      }
      
      private function onSoftKeyboardDeactivateHandler(param1:SoftKeyboardEvent) : void
      {
         if(!§§pop())
         {
            _onSoftKeyboardDeactivate.dispatch(new FlashSoftKeyboardEvent(this,param1));
         }
      }
      
      override public function dispose() : void
      {
         if(_onChange != null)
         {
            _textField.removeEventListener("change",onChangeHandler);
            _onChange.removeAll();
            _onChange = null;
         }
         if(_onKeyDown != null)
         {
            _textField.removeEventListener("keyDown",onKeyDownHandler);
            _onKeyDown.removeAll();
            _onKeyDown = null;
         }
         if(_onSoftKeyboardActivate != null)
         {
            _textField.removeEventListener("softKeyboardActivate",onSoftKeyboardActivateHandler);
            _onSoftKeyboardActivate.removeAll();
            _onSoftKeyboardActivate = null;
         }
         if(_onSoftKeyboardDeactivate != null)
         {
            _textField.removeEventListener("softKeyboardDeactivate",onSoftKeyboardDeactivateHandler);
            _onSoftKeyboardDeactivate.removeAll();
            _onSoftKeyboardDeactivate = null;
         }
         super.dispose();
      }
      
      public function get onChange() : ISignal
      {
         if(_onChange === null)
         {
            _textField.addEventListener("change",onChangeHandler);
            _onChange = new Signal();
         }
         return _onChange;
      }
      
      public function get onKeyDown() : ISignal
      {
         if(_onKeyDown === null)
         {
            _textField.addEventListener("keyDown",onKeyDownHandler);
            _onKeyDown = new Signal();
         }
         return _onKeyDown;
      }
      
      public function get onSoftKeyboardActivate() : ISignal
      {
         if(_onSoftKeyboardActivate === null)
         {
            _textField.addEventListener("softKeyboardActivate",onSoftKeyboardActivateHandler);
            _onSoftKeyboardActivate = new Signal();
         }
         return _onSoftKeyboardActivate;
      }
      
      public function get onSoftKeyboardDeactivate() : ISignal
      {
         if(_onSoftKeyboardDeactivate === null)
         {
            _textField.addEventListener("softKeyboardDeactivate",onSoftKeyboardDeactivateHandler);
            _onSoftKeyboardDeactivate = new Signal();
         }
         return _onSoftKeyboardDeactivate;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         _textField.displayAsPassword = param1;
      }
      
      public function get displayAsPassword() : Boolean
      {
         return _textField.displayAsPassword;
      }
      
      public function selectAll() : void
      {
         _textField.setSelection(0,_textField.text.length);
      }
      
      public function selectRange(param1:int, param2:int) : void
      {
         _textField.setSelection(param1,param2);
      }
      
      public function set maxChars(param1:uint) : void
      {
         _textField.maxChars = param1;
      }
      
      public function get maxChars() : uint
      {
         return _textField.maxChars;
      }
      
      public function set readOnly(param1:Boolean) : void
      {
         _textField.type = !!param1?"dynamic":"input";
      }
      
      public function get readOnly() : Boolean
      {
         return _textField.type == "dynamic";
      }
      
      public function set scrollV(param1:int) : void
      {
         _textField.scrollV = param1;
      }
      
      public function get scrollV() : int
      {
         return _textField.scrollV;
      }
      
      public function get maxScrollV() : int
      {
         return _textField.maxScrollV;
      }
      
      public function setFocus() : void
      {
         if(_textField.stage != null)
         {
            _textField.stage.focus = _textField;
         }
         else
         {
            Runtime.delayFunction(function():void
            {
               if(_textField.stage != null)
               {
                  _textField.stage.focus = _textField;
               }
            },0.2);
         }
      }
      
      public function set editable(param1:Boolean) : void
      {
      }
      
      public function get editable() : Boolean
      {
         return true;
      }
      
      public function get returnKeyLabel() : String
      {
         return null;
      }
      
      public function set returnKeyLabel(param1:String) : void
      {
      }
      
      public function set inputType(param1:TextInputType) : void
      {
      }
      
      public function get inputType() : TextInputType
      {
         return null;
      }
      
      public function set restrict(param1:String) : void
      {
      }
      
      public function get restrict() : String
      {
         return null;
      }
   }
}

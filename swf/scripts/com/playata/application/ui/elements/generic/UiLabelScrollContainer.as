package com.playata.application.ui.elements.generic
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.display.ui.controls.ITextField;
   
   public class UiLabelScrollContainer extends UiScrollContainer
   {
       
      
      private var _nativeTextField:ITextField = null;
      
      private var _verticalCenter:Boolean = false;
      
      private var _initTextFieldPositionY:Number = 0;
      
      private var _delayedRefresh:Boolean = false;
      
      private var _autoFontSizeEnabled:Boolean = false;
      
      public function UiLabelScrollContainer(param1:ITextField, param2:Direction = null, param3:Boolean = true, param4:Boolean = false, param5:Boolean = true, param6:Boolean = true, param7:Boolean = false)
      {
         super();
         if(param2 == null)
         {
            param2 = Direction.VERTICAL;
         }
         _nativeTextField = param1;
         _verticalCenter = param6;
         if(!Environment.info.isTouchScreen && !param7)
         {
            _autoFontSizeEnabled = true;
            _initTextFieldPositionY = _nativeTextField.y;
            _nativeTextField.autoFontSize = true;
            return;
         }
         init(_nativeTextField,param2,param3,param4,param5);
         _nativeTextField.autoAdjustWidthHeight = _direction == Direction.VERTICAL?TextFieldAutoAdjustWidthHeight.VERTICAL:TextFieldAutoAdjustWidthHeight.HORIZONTAL;
      }
      
      override public function refresh() : void
      {
         _nativeTextField.y = _initTextFieldPositionY;
         super.refresh();
         if(_verticalCenter)
         {
            if(!Environment.info.isTouchScreen)
            {
               _nativeTextField.y = _initTextFieldPositionY + (height - textHeight) / 2;
            }
            else
            {
               _nativeTextField.y = Math.round((height - textHeight) / 2);
            }
         }
         _delayedRefresh = false;
      }
      
      private function delayedRefresh() : void
      {
         if(_delayedRefresh)
         {
            return;
         }
         _delayedRefresh = true;
         Runtime.delayFunction(refresh,0.001);
      }
      
      public function verticallyAlignText(param1:int) : void
      {
         _nativeTextField.verticallyAlignText(param1);
      }
      
      override public function set height(param1:Number) : void
      {
         if(_autoFontSizeEnabled)
         {
            _nativeTextField.height = param1;
         }
         else
         {
            .super.height = param1;
         }
         delayedRefresh();
      }
      
      override public function get height() : Number
      {
         if(_autoFontSizeEnabled)
         {
            return _nativeTextField.height;
         }
         return super.height;
      }
      
      override public function set width(param1:Number) : void
      {
         if(_autoFontSizeEnabled)
         {
            _nativeTextField.width = param1;
         }
         else
         {
            .super.width = param1;
         }
      }
      
      override public function get width() : Number
      {
         if(_autoFontSizeEnabled)
         {
            return _nativeTextField.width;
         }
         return super.width;
      }
      
      override public function set y(param1:Number) : void
      {
         if(_autoFontSizeEnabled)
         {
            _nativeTextField.y = param1;
            _initTextFieldPositionY = param1;
            delayedRefresh();
         }
         else
         {
            .super.y = param1;
         }
      }
      
      override public function get y() : Number
      {
         if(_autoFontSizeEnabled)
         {
            return _nativeTextField.y;
         }
         return super.y;
      }
      
      override public function set x(param1:Number) : void
      {
         if(_autoFontSizeEnabled)
         {
            _nativeTextField.x = param1;
         }
         else
         {
            .super.x = param1;
         }
      }
      
      override public function get x() : Number
      {
         if(_autoFontSizeEnabled)
         {
            return _nativeTextField.x;
         }
         return super.x;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(_autoFontSizeEnabled)
         {
            _nativeTextField.visible = param1;
         }
         else
         {
            .super.visible = param1;
         }
      }
      
      override public function get visible() : Boolean
      {
         if(_autoFontSizeEnabled)
         {
            return _nativeTextField.visible;
         }
         return super.visible;
      }
      
      public function get textHeight() : Number
      {
         if(_autoFontSizeEnabled)
         {
            return _nativeTextField.textHeight;
         }
         if(_nativeTextField.height > height)
         {
            return height;
         }
         return _nativeTextField.height;
      }
      
      public function set text(param1:String) : void
      {
         _nativeTextField.text = param1;
         delayedRefresh();
      }
      
      public function get text() : String
      {
         return _nativeTextField.text;
      }
   }
}

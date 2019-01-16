package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IInteractionHandler;
   import com.playata.framework.display.InteractiveDisplayObjectState;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.display.ui.controls.IScrollBar;
   import com.playata.framework.display.ui.controls.ITextField;
   import com.playata.framework.input.lib.flash.FlashTextEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   
   public class FlashTextField extends FlashDisplayObject implements ITextField
   {
       
      
      protected var _textFieldContainer:Sprite = null;
      
      var _textField:TextField = null;
      
      protected var _textFormat:TextFormat = null;
      
      protected var _vAlign:Align;
      
      protected var _autoFontSize:Boolean = false;
      
      protected var _defaultFontSize:int = 0;
      
      protected var _isHtmlText:Boolean = false;
      
      protected var _onLinkClick:ISignal = null;
      
      protected var _interactionHandler:IInteractionHandler = null;
      
      protected var _state:InteractiveDisplayObjectState;
      
      protected var _verticalScrollBar:IScrollBar = null;
      
      protected var _horizontalScrollBar:IScrollBar = null;
      
      protected var _onScroll:ISignal = null;
      
      public function FlashTextField(param1:TypedObject, param2:TextField = null)
      {
         _vAlign = Align.TOP;
         _state = InteractiveDisplayObjectState.UP;
         if(param2)
         {
            _textFormat = param2.defaultTextFormat;
            _textField = param2;
            applyStyles();
         }
         else
         {
            _textFormat = new TextFormat();
            _textFormat.font = getStringSetting("fontName",param1,"Verdana");
            _textFormat.size = getIntSetting("fontSize",param1,12);
            _textFormat.color = getColorSetting("color",param1,0);
            _textFormat.bold = getBooleanSetting("bold",param1,false);
            _textFormat.italic = getBooleanSetting("italic",param1,false);
            _textFormat.underline = getBooleanSetting("underline",param1,false);
            _textFormat.align = FlashTypeConverter.toFlashAlign(getAlignSetting("hAlign",param1,Align.CENTER));
            _vAlign = getAlignSetting("vAlign",param1,Align.CENTER);
            if(hasSetting("leading",param1))
            {
               _textFormat.leading = getIntSetting("leading",param1,0);
            }
            if(hasSetting("kerning",param1))
            {
               _textFormat.kerning = getBooleanSetting("kerning",param1,true);
            }
            _textField = new TextField();
            _textField.defaultTextFormat = _textFormat;
            _textField.setTextFormat(_textFormat);
            _textField.width = getNumberSetting("width",param1,100);
            _textField.height = getNumberSetting("height",param1,100);
            _textField.text = getStringSetting("text",param1,"");
            _textField.selectable = false;
            _autoFontSize = getBooleanSetting("autoFontSize",param1,false);
         }
         _defaultFontSize = _textFormat.size as int;
         super(_textField);
         _interactionHandler = DisplayObjectFactory.createInteractionHandler(this);
         applySettings(param1);
         adjustText();
      }
      
      override public function dispose() : void
      {
         _interactionHandler.dispose();
         _interactionHandler = null;
         if(_onLinkClick)
         {
            _textField.removeEventListener("link",handleLink);
            _onLinkClick.removeAll();
            _onLinkClick = null;
         }
         if(_onScroll)
         {
            _textField.removeEventListener("scroll",handleScroll);
            _onScroll.removeAll();
            _onScroll = null;
         }
         super.dispose();
      }
      
      public function applyStyles() : void
      {
         if(!_textField)
         {
            return;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         _textField.width = param1;
         .super.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         _textField.height = param1;
         .super.height = param1;
      }
      
      public function set text(param1:String) : void
      {
         _textField.text = param1;
         _isHtmlText = false;
         adjustText();
      }
      
      public function get text() : String
      {
         return _textField.text;
      }
      
      public function set htmlText(param1:String) : void
      {
         _textField.htmlText = param1;
         _isHtmlText = true;
         adjustText();
      }
      
      public function get htmlText() : String
      {
         return _textField.htmlText;
      }
      
      public function set autoAdjustWidthHeight(param1:TextFieldAutoAdjustWidthHeight) : void
      {
         if(param1 == TextFieldAutoAdjustWidthHeight.NONE)
         {
            _textField.autoSize = "none";
         }
         else if(hAlign == Align.LEFT)
         {
            _textField.autoSize = "left";
         }
         else if(hAlign == Align.CENTER)
         {
            _textField.autoSize = "center";
         }
         else if(hAlign == Align.RIGHT)
         {
            _textField.autoSize = "right";
         }
      }
      
      public function get autoAdjustWidthHeight() : TextFieldAutoAdjustWidthHeight
      {
         if(_textField.autoSize == "none")
         {
            return TextFieldAutoAdjustWidthHeight.NONE;
         }
         return TextFieldAutoAdjustWidthHeight.BOTH_DIRECTIONS;
      }
      
      public function set fontName(param1:String) : void
      {
         _textFormat.font = param1;
         _textField.defaultTextFormat = _textFormat;
         _textField.setTextFormat(_textFormat);
         adjustText();
      }
      
      public function get fontName() : String
      {
         return _textFormat.font;
      }
      
      public function set fontSize(param1:uint) : void
      {
         _defaultFontSize = param1;
         _textFormat.size = param1;
         _textField.defaultTextFormat = _textFormat;
         _textField.setTextFormat(_textFormat);
         adjustText();
      }
      
      public function get fontSize() : uint
      {
         return _textFormat.size as uint;
      }
      
      public function set textColor(param1:uint) : void
      {
         _textFormat.color = param1;
         _textField.defaultTextFormat = _textFormat;
         _textField.setTextFormat(_textFormat);
      }
      
      public function get textColor() : uint
      {
         return _textFormat.color as uint;
      }
      
      public function set bold(param1:Boolean) : void
      {
         _textFormat.bold = param1;
         _textField.defaultTextFormat = _textFormat;
         _textField.setTextFormat(_textFormat);
         adjustText();
      }
      
      public function get bold() : Boolean
      {
         return _textFormat.bold;
      }
      
      public function set italic(param1:Boolean) : void
      {
         _textFormat.italic = param1;
         _textField.defaultTextFormat = _textFormat;
         _textField.setTextFormat(_textFormat);
         adjustText();
      }
      
      public function get italic() : Boolean
      {
         return _textFormat.italic;
      }
      
      public function set underline(param1:Boolean) : void
      {
         _textFormat.underline = param1;
         _textField.defaultTextFormat = _textFormat;
         _textField.setTextFormat(_textFormat);
         adjustText();
      }
      
      public function get underline() : Boolean
      {
         return _textFormat.underline;
      }
      
      public function set hAlign(param1:Align) : void
      {
         _textFormat.align = FlashTypeConverter.toFlashAlign(param1);
         _textField.defaultTextFormat = _textFormat;
         _textField.setTextFormat(_textFormat);
         adjustText();
      }
      
      public function get hAlign() : Align
      {
         return FlashTypeConverter.fromFlashAlign(_textFormat.align);
      }
      
      public function set vAlign(param1:Align) : void
      {
         _vAlign = param1;
         adjustText();
      }
      
      public function get vAlign() : Align
      {
         return _vAlign;
      }
      
      public function verticallyAlignText(param1:int) : void
      {
         _textField.autoSize = "center";
         _textField.y = _textField.y + (param1 - _textField.textHeight * 0.5);
      }
      
      public function set autoFontSize(param1:Boolean) : void
      {
         _autoFontSize = param1;
         adjustText();
      }
      
      public function get autoFontSize() : Boolean
      {
         return _autoFontSize;
      }
      
      public function set leading(param1:int) : void
      {
         _textFormat.leading = param1;
         _textField.defaultTextFormat = _textFormat;
         _textField.setTextFormat(_textFormat);
         adjustText();
      }
      
      public function get leading() : int
      {
         return _textFormat.leading as int;
      }
      
      public function set kerning(param1:Boolean) : void
      {
         _textFormat.kerning = param1;
         _textField.defaultTextFormat = _textFormat;
         _textField.setTextFormat(_textFormat);
         adjustText();
      }
      
      public function get kerning() : Boolean
      {
         return _textFormat.kerning;
      }
      
      public function get textBounds() : Rectangle
      {
         return new Rectangle(0,0,_textField.textWidth,_textField.textHeight);
      }
      
      public function getTextBounds(param1:Number) : Rectangle
      {
         var _loc3_:Boolean = true;
         var _loc8_:Number = width;
         var _loc2_:String = text;
         if(_isHtmlText)
         {
            _loc2_ = htmlText;
         }
         var _loc5_:Array = text.split("\n");
         var _loc6_:* = 0;
         var _loc9_:* = 0;
         var _loc7_:Rectangle = null;
         var _loc11_:int = 0;
         var _loc10_:* = _loc5_;
         for each(var _loc4_ in _loc5_)
         {
            if(_loc3_)
            {
               width = param1;
            }
            if(_isHtmlText)
            {
               htmlText = _loc4_;
            }
            else
            {
               text = _loc4_;
            }
            _loc7_ = textBounds;
            if(_loc6_ < _loc7_.width)
            {
               _loc6_ = Number(_loc7_.width);
            }
            _loc9_ = Number(_loc9_ + _loc7_.height);
         }
         if(_loc3_)
         {
            width = _loc8_;
         }
         if(_isHtmlText)
         {
            htmlText = _loc2_;
         }
         else
         {
            text = _loc2_;
         }
         return new Rectangle(0,0,_loc6_,_loc9_);
      }
      
      public function get textWidth() : Number
      {
         return _textField.textWidth;
      }
      
      public function get textHeight() : Number
      {
         return _textField.textHeight;
      }
      
      public function get firstVisibleLine() : uint
      {
         return _textField.scrollV;
      }
      
      public function get lastVisibleLine() : uint
      {
         return _textField.bottomScrollV;
      }
      
      public function getLineText(param1:int) : String
      {
         return _textField.getLineText(param1);
      }
      
      public function getLineLength(param1:int) : int
      {
         return _textField.getLineLength(param1);
      }
      
      public function get enabled() : Boolean
      {
         return true;
      }
      
      public function set enabled(param1:Boolean) : void
      {
      }
      
      public function get hasInteractionUp() : Boolean
      {
         return _interactionHandler.hasInteractionUp;
      }
      
      public function get hasInteractionDown() : Boolean
      {
         return _interactionHandler.hasInteractionDown;
      }
      
      public function get hasInteractionMove() : Boolean
      {
         return _interactionHandler.hasInteractionMove;
      }
      
      public function get hasInteractionOut() : Boolean
      {
         return _interactionHandler.hasInteractionOut;
      }
      
      public function get hasInteractionOver() : Boolean
      {
         return _interactionHandler.hasInteractionOver;
      }
      
      public function get hasClick() : Boolean
      {
         return _interactionHandler.hasClick;
      }
      
      public function get hasInactiveClick() : Boolean
      {
         return _interactionHandler.hasInactiveClick;
      }
      
      public function get hasDoubleClick() : Boolean
      {
         return _interactionHandler.hasDoubleClick;
      }
      
      public function get hasMouseWheel() : Boolean
      {
         return _interactionHandler.hasMouseWheel;
      }
      
      public function get hasInteractionSwipe() : Boolean
      {
         return _interactionHandler.hasInteractionSwipe;
      }
      
      public function get onInteractionUp() : ISignal
      {
         return _interactionHandler.onInteractionUp;
      }
      
      public function get onInteractionDown() : ISignal
      {
         return _interactionHandler.onInteractionDown;
      }
      
      public function get onInteractionMove() : ISignal
      {
         return _interactionHandler.onInteractionMove;
      }
      
      public function get onInteractionOut() : ISignal
      {
         return _interactionHandler.onInteractionOut;
      }
      
      public function get onInteractionOver() : ISignal
      {
         return _interactionHandler.onInteractionOver;
      }
      
      public function get onClick() : ISignal
      {
         return _interactionHandler.onClick;
      }
      
      public function get onInactiveClick() : ISignal
      {
         return _interactionHandler.onInactiveClick;
      }
      
      public function get onDoubleClick() : ISignal
      {
         return _interactionHandler.onDoubleClick;
      }
      
      public function get onMouseWheel() : ISignal
      {
         return _interactionHandler.onMouseWheel;
      }
      
      public function get onInteractionSwipe() : ISignal
      {
         return _interactionHandler.onInteractionSwipe;
      }
      
      public function get onLinkClick() : ISignal
      {
         if(_onLinkClick === null)
         {
            _textField.addEventListener("link",handleLink);
            _onLinkClick = new Signal();
         }
         return _onLinkClick;
      }
      
      public function get hasLinkClick() : Boolean
      {
         return _onLinkClick != null;
      }
      
      public function get state() : InteractiveDisplayObjectState
      {
         return _state;
      }
      
      public function set state(param1:InteractiveDisplayObjectState) : void
      {
         _state = param1;
      }
      
      public function get numLines() : int
      {
         return _textField.numLines;
      }
      
      public function prependText(param1:String) : void
      {
         _textField.text = param1 + _textField.text;
         adjustText();
      }
      
      public function appendText(param1:String) : void
      {
         _textField.appendText(param1);
         adjustText();
      }
      
      public function replaceText(param1:String, param2:String) : void
      {
         _textField.text = _textField.text.replace(param1,param2);
         adjustText();
      }
      
      public function setTextToFit(param1:String, param2:String, param3:Boolean = true) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:Boolean = false;
         if(param3)
         {
            var _loc6_:Boolean = false;
            _textField.wordWrap = _loc6_;
            _textField.multiline = _loc6_;
         }
         _textField.text = param1;
         if(!_textField.multiline)
         {
            _loc5_ = [" ",",","."];
            if(_textField.textWidth + 4 > _textField.width)
            {
               while(_textField.textWidth + 4 > _textField.width && param1.length > 2)
               {
                  param1 = param1.substr(0,-1);
                  while(_loc5_.indexOf(param1.charAt(param1.length - 1)) >= 0)
                  {
                     param1 = param1.substr(0,-1);
                  }
                  _textField.text = param1 + param2;
                  _loc4_ = true;
               }
            }
         }
         adjustText();
         return _loc4_;
      }
      
      public function clear() : void
      {
         _textField.text = "";
      }
      
      public function get length() : int
      {
         return _textField.length;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         _textField.selectable = param1;
      }
      
      public function get selectable() : Boolean
      {
         return _textField.selectable;
      }
      
      public function get tabEnabled() : Boolean
      {
         return _textField.tabEnabled;
      }
      
      public function set tabEnabled(param1:Boolean) : void
      {
         _textField.tabEnabled = param1;
      }
      
      public function get tabIndex() : int
      {
         return _textField.tabIndex;
      }
      
      public function set tabIndex(param1:int) : void
      {
         _textField.tabIndex = param1;
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         _textField.wordWrap = param1;
      }
      
      public function get wordWrap() : Boolean
      {
         return _textField.wordWrap;
      }
      
      public function get verticalScrollBar() : IScrollBar
      {
         return _verticalScrollBar;
      }
      
      public function set verticalScrollBar(param1:IScrollBar) : void
      {
         if(param1 && !_verticalScrollBar && !_horizontalScrollBar)
         {
            _textField.addEventListener("scroll",handleScroll);
            _textField.addEventListener("mouseWheel",handleMouseWheel);
         }
         else if(!param1 && !_horizontalScrollBar)
         {
            _textField.removeEventListener("scroll",handleScroll);
         }
         _verticalScrollBar = param1;
         if(_verticalScrollBar)
         {
            _verticalScrollBar.refresh();
         }
      }
      
      public function get horizontalScrollBar() : IScrollBar
      {
         return _horizontalScrollBar;
      }
      
      public function set horizontalScrollBar(param1:IScrollBar) : void
      {
         if(param1 && !_verticalScrollBar && !_horizontalScrollBar)
         {
            _textField.addEventListener("scroll",handleScroll);
            _textField.addEventListener("mouseWheel",handleMouseWheel);
         }
         else if(!param1 && !_verticalScrollBar)
         {
            _textField.removeEventListener("scroll",handleScroll);
         }
         _horizontalScrollBar = param1;
         if(_horizontalScrollBar)
         {
            _horizontalScrollBar.refresh();
         }
      }
      
      private function handleMouseWheel(param1:MouseEvent) : void
      {
         if(param1.delta > 0)
         {
            _textField.scrollV--;
         }
         else
         {
            _textField.scrollV++;
         }
      }
      
      private function adjustText() : void
      {
         if(_autoFontSize)
         {
            if(_isHtmlText)
            {
               fitStringInTextfield(_textField,htmlText,_defaultFontSize);
            }
            else
            {
               fitStringInTextfield(_textField,text,_defaultFontSize);
            }
         }
      }
      
      protected function handleLink(param1:TextEvent) : void
      {
         if(_onLinkClick != null)
         {
            _onLinkClick.dispatch(new FlashTextEvent(this,param1));
         }
      }
      
      protected function handleScroll(param1:Event) : void
      {
         if(_onScroll)
         {
            _onScroll.dispatch(this);
         }
         if(_verticalScrollBar && !_verticalScrollBar.isScrolling)
         {
            _verticalScrollBar.scrollValue = _textField.scrollV - 1;
         }
         if(_horizontalScrollBar && !_horizontalScrollBar.isScrolling)
         {
            _horizontalScrollBar.scrollValue = _textField.scrollH - 1;
         }
      }
      
      public function get onScroll() : ISignal
      {
         if(_onScroll === null)
         {
            _onScroll = new Signal();
         }
         return _onScroll;
      }
      
      public function scrollToStart(param1:Direction, param2:Number) : void
      {
         if(param1 == Direction.HORIZONTAL)
         {
            _textField.scrollH = 1;
         }
         else
         {
            _textField.scrollV = 1;
         }
      }
      
      public function scrollTo(param1:Direction, param2:Number, param3:Number) : void
      {
         if(param1 == Direction.HORIZONTAL)
         {
            _textField.scrollH = Math.round(param2 + 1);
         }
         else
         {
            _textField.scrollV = Math.round(param2 + 1);
         }
      }
      
      public function scrollToEnd(param1:Direction, param2:Number) : void
      {
         if(param1 == Direction.HORIZONTAL)
         {
            _textField.scrollH = _textField.maxScrollH;
         }
         else
         {
            _textField.scrollV = _textField.maxScrollV;
         }
      }
      
      public function isScrollable(param1:Direction) : Boolean
      {
         if(param1 == Direction.HORIZONTAL)
         {
            return _textField.maxScrollH > 1;
         }
         return _textField.maxScrollV > 1;
      }
      
      public function isAtScrollMin(param1:Direction) : Boolean
      {
         if(param1 == Direction.HORIZONTAL)
         {
            return _textField.scrollH == 1;
         }
         return _textField.scrollV == 1;
      }
      
      public function isAtScrollMax(param1:Direction) : Boolean
      {
         if(param1 == Direction.HORIZONTAL)
         {
            return _textField.scrollH == _textField.maxScrollH;
         }
         return _textField.scrollV == _textField.maxScrollV;
      }
      
      public function getScrollValue(param1:Direction) : Number
      {
         if(param1 == Direction.HORIZONTAL)
         {
            return _textField.scrollH - 1;
         }
         return _textField.scrollV - 1;
      }
      
      public function getScrollMax(param1:Direction) : Number
      {
         if(param1 == Direction.HORIZONTAL)
         {
            return _textField.maxScrollH - 1;
         }
         return _textField.maxScrollV - 1;
      }
      
      private function fitStringInTextfield(param1:TextField, param2:String, param3:int, param4:int = 4) : Boolean
      {
         if(param2 == null || param2 == "")
         {
            return false;
         }
         var _loc6_:* = param3;
         var _loc9_:TextFormat = param1.getTextFormat();
         var _loc8_:TextFormat = param1.defaultTextFormat;
         _loc8_.size = _loc6_;
         param1.defaultTextFormat = _loc8_;
         _loc9_.size = _loc6_;
         param1.setTextFormat(_loc9_);
         var _loc5_:Rectangle = getTextBoxSize(param1,param2,param1.width,false);
         var _loc7_:Boolean = false;
         if(param1.multiline)
         {
            while(_loc5_.height + param4 > param1.height)
            {
               _loc6_--;
               _loc9_ = param1.getTextFormat();
               _loc8_ = param1.defaultTextFormat;
               _loc8_.size = _loc6_;
               param1.defaultTextFormat = _loc8_;
               _loc9_.size = _loc6_;
               param1.setTextFormat(_loc9_);
               _loc5_ = getTextBoxSize(param1,param2,param1.width,false);
               _loc7_ = true;
            }
         }
         else
         {
            while(param1.textWidth > param1.width - 4)
            {
               _loc6_--;
               _loc9_ = param1.getTextFormat();
               _loc8_ = param1.defaultTextFormat;
               _loc8_.size = _loc6_;
               param1.defaultTextFormat = _loc8_;
               _loc9_.size = _loc6_;
               param1.setTextFormat(_loc9_);
               _loc7_ = true;
            }
         }
         return _loc7_;
      }
      
      private function getTextBoxSize(param1:TextField, param2:String, param3:Number, param4:Boolean = true) : Rectangle
      {
         var _loc5_:* = null;
         var _loc13_:Number = NaN;
         var _loc8_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:String = param1.text;
         var _loc14_:Number = param1.width;
         var _loc12_:Array = param2.split("\n");
         var _loc7_:* = 0;
         var _loc9_:* = 0;
         var _loc16_:int = 0;
         var _loc15_:* = _loc12_;
         for each(var _loc6_ in _loc12_)
         {
            if(param4)
            {
               param1.width = param3;
            }
            param1.text = _loc6_;
            _loc5_ = param1.getLineMetrics(0);
            _loc13_ = _loc5_.height;
            _loc8_ = 0;
            while(_loc8_ < param1.numLines)
            {
               _loc5_ = param1.getLineMetrics(_loc8_);
               _loc10_ = _loc5_.width;
               if(_loc7_ < _loc10_)
               {
                  _loc7_ = _loc10_;
               }
               _loc8_++;
            }
            _loc9_ = Number(_loc9_ + param1.numLines * _loc13_);
         }
         if(param4)
         {
            param1.width = _loc14_;
         }
         param1.text = _loc11_;
         return new Rectangle(0,0,_loc7_,_loc9_);
      }
   }
}

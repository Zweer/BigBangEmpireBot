package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.controls.IRichTextField;
   import com.playata.framework.display.ui.controls.RichElement;
   import com.playata.framework.display.ui.controls.RichElementInfo;
   import com.playata.framework.input.InteractionEvent;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class FlashRichTextField extends FlashTextField implements IRichTextField
   {
       
      
      protected var _elements:Vector.<RichElement>;
      
      protected var _showElements:Boolean;
      
      protected var _rawText:String = "";
      
      public var _container:Sprite = null;
      
      protected var _overlay:FlashRichTextOverlay = null;
      
      protected const PLACEHOLDER:String = "　";
      
      var _onElementUp:ISignal = null;
      
      var _onElementDown:ISignal = null;
      
      var _onElementMove:ISignal = null;
      
      var _onElementOut:ISignal = null;
      
      var _onElementOver:ISignal = null;
      
      var _onElementClick:ISignal = null;
      
      var _onElementDoubleClick:ISignal = null;
      
      public function FlashRichTextField(param1:TypedObject, param2:TextField = null)
      {
         _elements = new Vector.<RichElement>();
         super(param1,param2);
         _showElements = true;
         _rawText = super.text;
         _overlay = new FlashRichTextOverlay(this);
         _container = new Sprite();
         _container.addChild(this);
         _container.addChild(_overlay);
      }
      
      override public function set x(param1:Number) : void
      {
         _textField.x = param1;
         _overlay.x = param1;
      }
      
      override public function set y(param1:Number) : void
      {
         _textField.y = param1;
         _overlay.y = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         _textField.width = param1;
         _overlay._overlayMask.width = param1;
         _overlay.refresh();
      }
      
      override public function set height(param1:Number) : void
      {
         _textField.height = param1;
         _overlay._overlayMask.height = param1;
         _overlay.refresh();
      }
      
      override public function set text(param1:String) : void
      {
         _overlay.clear();
         _rawText = param1;
         .super.htmlText = param1;
         convertElements();
      }
      
      override public function get text() : String
      {
         return _rawText;
      }
      
      override public function prependText(param1:String) : void
      {
         _rawText = param1 + _rawText;
         _textField.htmlText = param1 + _textField.htmlText;
         convertElements();
      }
      
      override public function appendText(param1:String) : void
      {
         _rawText = _rawText + param1;
         _textField.htmlText = _textField.htmlText + param1;
         convertElements();
      }
      
      override public function replaceText(param1:String, param2:String) : void
      {
         _rawText = _rawText.replace(param1,param2);
         _textField.htmlText = _rawText;
         convertElements();
      }
      
      override public function clear() : void
      {
         _overlay.clear();
         _rawText = "";
         super.clear();
      }
      
      public function registerElement(param1:String, param2:Function, param3:TypedObject = null) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = _elements;
         for each(var _loc5_ in _elements)
         {
            if(_loc5_.code == param1)
            {
               return;
            }
         }
         var _loc4_:RichElement = new RichElement();
         _loc4_.code = param1;
         _loc4_.requestVisual = param2;
         _loc4_.tag = param3;
         _elements.push(_loc4_);
      }
      
      public function set showElements(param1:Boolean) : void
      {
         if(param1 == _showElements)
         {
            return;
         }
         _showElements = param1;
         text = _rawText;
      }
      
      public function get showElements() : Boolean
      {
         return _showElements;
      }
      
      public function get onElementUp() : ISignal
      {
         if(_onElementUp == null)
         {
            _onElementUp = new Signal();
         }
         return _onElementUp;
      }
      
      public function get onElementDown() : ISignal
      {
         if(_onElementDown == null)
         {
            _onElementDown = new Signal();
         }
         return _onElementDown;
      }
      
      public function get onElementMove() : ISignal
      {
         if(_onElementMove == null)
         {
            _onElementMove = new Signal();
         }
         return _onElementMove;
      }
      
      public function get onElementOut() : ISignal
      {
         if(_onElementOut == null)
         {
            _onElementOut = new Signal();
         }
         return _onElementOut;
      }
      
      public function get onElementOver() : ISignal
      {
         if(_onElementOver == null)
         {
            _onElementOver = new Signal();
         }
         return _onElementOver;
      }
      
      public function get onElementClick() : ISignal
      {
         if(_onElementClick == null)
         {
            _onElementClick = new Signal();
         }
         return _onElementClick;
      }
      
      public function get onElementDoubleClick() : ISignal
      {
         if(_onElementDoubleClick == null)
         {
            _onElementDoubleClick = new Signal();
         }
         return _onElementDoubleClick;
      }
      
      override protected function handleScroll(param1:Event) : void
      {
         super.handleScroll(param1);
         _overlay.refresh();
      }
      
      private function convertElements() : void
      {
         var _loc1_:* = null;
         if(!_showElements)
         {
            return;
         }
         var _loc3_:RichElementInfo = getNextElementInfo(_textField.text);
         var _loc2_:Number = getScrollValue(Direction.VERTICAL);
         while(_loc3_.index != -1)
         {
            _overlay.addElement(_loc3_);
            _textField.replaceText(_loc3_.index,_loc3_.index + _loc3_.code.length,"　");
            _loc1_ = new TextFormat();
            _loc1_.size = _defaultFontSize;
            _loc1_.letterSpacing = _loc3_.visual.width - 9;
            _textField.setTextFormat(_loc1_,_loc3_.index);
            _loc3_ = getNextElementInfo(_textField.text);
         }
         if(verticalScrollBar && _loc2_ != verticalScrollBar.scrollValue)
         {
            scrollTo(Direction.VERTICAL,_loc2_,0);
         }
         _overlay.refresh();
      }
      
      private function getNextElementInfo(param1:String) : RichElementInfo
      {
         str = param1;
         var index:int = -1;
         var currentIndex:int = -1;
         var info:RichElementInfo = new RichElementInfo();
         if(_elements.length <= 0)
         {
            info.index = index;
            return info;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _elements;
         for each(element in _elements)
         {
            index = str.indexOf(element.code);
            if(currentIndex == -1 || index != -1 && currentIndex > index)
            {
               currentIndex = index;
               info.index = index;
               info.code = element.code;
               info.visual = new InteractiveDisplayObject(element.requestVisual(element.code,element.tag));
               info.tag = element.tag;
               if(_onElementUp != null)
               {
                  info.visual.onInteractionUp.add(function(param1:InteractionEvent):void
                  {
                     _onElementUp.dispatch(info.code,info.tag);
                  });
               }
               if(_onElementDown != null)
               {
                  info.visual.onInteractionDown.add(function(param1:InteractionEvent):void
                  {
                     _onElementDown.dispatch(info.code,info.tag);
                  });
               }
               if(_onElementMove != null)
               {
                  info.visual.onInteractionMove.add(function(param1:InteractionEvent):void
                  {
                     _onElementMove.dispatch(info.code,info.tag);
                  });
               }
               if(_onElementOut != null)
               {
                  info.visual.onInteractionOut.add(function(param1:InteractionEvent):void
                  {
                     _onElementOut.dispatch(info.code,info.tag);
                  });
               }
               if(_onElementOver != null)
               {
                  info.visual.onInteractionOver.add(function(param1:InteractionEvent):void
                  {
                     _onElementOver.dispatch(info.code,info.tag);
                  });
               }
               if(_onElementClick != null)
               {
                  info.visual.onClick.add(function(param1:InteractionEvent):void
                  {
                     _onElementClick.dispatch(info.code,info.tag);
                  });
               }
               if(_onElementDoubleClick != null)
               {
                  info.visual.onDoubleClick.add(function(param1:InteractionEvent):void
                  {
                     _onElementDoubleClick.dispatch(info.code,info.tag);
                  });
               }
            }
         }
         return info;
      }
   }
}

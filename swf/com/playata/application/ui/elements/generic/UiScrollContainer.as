package com.playata.application.ui.elements.generic
{
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.controls.ScrollContainer;
   import com.playata.framework.display.ui.controls.ScrollPolicy;
   import com.playata.framework.display.ui.controls.ScrollerDefinition;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobSmallGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineSmallGeneric;
   
   public class UiScrollContainer
   {
       
      
      protected var _containerArea:IDisplayObject = null;
      
      protected var _scrollContainer:ScrollContainer = null;
      
      protected var _direction:Direction = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      public function UiScrollContainer()
      {
         super();
      }
      
      public function init(param1:IDisplayObject, param2:Direction, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         _containerArea = param1;
         _direction = param2;
         var _loc8_:ScrollerDefinition = new ScrollerDefinition();
         _loc8_.policy = _direction == Direction.VERTICAL?ScrollPolicy.VERTICAL:ScrollPolicy.HORIZONTAL;
         _loc8_.width = _containerArea.width;
         _loc8_.height = _containerArea.height;
         _loc8_.masked = param3;
         _loc8_.allowRubberBanding = param4;
         _loc8_.enableMouseWheel = param5;
         _scrollContainer = new ScrollContainer(_loc8_);
         _scrollContainer.x = _containerArea.x;
         _scrollContainer.y = _containerArea.y;
         _containerArea.parent.addChild(_scrollContainer);
         _containerArea.parent.setChildIndex(_scrollContainer,_containerArea.parent.getChildIndex(_scrollContainer));
         _containerArea.parent.removeChild(_containerArea);
         _containerArea.x = 0;
         _containerArea.y = 0;
         _scrollContainer.addElement(_containerArea);
         var _loc6_:Sprite = null;
         var _loc7_:Sprite = null;
         if(!Environment.info.isTouchScreen)
         {
            _loc6_ = new SymbolScrollKnobGeneric();
            _loc7_ = new SymbolScrollLineGeneric();
            _loc7_.width = 7;
            if(_direction == Direction.VERTICAL)
            {
               _loc6_.x = _scrollContainer.x + _scrollContainer.width;
               _loc6_.y = _scrollContainer.y;
               _loc7_.height = _scrollContainer.height;
               _loc7_.x = _scrollContainer.x + _scrollContainer.width + _loc7_.width * 1.5;
               _loc7_.y = _scrollContainer.y;
            }
            else
            {
               _loc6_.x = _scrollContainer.x;
               _loc6_.y = _scrollContainer.y + _scrollContainer.height / 2;
               _loc6_.rotation = 90;
               _loc7_.height = _loc7_.width;
               _loc7_.width = _scrollContainer.width;
               _loc7_.x = _scrollContainer.x;
               _loc7_.y = _scrollContainer.y + _scrollContainer.height + _loc7_.height / 2;
            }
         }
         else
         {
            _loc6_ = new SymbolScrollKnobSmallGeneric();
            _loc7_ = new SymbolScrollLineSmallGeneric();
            if(_direction == Direction.VERTICAL)
            {
               _loc6_.x = _scrollContainer.x + _scrollContainer.width;
               _loc6_.y = _scrollContainer.y;
               _loc7_.height = _scrollContainer.height;
               _loc7_.x = _scrollContainer.x + _scrollContainer.width;
               _loc7_.y = _scrollContainer.y;
            }
            else
            {
               _loc6_.x = _scrollContainer.x;
               _loc6_.y = _scrollContainer.y + _scrollContainer.height;
               _loc6_.rotation = 90;
               _loc7_.height = _loc7_.width;
               _loc7_.width = _scrollContainer.width;
               _loc7_.x = _scrollContainer.x;
               _loc7_.y = _scrollContainer.y + _scrollContainer.height;
            }
         }
         _scrollContainer.parent.addChild(_loc7_);
         _scrollContainer.parent.addChild(_loc6_);
         _scrollBar = new UiScrollBar(_loc6_,_loc7_,_scrollContainer,_direction);
         if(_direction == Direction.VERTICAL)
         {
            _scrollContainer.verticalScrollBar = _scrollBar;
         }
         else
         {
            _scrollContainer.horizontalScrollBar = _scrollBar;
         }
      }
      
      public function dispose() : void
      {
         if(!_scrollContainer)
         {
            return;
         }
         if(_direction == Direction.VERTICAL)
         {
            _scrollContainer.verticalScrollBar.dispose();
         }
         else
         {
            _scrollContainer.horizontalScrollBar.dispose();
         }
         if(_scrollBar)
         {
            _scrollBar.dispose();
            _scrollBar = null;
         }
         _scrollContainer.dispose();
         _scrollContainer = null;
         _direction = null;
         _containerArea = null;
      }
      
      public function refresh() : void
      {
         if(!_scrollContainer)
         {
            return;
         }
         if(_containerArea.x != 0)
         {
            _scrollContainer.x = _containerArea.x;
            _containerArea.x = 0;
         }
         if(_containerArea.y != 0)
         {
            _scrollContainer.y = _containerArea.y;
            _containerArea.y = 0;
         }
         _scrollContainer.refresh();
         if(_direction == Direction.VERTICAL)
         {
            _scrollContainer.verticalScrollBar.scrollToStart(0);
            _scrollContainer.verticalScrollBar.refresh();
         }
         else
         {
            _scrollContainer.horizontalScrollBar.scrollToStart(0);
            _scrollContainer.horizontalScrollBar.refresh();
         }
      }
      
      public function set height(param1:Number) : void
      {
         if(!_scrollContainer)
         {
            return;
         }
         _scrollContainer.height = param1;
         if(_direction == Direction.VERTICAL && _scrollContainer.verticalScrollBar)
         {
            _scrollContainer.verticalScrollBar.height = param1;
         }
      }
      
      public function get height() : Number
      {
         if(!_scrollContainer)
         {
            return 0;
         }
         return _scrollContainer.height;
      }
      
      public function set width(param1:Number) : void
      {
         if(!_scrollContainer)
         {
            return;
         }
         _scrollContainer.width = param1;
      }
      
      public function get width() : Number
      {
         if(!_scrollContainer)
         {
            return 0;
         }
         return _scrollContainer.width;
      }
      
      public function set y(param1:Number) : void
      {
         if(!_scrollContainer)
         {
            return;
         }
         _scrollContainer.y = param1;
      }
      
      public function get y() : Number
      {
         if(!_scrollContainer)
         {
            return 0;
         }
         return _scrollContainer.y;
      }
      
      public function set x(param1:Number) : void
      {
         if(!_scrollContainer)
         {
            return;
         }
         _scrollContainer.x = param1;
      }
      
      public function get x() : Number
      {
         if(!_scrollContainer)
         {
            return 0;
         }
         return _scrollContainer.x;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(!_scrollContainer)
         {
            return;
         }
         _scrollContainer.visible = param1;
         if(_scrollBar)
         {
            _scrollBar.visible = param1;
         }
      }
      
      public function get visible() : Boolean
      {
         if(!_scrollContainer)
         {
            return false;
         }
         return _scrollContainer.visible;
      }
   }
}

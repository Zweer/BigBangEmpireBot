package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.Core;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.GenericMap;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.ISprite;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.tween.Tween;
   import com.playata.framework.tween.TweenEaseType;
   import com.playata.framework.tween.TweenVars;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ScrollContainer extends Control implements IScrollContainer
   {
      
      protected static const HELPER_RECT:Rectangle = new Rectangle();
      
      protected static const HELPER_POINT_TOUCH:Point = new Point();
      
      protected static const HELPER_POINT_OFFSET:Point = new Point();
      
      protected static const HELPER_POINT_POSITION:Point = new Point();
      
      protected static const HELPER_POINT_DELTA:Point = new Point();
      
      protected static const MIN_DRAG_DISTANCE:Number = !!Core.current.info.isTouchScreen?10:1;
      
      protected static const SCROLL_TOUCHES:GenericMap = new GenericMap();
      
      protected static const TWEEN_VISIBLE:TweenVars = new TweenVars(new TypedObject({"alpha":1}));
      
      protected static const TWEEN_INVISIBLE:TweenVars = new TweenVars(new TypedObject({"alpha":0}));
       
      
      protected var _policy:ScrollPolicy;
      
      protected var _mainSprite:Sprite;
      
      protected var _container:ISprite;
      
      protected var _masked:Boolean;
      
      protected var _maskQuad:IDisplayObject = null;
      
      protected var _invalidated:Boolean;
      
      protected var _touching:Boolean;
      
      protected var _checkVisibility:Boolean = true;
      
      protected var _min:Point;
      
      protected var _speed:Point;
      
      protected var _movedOffset:Point;
      
      protected var _activeRect:Rectangle;
      
      protected var _containerSize:Point;
      
      protected var _containerPosition:Point;
      
      protected var _touchBlocker:IInteractiveDisplayObject;
      
      protected var _activeTouchId:int;
      
      protected var _absoluteTouchStartPosition:Point;
      
      protected var _touchStartPosition:Point;
      
      protected var _framesWithoutMovement:int;
      
      protected var _scrollIndicatorVertical:IImage = null;
      
      protected var _scrollIndicatorHorizontal:IImage = null;
      
      protected var _scrollIndicatorMinSize:Point;
      
      protected var _verticalScrollBar:IScrollBar = null;
      
      protected var _horizontalScrollBar:IScrollBar = null;
      
      protected var _onScroll:ISignal = null;
      
      protected var _viewPort:Rectangle;
      
      protected var _allowRubberBanding:Boolean;
      
      protected var _boundsChecker:Rectangle = null;
      
      protected var _boundsCache:GenericMap = null;
      
      public function ScrollContainer(param1:ScrollerDefinition)
      {
         _mainSprite = new Sprite();
         super(_mainSprite);
         _policy = param1.policy;
         _enabled = true;
         _touchBlocker = new InteractiveDisplayObject(DisplayObjectFactory.createQuadFromSettings({
            "width":100,
            "height":100,
            "color":65280
         }));
         _touchBlocker.alpha = 0;
         _mainSprite.addChild(_touchBlocker);
         _container = DisplayObjectFactory.createSpriteFromSettings();
         _mainSprite.addChild(_container);
         _containerPosition = new Point();
         _movedOffset = new Point();
         _min = new Point();
         _speed = new Point();
         _invalidated = true;
         _activeRect = new Rectangle(0,0,param1.width,param1.height);
         _viewPort = param1.viewPort.clone();
         if(_viewPort.width == 0)
         {
            _viewPort.width = _activeRect.width;
         }
         if(_viewPort.height == 0)
         {
            _viewPort.height = _activeRect.height;
         }
         _boundsChecker = new Rectangle(_activeRect.x,_activeRect.y,_activeRect.width,_activeRect.height);
         _absoluteTouchStartPosition = new Point();
         _touchStartPosition = new Point();
         _boundsCache = new GenericMap();
         masked = param1.masked;
         _allowRubberBanding = param1.allowRubberBanding;
         _scrollIndicatorMinSize = new Point();
         _containerSize = new Point();
         if(param1.scrollIndicatorVertical != null && _policy != ScrollPolicy.HORIZONTAL)
         {
            _scrollIndicatorVertical = param1.scrollIndicatorVertical;
            _scrollIndicatorMinSize.y = _scrollIndicatorVertical.height;
            _mainSprite.addChild(_scrollIndicatorVertical);
            _scrollIndicatorVertical.x = width - _scrollIndicatorVertical.width;
            _scrollIndicatorVertical.alpha = 0;
         }
         if(param1.scrollIndicatorHorizontal != null && _policy != ScrollPolicy.VERTICAL)
         {
            _scrollIndicatorHorizontal = param1.scrollIndicatorHorizontal;
            _scrollIndicatorMinSize.x = _scrollIndicatorHorizontal.width;
            _mainSprite.addChild(_scrollIndicatorHorizontal);
            _scrollIndicatorHorizontal.y = height - _scrollIndicatorHorizontal.height;
            _scrollIndicatorHorizontal.alpha = 0;
         }
         onAddedToStage.add(addedToStageHandler);
         onRemovedFromStage.add(removedFromStageHandler);
         if(param1.enableMouseWheel)
         {
            onMouseWheel.add(onMouseWheelHandler);
         }
      }
      
      public static function allowInteraction(param1:IInteractiveDisplayObject) : Boolean
      {
         if(param1 is ScrollContainer)
         {
            return true;
         }
         if(SCROLL_TOUCHES.length > 0)
         {
            return false;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         _interactionHandler.dispose();
         _interactionHandler = null;
         super.dispose();
      }
      
      public function set checkVisibility(param1:Boolean) : void
      {
         var _loc2_:* = param1 != _checkVisibility;
         _checkVisibility = param1;
         if(_loc2_)
         {
            refresh();
         }
      }
      
      public function get checkVisibility() : Boolean
      {
         return false;
      }
      
      public function get verticalScrollBar() : IScrollBar
      {
         return _verticalScrollBar;
      }
      
      public function set verticalScrollBar(param1:IScrollBar) : void
      {
         _verticalScrollBar = param1;
      }
      
      public function get horizontalScrollBar() : IScrollBar
      {
         return _horizontalScrollBar;
      }
      
      public function set horizontalScrollBar(param1:IScrollBar) : void
      {
         _horizontalScrollBar = param1;
      }
      
      public function refresh() : void
      {
         _invalidated = true;
         onUpdate(0);
      }
      
      public function addElement(param1:IDisplayObject, param2:int = -1) : IDisplayObject
      {
         if(param2 == -1)
         {
            _container.addChild(param1);
         }
         else
         {
            _container.addChildAt(param1,param2);
         }
         updateBounds(param1);
         _invalidated = true;
         return param1;
      }
      
      public function updateElement(param1:IDisplayObject) : IDisplayObject
      {
         updateBounds(param1);
         return param1;
      }
      
      public function removeElement(param1:IDisplayObject, param2:Boolean = false) : IDisplayObject
      {
         _container.removeChild(param1,param2);
         _boundsCache.remove(param1.nativeInstance);
         _invalidated = true;
         return param1;
      }
      
      public function removeAllElements() : void
      {
         _container.removeAllChildren();
         _invalidated = true;
      }
      
      public function get elementCount() : int
      {
         return _container.numChildren;
      }
      
      override public function get width() : Number
      {
         return _activeRect.width;
      }
      
      override public function set width(param1:Number) : void
      {
         if(param1 == _activeRect.width)
         {
            return;
         }
         if(_viewPort.width == _activeRect.width)
         {
            _viewPort.width = param1;
         }
         _activeRect.width = param1;
         _invalidated = true;
      }
      
      override public function get height() : Number
      {
         return _activeRect.height;
      }
      
      override public function set height(param1:Number) : void
      {
         if(param1 == _activeRect.height)
         {
            return;
         }
         if(_viewPort.height == _activeRect.height)
         {
            _viewPort.height = param1;
         }
         _activeRect.height = param1;
         _invalidated = true;
      }
      
      public function get masked() : Boolean
      {
         return _masked;
      }
      
      public function set masked(param1:Boolean) : void
      {
         if(param1 == _masked)
         {
            return;
         }
         _masked = param1;
         _invalidated = true;
      }
      
      public function scrollCenterElement(param1:IDisplayObject, param2:Number = 0.6) : void
      {
         if(param1.parent == null || param1.parent != _container)
         {
            return;
         }
         getPositionOfElement(param1,HELPER_POINT_POSITION);
         scrollToPosition(HELPER_POINT_POSITION,param2);
      }
      
      public function getPositionOfElement(param1:IDisplayObject, param2:Point, param3:Boolean = false) : void
      {
         var _loc4_:Rectangle = _boundsCache.getData(param1.nativeInstance);
         param2.x = _policy != ScrollPolicy.VERTICAL?-(_loc4_.x + (_loc4_.width >> 1)) + (_activeRect.width >> 1):0;
         param2.y = _policy != ScrollPolicy.HORIZONTAL?-(_loc4_.y + (_loc4_.height >> 1)) + (_activeRect.height >> 1):0;
         if(param3)
         {
            param2.x = NumberUtil.clampf(param2.x,_min.x,0);
            param2.y = NumberUtil.clampf(param2.y,_min.y,0);
         }
      }
      
      public function get contentEnabled() : Boolean
      {
         return interactionEnabled;
      }
      
      public function set contentEnabled(param1:Boolean) : void
      {
         interactionEnabled = param1;
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
         scrollTo(param1,0,param2);
      }
      
      public function scrollTo(param1:Direction, param2:Number, param3:Number) : void
      {
         HELPER_POINT_OFFSET.x = _containerPosition.x;
         HELPER_POINT_OFFSET.y = _containerPosition.y;
         if(param1 == Direction.HORIZONTAL)
         {
            HELPER_POINT_OFFSET.x = -param2;
         }
         if(param1 == Direction.VERTICAL)
         {
            HELPER_POINT_OFFSET.y = -param2;
         }
         scrollToPosition(HELPER_POINT_OFFSET,param3);
      }
      
      public function scrollToEnd(param1:Direction, param2:Number) : void
      {
         scrollTo(param1,getScrollMax(param1),param2);
      }
      
      public function isScrollable(param1:Direction) : Boolean
      {
         if(!_enabled)
         {
            return false;
         }
         if(param1 == Direction.HORIZONTAL)
         {
            return _containerSize.x > _activeRect.width;
         }
         if(param1 == Direction.VERTICAL)
         {
            return _containerSize.y > _activeRect.height;
         }
         return false;
      }
      
      public function isAtScrollMin(param1:Direction) : Boolean
      {
         if(param1 == Direction.HORIZONTAL)
         {
            return _containerPosition.x >= _min.x;
         }
         if(param1 == Direction.VERTICAL)
         {
            return _containerPosition.y >= _min.y;
         }
         return false;
      }
      
      public function isAtScrollMax(param1:Direction) : Boolean
      {
         if(param1 == Direction.HORIZONTAL)
         {
            return _containerPosition.x <= _min.x;
         }
         if(param1 == Direction.VERTICAL)
         {
            return _containerPosition.y <= _min.y;
         }
         return false;
      }
      
      public function getScrollValue(param1:Direction) : Number
      {
         if(!_enabled)
         {
            return 0;
         }
         if(param1 == Direction.HORIZONTAL)
         {
            return -_containerPosition.x;
         }
         if(param1 == Direction.VERTICAL)
         {
            return -_containerPosition.y;
         }
         return 0;
      }
      
      public function getScrollMax(param1:Direction) : Number
      {
         if(!_enabled)
         {
            return 0;
         }
         if(param1 == Direction.HORIZONTAL)
         {
            return _containerSize.x - _activeRect.width;
         }
         if(param1 == Direction.VERTICAL)
         {
            return _containerSize.y - _activeRect.height;
         }
         return 0;
      }
      
      public function scrollToPosition(param1:Point, param2:Number = 0.6) : void
      {
         pos = param1;
         duration = param2;
         if(_invalidated)
         {
            invalidate();
         }
         var _loc3_:int = 0;
         _speed.y = _loc3_;
         _speed.x = _loc3_;
         pos.x = NumberUtil.clampf(pos.x,_min.x,0);
         pos.y = NumberUtil.clampf(pos.y,_min.y,0);
         if(duration > 0)
         {
            var updatedPosition:Point = new Point(_containerPosition.x,_containerPosition.y);
            var positionTween:TweenVars = new TweenVars(new TypedObject({
               "x":pos.x,
               "y":pos.y,
               "onUpdate":function():void
               {
                  updateScrollBars(updatedPosition.x,updatedPosition.y);
               }
            }));
            positionTween.easeType = TweenEaseType.QuartInOut;
            Tween.to(updatedPosition,duration,positionTween);
         }
         else
         {
            updateScrollBars(pos.x,pos.y);
         }
      }
      
      protected function removedFromStageHandler(param1:IDisplayObject) : void
      {
         Core.current.heartbeat.remove(onUpdate);
      }
      
      protected function addedToStageHandler(param1:IDisplayObject) : void
      {
         _speed.x = 0;
         _speed.y = 0;
         _touching = false;
         _activeTouchId = -1;
         Core.current.heartbeat.add(onUpdate);
         onInteractionDown.add(handleInteractionDown);
         onInteractionUp.add(handleInteractionUp);
         onInteractionMove.add(handleInteractionMove);
      }
      
      protected function onMouseWheelHandler(param1:InteractionEvent) : void
      {
         var _loc4_:int = 0;
         _loc4_ = 30;
         if(!_enabled || !interactionEnabled)
         {
            return;
         }
         if(_policy == ScrollPolicy.HORIZONTAL && (_containerPosition.x < _min.x || _containerPosition.x > 0))
         {
            return;
         }
         if(_policy != ScrollPolicy.HORIZONTAL && (_containerPosition.y < _min.y || _containerPosition.y > 0))
         {
            return;
         }
         _speed.x = 0;
         _speed.y = 0;
         var _loc3_:Number = _containerPosition.x;
         var _loc2_:Number = _containerPosition.y;
         if(_policy == ScrollPolicy.HORIZONTAL)
         {
            _loc3_ = NumberUtil.clampf(_containerPosition.x + param1.mouseWheelDelta * 30,_min.x,0);
         }
         else
         {
            _loc2_ = NumberUtil.clampf(_containerPosition.y + param1.mouseWheelDelta * 30,_min.y,0);
         }
         updateScrollBars(_loc3_,_loc2_);
      }
      
      protected function updateTouchBlocker() : void
      {
         _touchBlocker.width = width;
         _touchBlocker.height = height;
      }
      
      protected function handleInteractionDown(param1:InteractionEvent) : void
      {
         if(!_enabled)
         {
            _activeTouchId = -1;
            return;
         }
         var _loc2_:int = 123;
         if(_activeTouchId == -1)
         {
            var _loc3_:int = 0;
            _movedOffset.y = _loc3_;
            _movedOffset.x = _loc3_;
            _loc3_ = 0;
            _speed.y = _loc3_;
            _speed.x = _loc3_;
            _activeTouchId = _loc2_;
            _framesWithoutMovement = 0;
            _absoluteTouchStartPosition.x = param1.globalX;
            _absoluteTouchStartPosition.y = param1.globalY;
            _touchStartPosition.x = _absoluteTouchStartPosition.x;
            _touchStartPosition.y = _absoluteTouchStartPosition.y;
            _touching = true;
            _container.killTweens();
            TWEEN_VISIBLE.easeType = TweenEaseType.Linear;
            if(_scrollIndicatorVertical != null)
            {
               _scrollIndicatorVertical.tweenTo((1 - _scrollIndicatorVertical.alpha) * 0.2,TWEEN_VISIBLE);
            }
            if(_scrollIndicatorHorizontal != null)
            {
               _scrollIndicatorHorizontal.tweenTo((1 - _scrollIndicatorHorizontal.alpha) * 0.2,TWEEN_VISIBLE);
            }
         }
      }
      
      protected function handleInteractionMove(param1:InteractionEvent) : void
      {
         if(!_enabled)
         {
            _activeTouchId = -1;
            return;
         }
         if(_activeTouchId == -1)
         {
            return;
         }
         _framesWithoutMovement = 0;
         HELPER_POINT_TOUCH.x = param1.globalX;
         HELPER_POINT_TOUCH.y = param1.globalY;
         if(!SCROLL_TOUCHES.exists(this) && Point.distance(HELPER_POINT_TOUCH,_absoluteTouchStartPosition) > MIN_DRAG_DISTANCE)
         {
            SCROLL_TOUCHES.setData(this,true);
         }
         if(_policy != ScrollPolicy.VERTICAL)
         {
            HELPER_POINT_OFFSET.x = _touchStartPosition.x - HELPER_POINT_TOUCH.x;
            HELPER_POINT_POSITION.x = _containerPosition.x - HELPER_POINT_OFFSET.x;
            if(HELPER_POINT_POSITION.x < _min.x || HELPER_POINT_POSITION.x > 0)
            {
               _speed.x = 0;
               if(_allowRubberBanding)
               {
                  HELPER_POINT_OFFSET.x = HELPER_POINT_OFFSET.x * 0.5;
               }
               else if(HELPER_POINT_POSITION.x < _min.x)
               {
                  HELPER_POINT_OFFSET.x = _containerPosition.x - _min.x;
               }
               else
               {
                  HELPER_POINT_OFFSET.x = _containerPosition.x;
               }
            }
            else
            {
               _speed.x = HELPER_POINT_OFFSET.x;
            }
            if(HELPER_POINT_OFFSET.x != 0)
            {
               updateScrollBars(_containerPosition.x - HELPER_POINT_OFFSET.x,_containerPosition.y);
               _movedOffset.x = _movedOffset.x + HELPER_POINT_OFFSET.x;
            }
            _touchStartPosition.x = HELPER_POINT_TOUCH.x;
         }
         if(_policy != ScrollPolicy.HORIZONTAL)
         {
            HELPER_POINT_OFFSET.y = _touchStartPosition.y - HELPER_POINT_TOUCH.y;
            HELPER_POINT_POSITION.y = _containerPosition.y - HELPER_POINT_OFFSET.y;
            if(HELPER_POINT_POSITION.y < _min.y || HELPER_POINT_POSITION.y > 0)
            {
               _speed.y = 0;
               if(_allowRubberBanding)
               {
                  HELPER_POINT_OFFSET.y = HELPER_POINT_OFFSET.y * 0.5;
               }
               else if(HELPER_POINT_POSITION.y < _min.y)
               {
                  HELPER_POINT_OFFSET.y = _containerPosition.y - _min.y;
               }
               else
               {
                  HELPER_POINT_OFFSET.y = _containerPosition.y;
               }
            }
            else
            {
               _speed.y = HELPER_POINT_OFFSET.y;
            }
            if(HELPER_POINT_OFFSET.y != 0)
            {
               updateScrollBars(_containerPosition.x,_containerPosition.y - HELPER_POINT_OFFSET.y);
               _movedOffset.y = _movedOffset.y + HELPER_POINT_OFFSET.y;
            }
            _touchStartPosition.y = HELPER_POINT_TOUCH.y;
         }
      }
      
      protected function handleInteractionUp(param1:InteractionEvent) : void
      {
         if(!_enabled)
         {
            _activeTouchId = -1;
            return;
         }
         if(_activeTouchId == -1)
         {
            return;
         }
         Runtime.delayFunction(releaseTouch,0.01);
         _touching = false;
         _activeTouchId = -1;
         TWEEN_INVISIBLE.easeType = TweenEaseType.Linear;
         if(_scrollIndicatorVertical != null)
         {
            _scrollIndicatorVertical.tweenTo(_scrollIndicatorVertical.alpha * 0.2,TWEEN_INVISIBLE);
         }
         if(_scrollIndicatorHorizontal != null)
         {
            _scrollIndicatorHorizontal.tweenTo(_scrollIndicatorHorizontal.alpha * 0.2,TWEEN_INVISIBLE);
         }
      }
      
      protected function releaseTouch() : void
      {
         SCROLL_TOUCHES.remove(this);
      }
      
      protected function onUpdate(param1:int) : void
      {
         if(_invalidated)
         {
            invalidate();
         }
         if(!_touching)
         {
            autoScroll();
         }
         if(_touching && _framesWithoutMovement > 4)
         {
            var _loc2_:int = 0;
            _speed.y = _loc2_;
            _speed.x = _loc2_;
         }
         _framesWithoutMovement = Number(_framesWithoutMovement) + 1;
         updateScroller();
         if(_policy != ScrollPolicy.VERTICAL && _container.x != _containerPosition.x)
         {
            _container.x = _containerPosition.x;
         }
         if(_policy != ScrollPolicy.HORIZONTAL && _container.y != _containerPosition.y)
         {
            _container.y = _containerPosition.y;
         }
         updateContentVisibility();
         onScrollerUpdate();
      }
      
      protected function onScrollerUpdate() : void
      {
      }
      
      protected function invalidate() : void
      {
         var _loc1_:int = 0;
         if(checkVisibility)
         {
            _loc1_ = 0;
            while(_loc1_ < _container.numChildren)
            {
               _container.getChildAt(_loc1_).visible = true;
               _loc1_++;
            }
         }
         getContainerSize(HELPER_RECT);
         _containerSize.x = HELPER_RECT.width;
         _containerSize.y = HELPER_RECT.height;
         _min.x = _policy != ScrollPolicy.VERTICAL?NumberUtil.minf(0,_activeRect.width - _containerSize.x):0;
         _min.y = _policy != ScrollPolicy.HORIZONTAL?NumberUtil.minf(0,_activeRect.height - _containerSize.y):0;
         _invalidated = false;
         updateTouchBlocker();
         if(_masked)
         {
            if(_maskQuad == null)
            {
               _maskQuad = DisplayObjectFactory.createQuadFromSettings({
                  "width":_activeRect.width,
                  "height":_activeRect.height
               });
               _mainSprite.addChild(_maskQuad);
            }
            if(_maskQuad.width != _activeRect.width)
            {
               _maskQuad.width = _activeRect.width;
            }
            if(_maskQuad.height != _activeRect.height)
            {
               _maskQuad.height = _activeRect.height;
            }
            mask = _maskQuad;
         }
         else
         {
            mask = null;
         }
      }
      
      protected function getContainerSize(param1:Rectangle) : void
      {
         _container.getBounds(_container,param1);
         param1.width = param1.width + param1.x;
         param1.height = param1.height + param1.y;
      }
      
      protected function updateBounds(param1:IDisplayObject) : void
      {
         param1.getBounds(_container,HELPER_RECT);
         setBounds(param1,HELPER_RECT.x,HELPER_RECT.y,HELPER_RECT.width,HELPER_RECT.height);
      }
      
      protected function setBounds(param1:IDisplayObject, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:* = null;
         if(_boundsCache.exists(param1.nativeInstance))
         {
            _loc6_ = _boundsCache.getData(param1.nativeInstance);
            _loc6_.x = param2;
            _loc6_.y = param3;
            _loc6_.width = param4;
            _loc6_.height = param5;
            _boundsCache.setData(param1.nativeInstance,_loc6_);
         }
         else
         {
            _boundsCache.setData(param1.nativeInstance,new Rectangle(param2,param3,param4,param5));
         }
      }
      
      protected function updateContentVisibility() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(!checkVisibility)
         {
            return;
         }
         _boundsChecker.x = _viewPort.x;
         _boundsChecker.y = _viewPort.y;
         _boundsChecker.width = _viewPort.width;
         _boundsChecker.height = _viewPort.height;
         _boundsChecker.y = _boundsChecker.y - _container.y;
         _boundsChecker.x = _boundsChecker.x - _container.x;
         var _loc1_:int = _container.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = _container.getChildAt(_loc2_);
            _loc3_.visible = _boundsChecker.intersects(_boundsCache.getData(_loc3_.nativeInstance));
            _loc2_++;
         }
      }
      
      protected function updateScroller() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc3_:Number = NaN;
         if(_scrollIndicatorVertical && _policy != ScrollPolicy.HORIZONTAL)
         {
            _loc1_ = NumberUtil.maxf(_containerSize.y,_activeRect.height);
            if(_containerPosition.y > 0)
            {
               _loc1_ = _loc1_ + _containerPosition.y;
            }
            else if(_containerPosition.y < _min.y)
            {
               _loc1_ = _loc1_ + (_min.y - _containerPosition.y);
            }
            _loc2_ = NumberUtil.maxf(_scrollIndicatorMinSize.y,_activeRect.height / _loc1_ * _activeRect.height);
            _scrollIndicatorVertical.height = _loc2_;
            if(_containerPosition.y > 0)
            {
               _scrollIndicatorVertical.y = 0;
            }
            else if(_containerPosition.y < _min.y)
            {
               _scrollIndicatorVertical.y = _activeRect.height - _loc2_;
            }
            else
            {
               _scrollIndicatorVertical.y = _containerPosition.y / _min.y * (_activeRect.height - _loc2_);
            }
         }
         if(_scrollIndicatorHorizontal && _policy != ScrollPolicy.VERTICAL)
         {
            _loc4_ = NumberUtil.maxf(_containerSize.x,_activeRect.width);
            if(_containerPosition.x > 0)
            {
               _loc4_ = _loc4_ + _containerPosition.x;
            }
            else if(_containerPosition.x < _min.x)
            {
               _loc4_ = _loc4_ + (_min.x - _containerPosition.x);
            }
            _loc3_ = NumberUtil.maxf(_scrollIndicatorMinSize.x,_activeRect.width / _loc4_ * _activeRect.width);
            _scrollIndicatorHorizontal.width = _loc3_;
            if(_containerPosition.x > 0)
            {
               _scrollIndicatorHorizontal.x = 0;
            }
            else if(_containerPosition.x < _min.x)
            {
               _scrollIndicatorHorizontal.x = _activeRect.width - _loc3_;
            }
            else
            {
               _scrollIndicatorHorizontal.x = _containerPosition.x / _min.x * (_activeRect.width - _loc3_);
            }
         }
      }
      
      protected function autoScroll() : void
      {
         var _loc1_:* = NaN;
         _loc1_ = 0.9;
         if(_speed.x != 0 || _speed.y != 0)
         {
            updateScrollBars(_containerPosition.x - _speed.x,_containerPosition.y - _speed.y);
         }
         _speed.x = _speed.x * 0.9;
         if(NumberUtil.absf(_speed.x) < 0.05)
         {
            _speed.x = 0;
         }
         _speed.y = _speed.y * 0.9;
         if(NumberUtil.absf(_speed.y) < 0.05)
         {
            _speed.x = 0;
         }
         if(_containerPosition.x > 0 || _containerPosition.x < _min.x)
         {
            if(_allowRubberBanding)
            {
               HELPER_POINT_DELTA.x = _containerPosition.x > 0?_containerPosition.x:Number(_containerPosition.x - _min.x);
               HELPER_POINT_DELTA.x = HELPER_POINT_DELTA.x * 0.2;
               if(NumberUtil.absf(HELPER_POINT_DELTA.x) < 0.05)
               {
                  HELPER_POINT_DELTA.x = 0;
               }
            }
            else if(_containerPosition.x < _min.x)
            {
               HELPER_POINT_DELTA.x = _containerPosition.x - _min.x;
            }
            else
            {
               HELPER_POINT_DELTA.x = _containerPosition.x;
            }
            if(HELPER_POINT_DELTA.x != 0)
            {
               updateScrollBars(_containerPosition.x - HELPER_POINT_DELTA.x,_containerPosition.y);
            }
         }
         if(_containerPosition.y > 0 || _containerPosition.y < _min.y)
         {
            if(_allowRubberBanding)
            {
               HELPER_POINT_DELTA.y = _containerPosition.y > 0?_containerPosition.y:Number(_containerPosition.y - _min.y);
               HELPER_POINT_DELTA.y = HELPER_POINT_DELTA.y * 0.2;
               if(NumberUtil.absf(HELPER_POINT_DELTA.y) < 0.05)
               {
                  HELPER_POINT_DELTA.y = 0;
               }
            }
            else if(_containerPosition.y < _min.y)
            {
               HELPER_POINT_DELTA.y = _containerPosition.y - _min.y;
            }
            else
            {
               HELPER_POINT_DELTA.y = _containerPosition.y;
            }
            if(HELPER_POINT_DELTA.y != 0)
            {
               updateScrollBars(_containerPosition.x,_containerPosition.y - HELPER_POINT_DELTA.y);
            }
         }
      }
      
      protected function updateScrollBars(param1:Number, param2:Number) : void
      {
         var _loc5_:Number = _containerPosition.x;
         var _loc6_:Number = _containerPosition.y;
         var _loc4_:Boolean = false;
         var _loc3_:Boolean = false;
         if(param1 != _loc5_)
         {
            _loc4_ = true;
            _containerPosition.x = param1;
         }
         if(param2 != _loc6_)
         {
            _loc3_ = true;
            _containerPosition.y = param2;
         }
         if(_loc4_ && (_policy == ScrollPolicy.HORIZONTAL || _policy == ScrollPolicy.BOTH) && _horizontalScrollBar != null)
         {
            _horizontalScrollBar.refresh();
         }
         if(_loc3_ && (_policy == ScrollPolicy.VERTICAL || _policy == ScrollPolicy.BOTH) && _verticalScrollBar != null)
         {
            _verticalScrollBar.refresh();
         }
         if((_loc4_ || _loc3_) && _onScroll !== null)
         {
            _onScroll.dispatch(this);
         }
      }
   }
}

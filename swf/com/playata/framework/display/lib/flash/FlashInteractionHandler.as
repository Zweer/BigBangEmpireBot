package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.IInteractionHandler;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObjectState;
   import com.playata.framework.display.ui.controls.IControl;
   import com.playata.framework.display.ui.controls.ScrollContainer;
   import com.playata.framework.input.lib.flash.FlashMouseEvent;
   import com.playata.framework.input.lib.flash.FlashRelativeStageMouseEvent;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class FlashInteractionHandler implements IInteractionHandler
   {
      
      private static const MAX_DRAG_DIST:Number = 10;
       
      
      protected var _displayObject:DisplayObject = null;
      
      protected var _ido:IInteractiveDisplayObject = null;
      
      protected var _triggerBounds:Rectangle = null;
      
      protected var _delayedClick:uint = 0;
      
      protected var _stageMouseMoveRegistered:Boolean = false;
      
      protected var _onInteractionUp:ISignal = null;
      
      protected var _onInteractionDown:ISignal = null;
      
      protected var _onInteractionMove:ISignal = null;
      
      protected var _onInteractionOut:ISignal = null;
      
      protected var _onInteractionOver:ISignal = null;
      
      protected var _onClick:ISignal = null;
      
      protected var _onInactiveClick:ISignal = null;
      
      protected var _onDoubleClick:ISignal = null;
      
      protected var _onMouseWheel:ISignal = null;
      
      protected var _onInteractionSwipe:ISignal = null;
      
      public function FlashInteractionHandler(param1:IInteractiveDisplayObject)
      {
         super();
         _ido = param1;
         _displayObject = FlashDisplayObject.getNativeDisplayObject(_ido);
      }
      
      public function dispose() : void
      {
         if(_onInteractionUp)
         {
            _onInteractionUp.removeAll();
            _onInteractionUp = null;
            _displayObject.removeEventListener("mouseUp",handleMouseInteraction);
            _displayObject.removeEventListener("releaseOutside",handleMouseInteraction);
         }
         if(_onInteractionDown)
         {
            _onInteractionDown.removeAll();
            _onInteractionDown = null;
            _displayObject.removeEventListener("mouseDown",handleMouseInteraction);
         }
         if(_onInteractionMove)
         {
            _onInteractionMove.removeAll();
            _onInteractionMove = null;
            _displayObject.removeEventListener("mouseMove",handleMouseInteraction);
         }
         if(_onInteractionOut)
         {
            _onInteractionOut.removeAll();
            _onInteractionOut = null;
            _displayObject.removeEventListener("rollOut",handleMouseInteraction);
         }
         if(_onInteractionOver)
         {
            _onInteractionOver.removeAll();
            _onInteractionOver = null;
            _displayObject.removeEventListener("rollOver",handleMouseInteraction);
         }
         if(_onClick)
         {
            _onClick.removeAll();
            _onClick = null;
            _displayObject.removeEventListener("click",handleMouseInteraction);
         }
         if(_onInactiveClick)
         {
            _onInactiveClick.removeAll();
            _onInactiveClick = null;
         }
         if(_onDoubleClick)
         {
            _onDoubleClick.removeAll();
            _onDoubleClick = null;
            _displayObject.removeEventListener("doubleClick",handleMouseInteraction);
         }
         if(_onMouseWheel)
         {
            _onMouseWheel.removeAll();
            _onMouseWheel = null;
            _displayObject.removeEventListener("mouseWheel",handleMouseInteraction);
         }
         if(_onInteractionSwipe)
         {
            _onInteractionSwipe.removeAll();
            _onInteractionSwipe = null;
         }
      }
      
      public function get interactiveDisplayObject() : IInteractiveDisplayObject
      {
         return _ido;
      }
      
      public function get hasInteractionUp() : Boolean
      {
         return _onInteractionUp !== null;
      }
      
      public function get hasInteractionDown() : Boolean
      {
         return _onInteractionDown !== null;
      }
      
      public function get hasInteractionMove() : Boolean
      {
         return _onInteractionMove !== null;
      }
      
      public function get hasInteractionOut() : Boolean
      {
         return _onInteractionOut !== null;
      }
      
      public function get hasInteractionOver() : Boolean
      {
         return _onInteractionOver !== null;
      }
      
      public function get hasClick() : Boolean
      {
         return _onClick !== null;
      }
      
      public function get hasInactiveClick() : Boolean
      {
         return _onInactiveClick !== null;
      }
      
      public function get hasDoubleClick() : Boolean
      {
         return _onDoubleClick !== null;
      }
      
      public function get hasMouseWheel() : Boolean
      {
         return _onMouseWheel !== null;
      }
      
      public function get hasInteractionSwipe() : Boolean
      {
         return _onInteractionSwipe !== null;
      }
      
      public function get onInteractionUp() : ISignal
      {
         if(_onInteractionUp === null)
         {
            _ido.interactionEnabled = true;
            _onInteractionUp = new Signal();
            _displayObject.addEventListener("mouseUp",handleMouseInteraction);
            _displayObject.addEventListener("releaseOutside",handleMouseInteraction);
         }
         return _onInteractionUp;
      }
      
      public function get onInteractionDown() : ISignal
      {
         if(_onInteractionDown === null)
         {
            _ido.interactionEnabled = true;
            _onInteractionDown = new Signal();
            _displayObject.addEventListener("mouseDown",handleMouseInteraction);
         }
         return _onInteractionDown;
      }
      
      public function get onInteractionMove() : ISignal
      {
         if(_onInteractionMove === null)
         {
            _ido.interactionEnabled = true;
            _onInteractionMove = new Signal();
            _displayObject.addEventListener("mouseMove",handleMouseInteraction);
         }
         return _onInteractionMove;
      }
      
      public function get onInteractionOut() : ISignal
      {
         if(_onInteractionOut === null)
         {
            _ido.interactionEnabled = true;
            _onInteractionOut = new Signal();
            _displayObject.addEventListener("rollOut",handleMouseInteraction);
         }
         return _onInteractionOut;
      }
      
      public function get onInteractionOver() : ISignal
      {
         if(_onInteractionOver === null)
         {
            _ido.interactionEnabled = true;
            _onInteractionOver = new Signal();
            _displayObject.addEventListener("rollOver",handleMouseInteraction);
         }
         return _onInteractionOver;
      }
      
      public function get onClick() : ISignal
      {
         if(_onClick === null)
         {
            _ido.interactionEnabled = true;
            _ido.useHandCursor = true;
            _onClick = new Signal();
            _ido.useHandCursor = true;
            _displayObject.addEventListener("click",handleMouseInteraction);
         }
         return _onClick;
      }
      
      public function get onInactiveClick() : ISignal
      {
         if(_onInactiveClick === null)
         {
            _ido.interactionEnabled = true;
            _ido.useHandCursor = true;
            _onInactiveClick = new Signal();
            _ido.useHandCursor = true;
         }
         return _onInactiveClick;
      }
      
      public function get onDoubleClick() : ISignal
      {
         if(_onDoubleClick === null)
         {
            _ido.interactionEnabled = true;
            _ido.useHandCursor = true;
            setDoubleClickEnabled(_displayObject);
            _onDoubleClick = new Signal();
            _ido.useHandCursor = true;
            _displayObject.addEventListener("doubleClick",handleMouseInteraction);
         }
         return _onDoubleClick;
      }
      
      public function get onMouseWheel() : ISignal
      {
         if(_onMouseWheel === null)
         {
            _ido.interactionEnabled = true;
            _onMouseWheel = new Signal();
            _displayObject.addEventListener("mouseWheel",handleMouseInteraction);
         }
         return _onMouseWheel;
      }
      
      public function get onInteractionSwipe() : ISignal
      {
         if(_onInteractionSwipe === null)
         {
            _ido.interactionEnabled = true;
            _onInteractionSwipe = new Signal();
         }
         return _onInteractionSwipe;
      }
      
      private function handleMouseInteraction(param1:MouseEvent) : void
      {
         if(_ido is IControl)
         {
            handleControlInteraction(param1);
         }
         else if(_ido is IInteractiveDisplayObject)
         {
            handleInteractiveDisplayObjectInteraction(param1);
         }
         else
         {
            throw new Exception("Unknown interaction control");
         }
      }
      
      private function handleControlInteraction(param1:MouseEvent) : void
      {
         var _loc2_:IControl = _ido as IControl;
         if(!_loc2_.enabled)
         {
            if(param1.type == "click" || param1.type == "doubleClick")
            {
               if(_ido.hasInactiveClick)
               {
                  _ido.onInactiveClick.dispatch(new FlashMouseEvent(_ido,param1));
               }
               return;
            }
         }
         if(!ScrollContainer.allowInteraction(_ido))
         {
            _loc2_.state = !!_loc2_.enabled?InteractiveDisplayObjectState.UP:InteractiveDisplayObjectState.DISABLED;
            return;
         }
         handleInteraction(param1);
      }
      
      private function handleInteractiveDisplayObjectInteraction(param1:MouseEvent) : void
      {
         if(!ScrollContainer.allowInteraction(_ido))
         {
            _ido.state = InteractiveDisplayObjectState.UP;
            return;
         }
         handleInteraction(param1);
      }
      
      private function handleInteraction(param1:MouseEvent) : void
      {
         event = param1;
         var _loc3_:* = event.type;
         switch(_loc3_)
         {
            case "mouseUp":
               endCaptureStageMouseMove();
               _ido.state = InteractiveDisplayObjectState.UP;
               if(_ido.hasInteractionUp)
               {
                  _ido.onInteractionUp.dispatch(new FlashMouseEvent(_ido,event));
               }
               break;
            case "mouseDown":
               _triggerBounds = _displayObject.getBounds(_displayObject.stage);
               _triggerBounds.inflate(10,10);
               _ido.state = InteractiveDisplayObjectState.DOWN;
               if(_ido.hasInteractionDown)
               {
                  _ido.onInteractionDown.dispatch(new FlashMouseEvent(_ido,event));
               }
               break;
            case "mouseMove":
               var isWithinBounds:Boolean = !!_triggerBounds?_triggerBounds.contains(event.stageX,event.stageY):false;
               if(_ido.state == InteractiveDisplayObjectState.DOWN && !isWithinBounds)
               {
                  _ido.state = InteractiveDisplayObjectState.UP;
                  if(_ido.hasInteractionOut)
                  {
                     _ido.onInteractionOut.dispatch(new FlashMouseEvent(_ido,event));
                  }
               }
               else if(_ido.state == null || _ido.state == InteractiveDisplayObjectState.OVER || _ido.state == InteractiveDisplayObjectState.DOWN)
               {
                  if(_ido.hasInteractionMove)
                  {
                     _ido.onInteractionMove.dispatch(new FlashMouseEvent(_ido,event));
                  }
               }
               break;
            case "rollOut":
               if(_ido.hasInteractionMove && _ido.state == InteractiveDisplayObjectState.DOWN)
               {
                  beginCaptureStageMouseMove();
               }
               _ido.state = InteractiveDisplayObjectState.UP;
               if(_ido.hasInteractionOut)
               {
                  _ido.onInteractionOut.dispatch(new FlashMouseEvent(_ido,event));
               }
               break;
            case "rollOver":
               var dragging:Boolean = _stageMouseMoveRegistered;
               endCaptureStageMouseMove();
               var alreadyOver:Boolean = _ido.state == InteractiveDisplayObjectState.OVER;
               if(alreadyOver)
               {
                  if(_ido.hasInteractionMove)
                  {
                     _ido.onInteractionMove.dispatch(new FlashMouseEvent(_ido,event));
                  }
               }
               else if(dragging)
               {
                  _ido.state = InteractiveDisplayObjectState.DOWN;
                  if(_ido.hasInteractionDown)
                  {
                     _ido.onInteractionDown.dispatch(new FlashMouseEvent(_ido,event));
                  }
                  if(_ido.hasInteractionOver)
                  {
                     _ido.onInteractionOver.dispatch(new FlashMouseEvent(_ido,event));
                  }
               }
               else
               {
                  _ido.state = InteractiveDisplayObjectState.OVER;
                  if(_ido.hasInteractionOver)
                  {
                     _ido.onInteractionOver.dispatch(new FlashMouseEvent(_ido,event));
                  }
               }
               break;
            case "releaseOutside":
               endCaptureStageMouseMove();
               _ido.state = InteractiveDisplayObjectState.UP;
               if(_ido.hasInteractionUp)
               {
                  _ido.onInteractionUp.dispatch(new FlashMouseEvent(_ido,event));
               }
               break;
            case "click":
               clearDelayedClick();
               if(_ido.hasClick && !_ido.hasDoubleClick)
               {
                  _ido.onClick.dispatch(new FlashMouseEvent(_ido,event));
                  _ido.state = InteractiveDisplayObjectState.OVER;
                  if(_ido.hasInteractionOver)
                  {
                     _ido.onInteractionOver.dispatch(new FlashMouseEvent(_ido,event));
                  }
               }
               else if(_ido.hasClick && _ido.hasDoubleClick)
               {
                  _delayedClick = Runtime.setTimeout(function():void
                  {
                     clearDelayedClick();
                     if(_ido.hasClick)
                     {
                        _ido.onClick.dispatch(new FlashMouseEvent(_ido,event));
                        _ido.state = InteractiveDisplayObjectState.OVER;
                        if(_ido.hasInteractionOver)
                        {
                           _ido.onInteractionOver.dispatch(new FlashMouseEvent(_ido,event));
                        }
                     }
                  },20);
               }
               break;
            case "doubleClick":
               clearDelayedClick();
               if(_ido.hasDoubleClick)
               {
                  _ido.onDoubleClick.dispatch(new FlashMouseEvent(_ido,event));
                  _ido.state = InteractiveDisplayObjectState.OVER;
                  if(_ido.hasInteractionOver)
                  {
                     _ido.onInteractionOver.dispatch(new FlashMouseEvent(_ido,event));
                  }
               }
               break;
            case "mouseWheel":
               if(_ido.hasMouseWheel)
               {
                  _ido.onMouseWheel.dispatch(new FlashMouseEvent(_ido,event));
               }
               break;
            default:
               trace(event.toString());
         }
      }
      
      private function beginCaptureStageMouseMove() : void
      {
         if(!_stageMouseMoveRegistered)
         {
            FlashDisplayObject.getNativeDisplayObject(_ido).stage.addEventListener("mouseMove",onStageMouseMove);
            _stageMouseMoveRegistered = true;
         }
      }
      
      private function endCaptureStageMouseMove() : void
      {
         if(_stageMouseMoveRegistered)
         {
            FlashDisplayObject.getNativeDisplayObject(_ido).stage.removeEventListener("mouseMove",onStageMouseMove);
            _stageMouseMoveRegistered = false;
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         if(_stageMouseMoveRegistered)
         {
            _ido.onInteractionMove.dispatch(new FlashRelativeStageMouseEvent(_ido,param1));
         }
      }
      
      private function clearDelayedClick() : void
      {
         if(_delayedClick != 0)
         {
            Runtime.clearTimeout(_delayedClick);
            _delayedClick = 0;
         }
      }
      
      private function setDoubleClickEnabled(param1:DisplayObject) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(param1 is InteractiveObject)
         {
            (param1 as InteractiveObject).doubleClickEnabled = true;
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc2_ = param1 as DisplayObjectContainer;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.numChildren)
            {
               _loc4_ = _loc2_.getChildAt(_loc3_);
               setDoubleClickEnabled(_loc4_);
               _loc3_++;
            }
         }
      }
   }
}

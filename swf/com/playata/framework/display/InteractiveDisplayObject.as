package com.playata.framework.display
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.signal.ISignal;
   
   public class InteractiveDisplayObject extends DisplayObject implements IInteractiveDisplayObject
   {
       
      
      protected var _state:InteractiveDisplayObjectState;
      
      protected var _interactionEnabled:Boolean = true;
      
      protected var _useHandCursor:Boolean = false;
      
      protected var _interactionHandler:IInteractionHandler;
      
      public function InteractiveDisplayObject(param1:IDisplayObject)
      {
         super(param1);
         _state = InteractiveDisplayObjectState.UP;
         _interactionHandler = DisplayObjectFactory.createInteractionHandler(this);
      }
      
      override public function dispose() : void
      {
         if(_interactionHandler)
         {
            _interactionHandler.dispose();
            _interactionHandler = null;
         }
         super.dispose();
      }
      
      public function set interactionEnabled(param1:Boolean) : void
      {
         _interactionEnabled = param1;
         _displayObject.applySettings(new TypedObject({"interactionEnabled":param1}));
      }
      
      public function get interactionEnabled() : Boolean
      {
         return _interactionEnabled;
      }
      
      public function get hasInteractionUp() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
         return _interactionHandler.hasInteractionUp;
      }
      
      public function get hasInteractionDown() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
         return _interactionHandler.hasInteractionDown;
      }
      
      public function get hasInteractionMove() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
         return _interactionHandler.hasInteractionMove;
      }
      
      public function get hasInteractionOut() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
         return _interactionHandler.hasInteractionOut;
      }
      
      public function get hasInteractionOver() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
         return _interactionHandler.hasInteractionOver;
      }
      
      public function get hasClick() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
         return _interactionHandler.hasClick;
      }
      
      public function get hasInactiveClick() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
         return _interactionHandler.hasInactiveClick;
      }
      
      public function get hasDoubleClick() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
         return _interactionHandler.hasDoubleClick;
      }
      
      public function get hasMouseWheel() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
         return _interactionHandler.hasMouseWheel;
      }
      
      public function get hasInteractionSwipe() : Boolean
      {
         if(!_interactionHandler)
         {
            return false;
         }
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
      
      public function set useHandCursor(param1:Boolean) : void
      {
         _useHandCursor = param1;
         _displayObject.applySettings(new TypedObject({"useHandCursor":param1}));
      }
      
      public function get useHandCursor() : Boolean
      {
         return _useHandCursor;
      }
      
      public function get state() : InteractiveDisplayObjectState
      {
         return _state;
      }
      
      public function set state(param1:InteractiveDisplayObjectState) : void
      {
         _state = param1;
      }
   }
}

package com.playata.framework.display
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.input.IInteractionTarget;
   
   public interface IInteractiveDisplayObject extends IDisplayObject, IInteractionTarget
   {
       
      
      function set interactionEnabled(param1:Boolean) : void;
      
      function get interactionEnabled() : Boolean;
      
      function get state() : InteractiveDisplayObjectState;
      
      function set state(param1:InteractiveDisplayObjectState) : void;
      
      function set useHandCursor(param1:Boolean) : void;
      
      function get useHandCursor() : Boolean;
      
      function get hasInteractionUp() : Boolean;
      
      function get hasInteractionDown() : Boolean;
      
      function get hasInteractionMove() : Boolean;
      
      function get hasInteractionOut() : Boolean;
      
      function get hasInteractionOver() : Boolean;
      
      function get hasClick() : Boolean;
      
      function get hasInactiveClick() : Boolean;
      
      function get hasDoubleClick() : Boolean;
      
      function get hasMouseWheel() : Boolean;
      
      function get hasInteractionSwipe() : Boolean;
      
      function get onInteractionUp() : ISignal;
      
      function get onInteractionDown() : ISignal;
      
      function get onInteractionMove() : ISignal;
      
      function get onInteractionOut() : ISignal;
      
      function get onInteractionOver() : ISignal;
      
      function get onClick() : ISignal;
      
      function get onInactiveClick() : ISignal;
      
      function get onDoubleClick() : ISignal;
      
      function get onMouseWheel() : ISignal;
      
      function get onInteractionSwipe() : ISignal;
   }
}

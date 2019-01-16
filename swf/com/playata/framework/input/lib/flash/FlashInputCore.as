package com.playata.framework.input.lib.flash
{
   import com.playata.framework.input.IInputCore;
   import com.playata.framework.input.IKeyboard;
   import com.playata.framework.input.IMouse;
   import com.playata.framework.input.InputCore;
   import flash.display.Stage;
   
   public class FlashInputCore implements IInputCore
   {
      
      private static var _stage:Stage = null;
       
      
      private var _isActive:Boolean = true;
      
      private var _keyboard:FlashKeyboard = null;
      
      private var _mouse:FlashMouse = null;
      
      public function FlashInputCore(param1:Stage)
      {
         super();
         InputCore.current = this;
         _stage = param1;
         _keyboard = new FlashKeyboard();
         _mouse = new FlashMouse();
      }
      
      public static function get stage() : Stage
      {
         return _stage;
      }
      
      public function dispose() : void
      {
         if(_keyboard != null)
         {
            _keyboard.dispose();
            _keyboard = null;
         }
         if(_mouse != null)
         {
            _mouse.dispose();
            _mouse = null;
         }
      }
      
      public function get keyboard() : IKeyboard
      {
         return _keyboard;
      }
      
      public function get mouse() : IMouse
      {
         return _mouse;
      }
      
      public function get isActive() : Boolean
      {
         return _isActive;
      }
      
      public function onActivate(param1:int) : void
      {
         _isActive = true;
      }
      
      public function onDeactivate() : void
      {
         _isActive = false;
      }
   }
}

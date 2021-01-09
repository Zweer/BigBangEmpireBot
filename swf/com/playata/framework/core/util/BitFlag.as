package com.playata.framework.core.util
{
   public class BitFlag
   {
       
      
      private var _flags:uint = 0;
      
      public function BitFlag(param1:uint = 0)
      {
         super();
         this._flags = param1;
      }
      
      public function addFlag(param1:uint) : void
      {
         this._flags = this._flags | param1;
      }
      
      public function removeFlag(param1:uint) : void
      {
         this._flags = this._flags & ~param1;
      }
      
      public function toggleFlag(param1:uint) : void
      {
         this._flags = this._flags ^ param1;
      }
      
      public function hasFlag(param1:uint) : Boolean
      {
         return (this._flags & param1) == param1;
      }
      
      public function hasAnyFlag(param1:uint) : Boolean
      {
         return (this._flags & param1) != 0;
      }
      
      public function toString() : String
      {
         return this._flags.toString(2);
      }
   }
}

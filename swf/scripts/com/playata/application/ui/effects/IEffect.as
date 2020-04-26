package com.playata.application.ui.effects
{
   public interface IEffect
   {
       
      
      function update(param1:Number) : Boolean;
      
      function dispose() : void;
      
      function shutDown() : void;
   }
}

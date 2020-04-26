package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IQuad;
   import com.playata.framework.display.ui.Direction;
   import flash.display.Graphics;
   import flash.display.Shape;
   
   public class FlashQuad extends FlashShape implements IQuad
   {
       
      
      public function FlashQuad(param1:TypedObject, param2:Shape = null)
      {
         super(param1,param2);
         redraw();
         width = getNumberSetting("width",param1,1);
         height = getNumberSetting("height",param1,1);
      }
      
      override protected function drawShape(param1:Graphics) : void
      {
         param1.drawRect(0,0,1,1);
      }
      
      public function setLinearGradient(param1:Direction, param2:uint, param3:uint, param4:Number = 1, param5:Number = 1) : void
      {
      }
      
      public function getVertexColor(param1:int) : uint
      {
         return 0;
      }
      
      public function setVertexColor(param1:int, param2:uint) : void
      {
      }
      
      public function getVertexAlpha(param1:int) : Number
      {
         return 0;
      }
      
      public function setVertexAlpha(param1:int, param2:Number) : void
      {
      }
   }
}

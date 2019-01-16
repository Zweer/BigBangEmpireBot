package com.playata.application.ui.effects
{
   import com.playata.framework.display.IDisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Effect
   {
      
      protected static var EMITTER_POSITION:Point = new Point();
      
      private static var EMITTER_RECT:Rectangle = new Rectangle();
       
      
      protected var _time:Number;
      
      public function Effect()
      {
         super();
         _time = 0;
      }
      
      protected static function calculateEmitterStartPosition(param1:IDisplayObject) : void
      {
         param1.getBounds(param1,EMITTER_RECT);
         EMITTER_POSITION.x = EMITTER_RECT.x + EMITTER_RECT.width * 0.5;
         EMITTER_POSITION.y = EMITTER_RECT.y + EMITTER_RECT.height * 0.5;
         param1.localToGlobal(EMITTER_POSITION,EMITTER_POSITION);
      }
      
      public function update(param1:Number) : Boolean
      {
         _time = _time + param1;
         return false;
      }
      
      public function shutDown() : void
      {
      }
   }
}

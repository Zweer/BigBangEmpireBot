package starling.events
{
   public class TouchData
   {
      
      private static var sPool:Vector.<TouchData> = new Vector.<TouchData>(0);
       
      
      private var _id:int;
      
      private var _phase:String;
      
      private var _globalX:Number;
      
      private var _globalY:Number;
      
      private var _pressure:Number;
      
      private var _width:Number;
      
      private var _height:Number;
      
      public function TouchData()
      {
         super();
      }
      
      public static function fromPool(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1.0, param6:Number = 1.0, param7:Number = 1.0) : TouchData
      {
         var _loc8_:TouchData = sPool.length > 0?sPool.pop():new TouchData();
         _loc8_.setTo(param1,param2,param3,param4,param5,param6,param7);
         return _loc8_;
      }
      
      public static function toPool(param1:TouchData) : void
      {
         sPool[sPool.length] = param1;
      }
      
      private function setTo(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1.0, param6:Number = 1.0, param7:Number = 1.0) : void
      {
         _id = param1;
         _phase = param2;
         _globalX = param3;
         _globalY = param4;
         _pressure = param5;
         _width = param6;
         _height = param7;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get phase() : String
      {
         return _phase;
      }
      
      public function get globalX() : Number
      {
         return _globalX;
      }
      
      public function get globalY() : Number
      {
         return _globalY;
      }
      
      public function get pressure() : Number
      {
         return _pressure;
      }
      
      public function get width() : Number
      {
         return _width;
      }
      
      public function get height() : Number
      {
         return _height;
      }
   }
}

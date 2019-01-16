package com.playata.framework.input
{
   import com.playata.framework.core.error.NotImplementedException;
   import flash.geom.Point;
   
   public class InteractionEvent
   {
       
      
      public var target:IInteractionTarget;
      
      public var rawEvent:Object;
      
      public function InteractionEvent()
      {
         super();
      }
      
      protected function getData(param1:String) : Object
      {
         throw new NotImplementedException();
      }
      
      public function stopPropagation() : void
      {
         throw new NotImplementedException();
      }
      
      protected function getBoolean(param1:String) : Boolean
      {
         return getData(param1) as Boolean;
      }
      
      protected function getInt(param1:String) : int
      {
         return getData(param1) as int;
      }
      
      protected function getUint(param1:String) : uint
      {
         return getData(param1) as uint;
      }
      
      protected function getNumber(param1:String) : Number
      {
         return getData(param1) as Number;
      }
      
      protected function getString(param1:String) : String
      {
         return getData(param1) as String;
      }
      
      protected function getStringVector(param1:String, param2:Vector.<String> = null) : Vector.<String>
      {
         return getData(param1) as Vector.<String>;
      }
      
      public function get altKey() : Boolean
      {
         return getBoolean("altKey");
      }
      
      public function get controlKey() : Boolean
      {
         return getBoolean("controlKey");
      }
      
      public function get shiftKey() : Boolean
      {
         return getBoolean("shiftKey");
      }
      
      public function get mouseWheelDelta() : int
      {
         return getInt("mouseWheelDelta");
      }
      
      public function get globalX() : Number
      {
         return getNumber("globalX");
      }
      
      public function get globalY() : Number
      {
         return getNumber("globalY");
      }
      
      public function get globalPoint() : Point
      {
         return new Point(globalX,globalY);
      }
      
      public function get localX() : Number
      {
         return getNumber("localX");
      }
      
      public function get localY() : Number
      {
         return getNumber("localY");
      }
      
      public function get localPoint() : Point
      {
         return new Point(localX,localY);
      }
      
      public function get charCode() : uint
      {
         return getUint("charCode");
      }
      
      public function get keyCode() : uint
      {
         return getUint("keyCode");
      }
      
      public function get linkText() : String
      {
         return getString("linkText");
      }
      
      public function get linkVector() : Vector.<String>
      {
         return getStringVector("linkVector");
      }
      
      public function get swipeDirection() : SwipeDirection
      {
         return getData("swipeDirection") as SwipeDirection;
      }
      
      public function get triggerType() : String
      {
         return getString("triggerType");
      }
   }
}

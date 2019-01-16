package spine
{
   public class Event
   {
       
      
      var _data:EventData;
      
      public var time:Number;
      
      public var intValue:int;
      
      public var floatValue:Number;
      
      public var stringValue:String;
      
      public function Event(param1:Number, param2:EventData)
      {
         super();
         if(param2 == null)
         {
            throw new ArgumentError("data cannot be null.");
         }
         this.time = param1;
         _data = param2;
      }
      
      public function get data() : EventData
      {
         return _data;
      }
      
      public function toString() : String
      {
         return _data._name;
      }
   }
}

package spine
{
   public class EventData
   {
       
      
      var _name:String;
      
      public var intValue:int;
      
      public var floatValue:Number;
      
      public var stringValue:String;
      
      public function EventData(param1:String)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("name cannot be null.");
         }
         _name = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function toString() : String
      {
         return _name;
      }
   }
}

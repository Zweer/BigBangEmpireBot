package spine
{
   public class IkConstraintData
   {
       
      
      var _name:String;
      
      public var order:Number;
      
      public var bones:Vector.<BoneData>;
      
      public var target:BoneData;
      
      public var bendDirection:int = 1;
      
      public var mix:Number = 1;
      
      public function IkConstraintData(param1:String)
      {
         bones = new Vector.<BoneData>();
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

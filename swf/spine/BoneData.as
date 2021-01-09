package spine
{
   public class BoneData
   {
       
      
      var _index:int;
      
      var _name:String;
      
      var _parent:BoneData;
      
      public var length:Number;
      
      public var x:Number;
      
      public var y:Number;
      
      public var rotation:Number;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var shearX:Number;
      
      public var shearY:Number;
      
      public var transformMode:TransformMode;
      
      public function BoneData(param1:int, param2:String, param3:BoneData)
      {
         transformMode = TransformMode.normal;
         super();
         if(param1 < 0)
         {
            throw new ArgumentError("index must be >= 0");
         }
         if(param2 == null)
         {
            throw new ArgumentError("name cannot be null.");
         }
         _index = param1;
         _name = param2;
         _parent = param3;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get parent() : BoneData
      {
         return _parent;
      }
      
      public function toString() : String
      {
         return _name;
      }
   }
}

package spine
{
   public class SlotData
   {
       
      
      var _index:int;
      
      var _name:String;
      
      var _boneData:BoneData;
      
      public var r:Number = 1;
      
      public var g:Number = 1;
      
      public var b:Number = 1;
      
      public var a:Number = 1;
      
      public var attachmentName:String;
      
      public var blendMode:BlendMode;
      
      public function SlotData(param1:int, param2:String, param3:BoneData)
      {
         super();
         if(param1 < 0)
         {
            throw new ArgumentError("index must be >= 0.");
         }
         if(param2 == null)
         {
            throw new ArgumentError("name cannot be null.");
         }
         if(param3 == null)
         {
            throw new ArgumentError("boneData cannot be null.");
         }
         _index = param1;
         _name = param2;
         _boneData = param3;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get boneData() : BoneData
      {
         return _boneData;
      }
      
      public function toString() : String
      {
         return _name;
      }
   }
}

package spine
{
   public class TransformConstraintData
   {
       
      
      var _name:String;
      
      public var order:Number;
      
      var _bones:Vector.<BoneData>;
      
      public var target:BoneData;
      
      public var rotateMix:Number;
      
      public var translateMix:Number;
      
      public var scaleMix:Number;
      
      public var shearMix:Number;
      
      public var offsetRotation:Number;
      
      public var offsetX:Number;
      
      public var offsetY:Number;
      
      public var offsetScaleX:Number;
      
      public var offsetScaleY:Number;
      
      public var offsetShearY:Number;
      
      public function TransformConstraintData(param1:String)
      {
         _bones = new Vector.<BoneData>();
         super();
         if(param1 == null)
         {
            throw new ArgumentError("name cannot be null.");
         }
         _name = param1;
      }
      
      public function get bones() : Vector.<BoneData>
      {
         return _bones;
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

package spine
{
   public dynamic class PathConstraintData
   {
       
      
      var _name:String;
      
      public var order:Number;
      
      var _bones:Vector.<BoneData>;
      
      public var target:SlotData;
      
      public var positionMode:PositionMode;
      
      public var spacingMode:SpacingMode;
      
      public var rotateMode:RotateMode;
      
      public var offsetRotation:Number;
      
      public var position:Number;
      
      public var spacing:Number;
      
      public var rotateMix:Number;
      
      public var translateMix:Number;
      
      public function PathConstraintData(param1:String)
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
         return name;
      }
   }
}

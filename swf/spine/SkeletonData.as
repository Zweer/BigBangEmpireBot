package spine
{
   import spine.animation.Animation;
   
   public class SkeletonData
   {
       
      
      public var name:String;
      
      public var bones:Vector.<BoneData>;
      
      public var slots:Vector.<SlotData>;
      
      public var skins:Vector.<Skin>;
      
      public var defaultSkin:Skin;
      
      public var events:Vector.<EventData>;
      
      public var animations:Vector.<Animation>;
      
      public var ikConstraints:Vector.<IkConstraintData>;
      
      public var transformConstraints:Vector.<TransformConstraintData>;
      
      public var pathConstraints:Vector.<PathConstraintData>;
      
      public var width:Number;
      
      public var height:Number;
      
      public var version:String;
      
      public var hash:String;
      
      public var fps:Number;
      
      public var imagesPath:String;
      
      public function SkeletonData()
      {
         bones = new Vector.<BoneData>();
         slots = new Vector.<SlotData>();
         skins = new Vector.<Skin>();
         events = new Vector.<EventData>();
         animations = new Vector.<Animation>();
         ikConstraints = new Vector.<IkConstraintData>();
         transformConstraints = new Vector.<TransformConstraintData>();
         pathConstraints = new Vector.<PathConstraintData>();
         super();
      }
      
      public function findBone(param1:String) : BoneData
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(param1 == null)
         {
            throw new ArgumentError("boneName cannot be null.");
         }
         _loc2_ = 0;
         _loc4_ = bones.length;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = bones[_loc2_];
            if(_loc3_._name == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function findBoneIndex(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 == null)
         {
            throw new ArgumentError("boneName cannot be null.");
         }
         _loc2_ = 0;
         _loc3_ = bones.length;
         while(_loc2_ < _loc3_)
         {
            if(bones[_loc2_]._name == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function findSlot(param1:String) : SlotData
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(param1 == null)
         {
            throw new ArgumentError("slotName cannot be null.");
         }
         _loc2_ = 0;
         _loc4_ = slots.length;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = slots[_loc2_];
            if(_loc3_._name == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function findSlotIndex(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 == null)
         {
            throw new ArgumentError("slotName cannot be null.");
         }
         _loc2_ = 0;
         _loc3_ = slots.length;
         while(_loc2_ < _loc3_)
         {
            if(slots[_loc2_]._name == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function findSkin(param1:String) : Skin
      {
         if(param1 == null)
         {
            throw new ArgumentError("skinName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = skins;
         for each(var _loc2_ in skins)
         {
            if(_loc2_._name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findEvent(param1:String) : EventData
      {
         if(param1 == null)
         {
            throw new ArgumentError("eventName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = events;
         for each(var _loc2_ in events)
         {
            if(_loc2_._name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findAnimation(param1:String) : Animation
      {
         if(param1 == null)
         {
            throw new ArgumentError("animationName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = animations;
         for each(var _loc2_ in animations)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findIkConstraint(param1:String) : IkConstraintData
      {
         if(param1 == null)
         {
            throw new ArgumentError("constraintName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = ikConstraints;
         for each(var _loc2_ in ikConstraints)
         {
            if(_loc2_._name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findTransformConstraint(param1:String) : TransformConstraintData
      {
         if(param1 == null)
         {
            throw new ArgumentError("constraintName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = transformConstraints;
         for each(var _loc2_ in transformConstraints)
         {
            if(_loc2_._name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findTransformConstraintIndex(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            throw new ArgumentError("transformConstraintName cannot be null.");
         }
         var _loc3_:Vector.<TransformConstraintData> = this.transformConstraints;
         _loc2_ = 0;
         _loc4_ = _loc3_.length;
         while(_loc2_ < _loc4_)
         {
            if(_loc3_[_loc2_].name == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function findPathConstraint(param1:String) : PathConstraintData
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         if(param1 == null)
         {
            throw new ArgumentError("constraintName cannot be null.");
         }
         var _loc2_:Vector.<PathConstraintData> = this.pathConstraints;
         _loc3_ = 0;
         _loc5_ = _loc2_.length;
         while(_loc3_ < _loc5_)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc4_.name == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function findPathConstraintIndex(param1:String) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            throw new ArgumentError("pathConstraintName cannot be null.");
         }
         var _loc2_:Vector.<PathConstraintData> = this.pathConstraints;
         _loc3_ = 0;
         _loc4_ = _loc2_.length;
         while(_loc3_ < _loc4_)
         {
            if(_loc2_[_loc3_].name == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function toString() : String
      {
         return name != null?name:super.toString();
      }
   }
}

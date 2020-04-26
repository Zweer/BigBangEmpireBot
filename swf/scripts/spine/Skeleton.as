package spine
{
   import flash.utils.Dictionary;
   import spine.attachments.Attachment;
   import spine.attachments.PathAttachment;
   
   public class Skeleton
   {
       
      
      var _data:SkeletonData;
      
      public var bones:Vector.<Bone>;
      
      public var slots:Vector.<Slot>;
      
      public var drawOrder:Vector.<Slot>;
      
      public var ikConstraints:Vector.<IkConstraint>;
      
      public var transformConstraints:Vector.<TransformConstraint>;
      
      public var pathConstraints:Vector.<PathConstraint>;
      
      private var _updateCache:Vector.<Updatable>;
      
      private var _updateCacheReset:Vector.<Bone>;
      
      private var _skin:Skin;
      
      public var r:Number = 1;
      
      public var g:Number = 1;
      
      public var b:Number = 1;
      
      public var a:Number = 1;
      
      public var time:Number = 0;
      
      public var flipX:Boolean;
      
      public var flipY:Boolean;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public function Skeleton(param1:SkeletonData)
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         _updateCache = new Vector.<Updatable>();
         _updateCacheReset = new Vector.<Bone>();
         super();
         if(param1 == null)
         {
            throw new ArgumentError("data cannot be null.");
         }
         _data = param1;
         bones = new Vector.<Bone>();
         var _loc11_:int = 0;
         var _loc10_:* = param1.bones;
         for each(var _loc3_ in param1.bones)
         {
            if(_loc3_.parent == null)
            {
               _loc5_ = new Bone(_loc3_,this,null);
            }
            else
            {
               _loc2_ = bones[_loc3_.parent.index];
               _loc5_ = new Bone(_loc3_,this,_loc2_);
               _loc2_.children.push(_loc5_);
            }
            bones.push(_loc5_);
         }
         slots = new Vector.<Slot>();
         drawOrder = new Vector.<Slot>();
         var _loc13_:int = 0;
         var _loc12_:* = param1.slots;
         for each(var _loc7_ in param1.slots)
         {
            _loc5_ = bones[_loc7_.boneData.index];
            _loc6_ = new Slot(_loc7_,_loc5_);
            slots.push(_loc6_);
            drawOrder[drawOrder.length] = _loc6_;
         }
         ikConstraints = new Vector.<IkConstraint>();
         var _loc15_:int = 0;
         var _loc14_:* = param1.ikConstraints;
         for each(var _loc4_ in param1.ikConstraints)
         {
            ikConstraints.push(new IkConstraint(_loc4_,this));
         }
         transformConstraints = new Vector.<TransformConstraint>();
         var _loc17_:int = 0;
         var _loc16_:* = param1.transformConstraints;
         for each(var _loc8_ in param1.transformConstraints)
         {
            transformConstraints.push(new TransformConstraint(_loc8_,this));
         }
         pathConstraints = new Vector.<PathConstraint>();
         var _loc19_:int = 0;
         var _loc18_:* = param1.pathConstraints;
         for each(var _loc9_ in param1.pathConstraints)
         {
            pathConstraints.push(new PathConstraint(_loc9_,this));
         }
         updateCache();
      }
      
      public function updateCache() : void
      {
         var _loc1_:* = NaN;
         var _loc10_:* = null;
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc5_:Vector.<Updatable> = this._updateCache;
         _loc5_.length = 0;
         this._updateCacheReset.length = 0;
         var _loc11_:Vector.<Bone> = this.bones;
         var _loc6_:* = 0;
         var _loc8_:* = 0;
         _loc6_ = 0;
         _loc8_ = Number(_loc11_.length);
         _loc11_.length;
         while(_loc6_ < _loc8_)
         {
            _loc11_[_loc6_]._sorted = false;
            _loc6_++;
         }
         var _loc12_:Vector.<IkConstraint> = this.ikConstraints;
         var _loc14_:Vector.<TransformConstraint> = this.transformConstraints;
         var _loc4_:Vector.<PathConstraint> = this.pathConstraints;
         var _loc3_:Number = _loc12_.length;
         var _loc15_:Number = _loc14_.length;
         var _loc13_:Number = _loc4_.length;
         var _loc9_:Number = _loc3_ + _loc15_ + _loc13_;
         _loc6_ = 0;
         while(_loc6_ < _loc9_)
         {
            _loc1_ = 0;
            _loc1_ = 0;
            loop2:
            while(true)
            {
               if(_loc1_ >= _loc3_)
               {
                  _loc1_ = 0;
                  while(true)
                  {
                     if(_loc1_ >= _loc15_)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < _loc13_)
                        {
                           _loc7_ = _loc4_[_loc1_];
                           if(_loc7_.data.order == _loc6_)
                           {
                              sortPathConstraint(_loc7_);
                              break loop2;
                           }
                           _loc1_++;
                        }
                        break loop2;
                     }
                     _loc2_ = _loc14_[_loc1_];
                     if(_loc2_.data.order == _loc6_)
                     {
                        sortTransformConstraint(_loc2_);
                        break loop2;
                     }
                     _loc1_++;
                  }
               }
               else
               {
                  _loc10_ = _loc12_[_loc1_];
                  if(_loc10_.data.order == _loc6_)
                  {
                     sortIkConstraint(_loc10_);
                     break;
                  }
                  _loc1_++;
                  continue;
               }
            }
            _loc6_++;
         }
         _loc6_ = 0;
         _loc8_ = Number(_loc11_.length);
         _loc11_.length;
         while(_loc6_ < _loc8_)
         {
            sortBone(_loc11_[_loc6_]);
            _loc6_++;
         }
      }
      
      private function sortIkConstraint(param1:IkConstraint) : void
      {
         var _loc5_:* = null;
         var _loc4_:Bone = param1.target;
         sortBone(_loc4_);
         var _loc3_:Vector.<Bone> = param1.bones;
         var _loc2_:Bone = _loc3_[0];
         sortBone(_loc2_);
         if(_loc3_.length > 1)
         {
            _loc5_ = _loc3_[_loc3_.length - 1];
            if(_updateCache.indexOf(_loc5_) <= -1)
            {
               _updateCacheReset.push(_loc5_);
            }
         }
         _updateCache.push(param1);
         sortReset(_loc2_.children);
         _loc3_[_loc3_.length - 1]._sorted = true;
      }
      
      private function sortPathConstraint(param1:PathConstraint) : void
      {
         var _loc6_:Slot = param1.target;
         var _loc9_:Number = _loc6_.data.index;
         var _loc5_:Bone = _loc6_.bone;
         if(skin != null)
         {
            sortPathConstraintAttachment(skin,_loc9_,_loc5_);
         }
         if(data.defaultSkin != null && data.defaultSkin != skin)
         {
            sortPathConstraintAttachment(data.defaultSkin,_loc9_,_loc5_);
         }
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         _loc2_ = 0;
         _loc3_ = Number(data.skins.length);
         data.skins.length;
         while(_loc2_ < _loc3_)
         {
            sortPathConstraintAttachment(data.skins[_loc2_],_loc9_,_loc5_);
            _loc2_++;
         }
         var _loc4_:Attachment = _loc6_.attachment;
         if(_loc4_ is PathAttachment)
         {
            sortPathConstraintAttachment2(_loc4_,_loc5_);
         }
         var _loc8_:Vector.<Bone> = param1.bones;
         var _loc7_:Number = _loc8_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            sortBone(_loc8_[_loc2_]);
            _loc2_++;
         }
         _updateCache.push(param1);
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            sortReset(_loc8_[_loc2_].children);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            _loc8_[_loc2_]._sorted = true;
            _loc2_++;
         }
      }
      
      private function sortTransformConstraint(param1:TransformConstraint) : void
      {
         sortBone(param1.target);
         var _loc4_:Vector.<Bone> = param1.bones;
         var _loc3_:Number = _loc4_.length;
         var _loc2_:* = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            sortBone(_loc4_[_loc2_]);
            _loc2_++;
         }
         _updateCache.push(param1);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            sortReset(_loc4_[_loc2_].children);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_[_loc2_]._sorted = true;
            _loc2_++;
         }
      }
      
      private function sortPathConstraintAttachment(param1:Skin, param2:int, param3:Bone) : void
      {
         var _loc4_:Dictionary = param1.attachments[param2];
         if(!_loc4_)
         {
            return;
         }
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for each(var _loc5_ in _loc4_)
         {
            sortPathConstraintAttachment2(_loc5_,param3);
         }
      }
      
      private function sortPathConstraintAttachment2(param1:Attachment, param2:Bone) : void
      {
         var _loc4_:* = undefined;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:PathAttachment = param1 as PathAttachment;
         if(!_loc3_)
         {
            return;
         }
         var _loc5_:Vector.<int> = _loc3_.bones;
         if(_loc5_ == null)
         {
            sortBone(param2);
         }
         else
         {
            _loc4_ = this.bones;
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc6_++;
               _loc7_ = _loc5_[_loc6_];
               _loc8_ = _loc6_ + _loc7_;
               while(_loc6_ < _loc8_)
               {
                  sortBone(_loc4_[_loc5_[_loc6_]]);
                  _loc6_++;
               }
            }
         }
      }
      
      private function sortBone(param1:Bone) : void
      {
         if(param1._sorted)
         {
            return;
         }
         var _loc2_:Bone = param1.parent;
         if(_loc2_ != null)
         {
            sortBone(_loc2_);
         }
         param1._sorted = true;
         _updateCache.push(param1);
      }
      
      private function sortReset(param1:Vector.<Bone>) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         _loc2_ = 0;
         _loc4_ = param1.length;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = param1[_loc2_];
            if(_loc3_._sorted)
            {
               sortReset(_loc3_.children);
            }
            _loc3_._sorted = false;
            _loc2_++;
         }
      }
      
      public function updateWorldTransform() : void
      {
         var _loc3_:Vector.<Bone> = this._updateCacheReset;
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            _loc2_.ax = _loc2_.x;
            _loc2_.ay = _loc2_.y;
            _loc2_.arotation = _loc2_.rotation;
            _loc2_.ascaleX = _loc2_.scaleX;
            _loc2_.ascaleY = _loc2_.scaleY;
            _loc2_.ashearX = _loc2_.shearX;
            _loc2_.ashearY = _loc2_.shearY;
            _loc2_.appliedValid = true;
         }
         var _loc7_:int = 0;
         var _loc6_:* = _updateCache;
         for each(var _loc1_ in _updateCache)
         {
            _loc1_.update();
         }
      }
      
      public function setToSetupPose() : void
      {
         setBonesToSetupPose();
         setSlotsToSetupPose();
      }
      
      public function setBonesToSetupPose() : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = bones;
         for each(var _loc3_ in bones)
         {
            _loc3_.setToSetupPose();
         }
         var _loc8_:int = 0;
         var _loc7_:* = ikConstraints;
         for each(var _loc2_ in ikConstraints)
         {
            _loc2_.bendDirection = _loc2_._data.bendDirection;
            _loc2_.mix = _loc2_._data.mix;
         }
         var _loc10_:int = 0;
         var _loc9_:* = transformConstraints;
         for each(var _loc1_ in transformConstraints)
         {
            _loc1_.rotateMix = _loc1_._data.rotateMix;
            _loc1_.translateMix = _loc1_._data.translateMix;
            _loc1_.scaleMix = _loc1_._data.scaleMix;
            _loc1_.shearMix = _loc1_._data.shearMix;
         }
         var _loc12_:int = 0;
         var _loc11_:* = pathConstraints;
         for each(var _loc4_ in pathConstraints)
         {
            _loc4_.position = _loc4_._data.position;
            _loc4_.spacing = _loc4_._data.spacing;
            _loc4_.rotateMix = _loc4_._data.rotateMix;
            _loc4_.translateMix = _loc4_._data.translateMix;
         }
      }
      
      public function setSlotsToSetupPose() : void
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = slots;
         for each(var _loc2_ in slots)
         {
            _loc1_++;
            drawOrder[_loc1_] = _loc2_;
            _loc2_.setToSetupPose();
         }
      }
      
      public function get data() : SkeletonData
      {
         return _data;
      }
      
      public function get getUpdateCache() : Vector.<Updatable>
      {
         return _updateCache;
      }
      
      public function get rootBone() : Bone
      {
         if(bones.length == 0)
         {
            return null;
         }
         return bones[0];
      }
      
      public function findBone(param1:String) : Bone
      {
         if(param1 == null)
         {
            throw new ArgumentError("boneName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = bones;
         for each(var _loc2_ in bones)
         {
            if(_loc2_._data._name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findBoneIndex(param1:String) : int
      {
         if(param1 == null)
         {
            throw new ArgumentError("boneName cannot be null.");
         }
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = bones;
         for each(var _loc3_ in bones)
         {
            if(_loc3_._data._name == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function findSlot(param1:String) : Slot
      {
         if(param1 == null)
         {
            throw new ArgumentError("slotName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = slots;
         for each(var _loc2_ in slots)
         {
            if(_loc2_._data._name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findSlotIndex(param1:String) : int
      {
         if(param1 == null)
         {
            throw new ArgumentError("slotName cannot be null.");
         }
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = slots;
         for each(var _loc3_ in slots)
         {
            if(_loc3_._data._name == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get skin() : Skin
      {
         return _skin;
      }
      
      public function set skinName(param1:String) : void
      {
         var _loc2_:Skin = data.findSkin(param1);
         if(_loc2_ == null)
         {
            throw new ArgumentError("Skin not found: " + param1);
         }
         this.skin = _loc2_;
      }
      
      public function get skinName() : String
      {
         return _skin == null?null:_skin._name;
      }
      
      public function set skin(param1:Skin) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1)
         {
            if(skin)
            {
               param1.attachAll(this,skin);
            }
            else
            {
               _loc4_ = 0;
               var _loc7_:int = 0;
               var _loc6_:* = slots;
               for each(var _loc5_ in slots)
               {
                  _loc3_ = _loc5_._data.attachmentName;
                  if(_loc3_)
                  {
                     _loc2_ = param1.getAttachment(_loc4_,_loc3_);
                     if(_loc2_)
                     {
                        _loc5_.attachment = _loc2_;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         _skin = param1;
      }
      
      public function getAttachmentForSlotName(param1:String, param2:String) : Attachment
      {
         return getAttachmentForSlotIndex(data.findSlotIndex(param1),param2);
      }
      
      public function getAttachmentForSlotIndex(param1:int, param2:String) : Attachment
      {
         var _loc3_:* = null;
         if(param2 == null)
         {
            throw new ArgumentError("attachmentName cannot be null.");
         }
         if(skin != null)
         {
            _loc3_ = skin.getAttachment(param1,param2);
            if(_loc3_ != null)
            {
               return _loc3_;
            }
         }
         if(data.defaultSkin != null)
         {
            return data.defaultSkin.getAttachment(param1,param2);
         }
         return null;
      }
      
      public function setAttachment(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            throw new ArgumentError("slotName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = slots;
         for each(var _loc5_ in slots)
         {
            if(_loc5_._data._name == param1)
            {
               _loc3_ = null;
               if(param2 != null)
               {
                  _loc3_ = getAttachmentForSlotIndex(_loc4_,param2);
                  if(_loc3_ == null)
                  {
                     throw new ArgumentError("Attachment not found: " + param2 + ", for slot: " + param1);
                  }
               }
               _loc5_.attachment = _loc3_;
               return;
            }
            _loc4_++;
         }
         throw new ArgumentError("Slot not found: " + param1);
      }
      
      public function findIkConstraint(param1:String) : IkConstraint
      {
         if(param1 == null)
         {
            throw new ArgumentError("constraintName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = ikConstraints;
         for each(var _loc2_ in ikConstraints)
         {
            if(_loc2_._data._name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findTransformConstraint(param1:String) : TransformConstraint
      {
         if(param1 == null)
         {
            throw new ArgumentError("constraintName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = transformConstraints;
         for each(var _loc2_ in transformConstraints)
         {
            if(_loc2_._data._name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findPathConstraint(param1:String) : PathConstraint
      {
         if(param1 == null)
         {
            throw new ArgumentError("constraintName cannot be null.");
         }
         var _loc4_:int = 0;
         var _loc3_:* = pathConstraints;
         for each(var _loc2_ in pathConstraints)
         {
            if(_loc2_._data._name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function update(param1:Number) : void
      {
         time = time + param1;
      }
      
      public function toString() : String
      {
         return _data.name != null?_data.name:super.toString();
      }
   }
}

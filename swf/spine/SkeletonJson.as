package spine
{
   import flash.utils.ByteArray;
   import spine.animation.Animation;
   import spine.animation.AttachmentTimeline;
   import spine.animation.ColorTimeline;
   import spine.animation.CurveTimeline;
   import spine.animation.DeformTimeline;
   import spine.animation.DrawOrderTimeline;
   import spine.animation.EventTimeline;
   import spine.animation.IkConstraintTimeline;
   import spine.animation.PathConstraintMixTimeline;
   import spine.animation.PathConstraintPositionTimeline;
   import spine.animation.PathConstraintSpacingTimeline;
   import spine.animation.RotateTimeline;
   import spine.animation.ScaleTimeline;
   import spine.animation.ShearTimeline;
   import spine.animation.Timeline;
   import spine.animation.TransformConstraintTimeline;
   import spine.animation.TranslateTimeline;
   import spine.attachments.Attachment;
   import spine.attachments.AttachmentLoader;
   import spine.attachments.AttachmentType;
   import spine.attachments.BoundingBoxAttachment;
   import spine.attachments.MeshAttachment;
   import spine.attachments.PathAttachment;
   import spine.attachments.RegionAttachment;
   import spine.attachments.VertexAttachment;
   
   public class SkeletonJson
   {
       
      
      public var attachmentLoader:AttachmentLoader;
      
      public var scale:Number = 1;
      
      private var linkedMeshes:Vector.<LinkedMesh>;
      
      public function SkeletonJson(param1:AttachmentLoader = null)
      {
         linkedMeshes = new Vector.<LinkedMesh>();
         super();
         this.attachmentLoader = param1;
      }
      
      private static function readCurve(param1:Object, param2:CurveTimeline, param3:int) : void
      {
         var _loc4_:Object = param1["curve"];
         if(!_loc4_)
         {
            return;
         }
         if(_loc4_ == "stepped")
         {
            param2.setStepped(param3);
         }
         else if(_loc4_ is Array)
         {
            param2.setCurve(param3,_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3]);
         }
      }
      
      private static function toColor(param1:String, param2:int) : Number
      {
         if(param1.length != 8)
         {
            throw new ArgumentError("Color hexidecimal length must be 8, recieved: " + param1);
         }
         return parseInt(param1.substring(param2 * 2,param2 * 2 + 2),16) / 255;
      }
      
      private static function getFloatArray(param1:Object, param2:String, param3:Number) : Vector.<Number>
      {
         var _loc6_:Array = param1[param2];
         var _loc4_:Vector.<Number> = new Vector.<Number>(_loc6_.length,true);
         var _loc5_:int = 0;
         var _loc7_:int = _loc6_.length;
         if(param3 == 1)
         {
            while(_loc5_ < _loc7_)
            {
               _loc4_[_loc5_] = _loc6_[_loc5_];
               _loc5_++;
            }
         }
         else
         {
            while(_loc5_ < _loc7_)
            {
               _loc4_[_loc5_] = _loc6_[_loc5_] * param3;
               _loc5_++;
            }
         }
         return _loc4_;
      }
      
      private static function getIntArray(param1:Object, param2:String) : Vector.<int>
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:Array = param1[param2];
         var _loc3_:Vector.<int> = new Vector.<int>(_loc5_.length,true);
         _loc4_ = 0;
         _loc6_ = _loc5_.length;
         while(_loc4_ < _loc6_)
         {
            _loc3_[_loc4_] = int(_loc5_[_loc4_]);
            _loc4_++;
         }
         return _loc3_;
      }
      
      private static function getUintArray(param1:Object, param2:String) : Vector.<uint>
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:Array = param1[param2];
         var _loc3_:Vector.<uint> = new Vector.<uint>(_loc5_.length,true);
         _loc4_ = 0;
         _loc6_ = _loc5_.length;
         while(_loc4_ < _loc6_)
         {
            _loc3_[_loc4_] = int(_loc5_[_loc4_]);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function readSkeletonData(param1:*, param2:String = null) : SkeletonData
      {
         var _loc16_:* = null;
         var _loc23_:* = null;
         var _loc3_:* = null;
         var _loc32_:* = null;
         var _loc10_:* = null;
         var _loc20_:* = null;
         var _loc36_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc37_:* = null;
         var _loc22_:* = null;
         var _loc6_:* = null;
         var _loc9_:int = 0;
         var _loc15_:* = null;
         var _loc13_:* = null;
         var _loc29_:* = null;
         var _loc12_:* = null;
         var _loc31_:* = null;
         var _loc33_:* = null;
         if(param1 == null)
         {
            throw new ArgumentError("object cannot be null.");
         }
         if(param1 is String)
         {
            _loc16_ = JSON.parse(String(param1));
         }
         else if(param1 is ByteArray)
         {
            _loc16_ = JSON.parse(ByteArray(param1).readUTFBytes(ByteArray(param1).length));
         }
         else if(param1 is Object)
         {
            _loc16_ = param1;
         }
         else
         {
            throw new ArgumentError("object must be a String, ByteArray or Object.");
         }
         var _loc24_:SkeletonData = new SkeletonData();
         _loc24_.name = param2;
         var _loc7_:Object = _loc16_["skeleton"];
         if(_loc7_)
         {
            _loc24_.hash = _loc7_["hash"];
            _loc24_.version = _loc7_["spine"];
            _loc24_.width = _loc7_["width"] || 0;
            _loc24_.height = _loc7_["height"] || 0;
            _loc24_.fps = _loc7_["fps"] || 0;
            _loc24_.imagesPath = _loc7_["images"];
         }
         var _loc39_:int = 0;
         var _loc38_:* = _loc16_["bones"];
         for each(var _loc30_ in _loc16_["bones"])
         {
            _loc3_ = null;
            _loc32_ = _loc30_["parent"];
            if(_loc32_)
            {
               _loc3_ = _loc24_.findBone(_loc32_);
               if(!_loc3_)
               {
                  throw new Error("Parent bone not found: " + _loc32_);
               }
            }
            _loc23_ = new BoneData(_loc24_.bones.length,_loc30_["name"],_loc3_);
            _loc23_.length = (_loc30_["length"] || 0) * scale;
            _loc23_.x = (_loc30_["x"] || 0) * scale;
            _loc23_.y = (_loc30_["y"] || 0) * scale;
            _loc23_.rotation = _loc30_["rotation"] || 0;
            _loc23_.scaleX = !!_loc30_.hasOwnProperty("scaleX")?_loc30_["scaleX"]:1;
            _loc23_.scaleY = !!_loc30_.hasOwnProperty("scaleY")?_loc30_["scaleY"]:1;
            _loc23_.shearX = Number(_loc30_["shearX"] || 0);
            _loc23_.shearY = Number(_loc30_["shearY"] || 0);
            _loc23_.transformMode = TransformMode[_loc30_["transform"] || "normal"];
            _loc24_.bones.push(_loc23_);
         }
         var _loc41_:int = 0;
         var _loc40_:* = _loc16_["slots"];
         for each(var _loc34_ in _loc16_["slots"])
         {
            _loc10_ = _loc34_["name"];
            _loc20_ = _loc34_["bone"];
            _loc23_ = _loc24_.findBone(_loc20_);
            if(!_loc23_)
            {
               throw new Error("Slot bone not found: " + _loc20_);
            }
            _loc36_ = new SlotData(_loc24_.slots.length,_loc10_,_loc23_);
            _loc4_ = _loc34_["color"];
            if(_loc4_)
            {
               _loc36_.r = toColor(_loc4_,0);
               _loc36_.g = toColor(_loc4_,1);
               _loc36_.b = toColor(_loc4_,2);
               _loc36_.a = toColor(_loc4_,3);
            }
            _loc36_.attachmentName = _loc34_["attachment"];
            _loc36_.blendMode = BlendMode[_loc34_["blend"] || "normal"];
            _loc24_.slots.push(_loc36_);
         }
         var _loc45_:int = 0;
         var _loc44_:* = _loc16_["ik"];
         for each(var _loc14_ in _loc16_["ik"])
         {
            _loc5_ = new IkConstraintData(_loc14_["name"]);
            _loc5_.order = _loc14_["order"] || 0;
            var _loc43_:int = 0;
            var _loc42_:* = _loc14_["bones"];
            for each(_loc20_ in _loc14_["bones"])
            {
               _loc26_ = _loc24_.findBone(_loc20_);
               if(!_loc26_)
               {
                  throw new Error("IK constraint bone not found: " + _loc20_);
               }
               _loc5_.bones.push(_loc26_);
            }
            _loc5_.target = _loc24_.findBone(_loc14_["target"]);
            if(!_loc5_.target)
            {
               throw new Error("Target bone not found: " + _loc14_["target"]);
            }
            _loc5_.bendDirection = !_loc14_.hasOwnProperty("bendPositive") || _loc14_["bendPositive"]?1:-1;
            _loc5_.mix = !!_loc14_.hasOwnProperty("mix")?_loc14_["mix"]:1;
            _loc24_.ikConstraints.push(_loc5_);
         }
         var _loc49_:int = 0;
         var _loc48_:* = _loc16_["transform"];
         for each(_loc14_ in _loc16_["transform"])
         {
            _loc27_ = new TransformConstraintData(_loc14_["name"]);
            _loc27_.order = _loc14_["order"] || 0;
            var _loc47_:int = 0;
            var _loc46_:* = _loc14_["bones"];
            for each(_loc20_ in _loc14_["bones"])
            {
               _loc26_ = _loc24_.findBone(_loc20_);
               if(!_loc26_)
               {
                  throw new Error("Transform constraint bone not found: " + _loc20_);
               }
               _loc27_.bones.push(_loc26_);
            }
            _loc27_.target = _loc24_.findBone(_loc14_["target"]);
            if(!_loc27_.target)
            {
               throw new Error("Target bone not found: " + _loc14_["target"]);
            }
            _loc27_.offsetRotation = Number(_loc14_["rotation"] || 0);
            _loc27_.offsetX = (_loc14_["x"] || 0) * scale;
            _loc27_.offsetY = (_loc14_["y"] || 0) * scale;
            _loc27_.offsetScaleX = Number(_loc14_["scaleX"] || 0);
            _loc27_.offsetScaleY = Number(_loc14_["scaleY"] || 0);
            _loc27_.offsetShearY = Number(_loc14_["shearY"] || 0);
            _loc27_.rotateMix = !!_loc14_.hasOwnProperty("rotateMix")?_loc14_["rotateMix"]:1;
            _loc27_.translateMix = !!_loc14_.hasOwnProperty("translateMix")?_loc14_["translateMix"]:1;
            _loc27_.scaleMix = !!_loc14_.hasOwnProperty("scaleMix")?_loc14_["scaleMix"]:1;
            _loc27_.shearMix = !!_loc14_.hasOwnProperty("shearMix")?_loc14_["shearMix"]:1;
            _loc24_.transformConstraints.push(_loc27_);
         }
         var _loc53_:int = 0;
         var _loc52_:* = _loc16_["path"];
         for each(_loc14_ in _loc16_["path"])
         {
            _loc37_ = new PathConstraintData(_loc14_["name"]);
            _loc37_.order = _loc14_["order"] || 0;
            var _loc51_:int = 0;
            var _loc50_:* = _loc14_["bones"];
            for each(_loc20_ in _loc14_["bones"])
            {
               _loc26_ = _loc24_.findBone(_loc20_);
               if(!_loc26_)
               {
                  throw new Error("Path constraint bone not found: " + _loc20_);
               }
               _loc37_.bones.push(_loc26_);
            }
            _loc37_.target = _loc24_.findSlot(_loc14_["target"]);
            if(!_loc37_.target)
            {
               throw new Error("Path target slot not found: " + _loc14_["target"]);
            }
            _loc37_.positionMode = PositionMode[_loc14_["positionMode"] || "percent"];
            _loc37_.spacingMode = SpacingMode[_loc14_["spacingMode"] || "length"];
            _loc37_.rotateMode = RotateMode[_loc14_["rotateMode"] || "tangent"];
            _loc37_.offsetRotation = Number(_loc14_["rotation"] || 0);
            _loc37_.position = Number(_loc14_["position"] || 0);
            if(_loc37_.positionMode == PositionMode.fixed)
            {
               _loc37_.position = _loc37_.position * scale;
            }
            _loc37_.spacing = Number(_loc14_["spacing"] || 0);
            if(_loc37_.spacingMode == SpacingMode.length || _loc37_.spacingMode == SpacingMode.fixed)
            {
               _loc37_.spacing = _loc37_.spacing * scale;
            }
            _loc37_.rotateMix = !!_loc14_.hasOwnProperty("rotateMix")?_loc14_["rotateMix"]:1;
            _loc37_.translateMix = !!_loc14_.hasOwnProperty("translateMix")?_loc14_["translateMix"]:1;
            _loc24_.pathConstraints.push(_loc37_);
         }
         var _loc11_:Object = _loc16_["skins"];
         var _loc59_:int = 0;
         var _loc58_:* = _loc11_;
         for(var _loc25_ in _loc11_)
         {
            _loc22_ = _loc11_[_loc25_];
            _loc6_ = new Skin(_loc25_);
            var _loc57_:int = 0;
            var _loc56_:* = _loc22_;
            for(_loc10_ in _loc22_)
            {
               _loc9_ = _loc24_.findSlotIndex(_loc10_);
               _loc15_ = _loc22_[_loc10_];
               var _loc55_:int = 0;
               var _loc54_:* = _loc15_;
               for(var _loc35_ in _loc15_)
               {
                  _loc13_ = readAttachment(_loc15_[_loc35_],_loc6_,_loc9_,_loc35_);
                  if(_loc13_ != null)
                  {
                     _loc6_.addAttachment(_loc9_,_loc35_,_loc13_);
                  }
               }
            }
            _loc24_.skins[_loc24_.skins.length] = _loc6_;
            if(_loc6_.name == "default")
            {
               _loc24_.defaultSkin = _loc6_;
            }
         }
         var _loc8_:Vector.<LinkedMesh> = this.linkedMeshes;
         var _loc61_:int = 0;
         var _loc60_:* = _loc8_;
         for each(var _loc28_ in _loc8_)
         {
            _loc29_ = !_loc28_.skin?_loc24_.defaultSkin:_loc24_.findSkin(_loc28_.skin);
            if(!_loc29_)
            {
               throw new Error("Skin not found: " + _loc28_.skin);
            }
            _loc12_ = _loc29_.getAttachment(_loc28_.slotIndex,_loc28_.parent);
            if(!_loc12_)
            {
               throw new Error("Parent mesh not found: " + _loc28_.parent);
            }
            _loc28_.mesh.parentMesh = MeshAttachment(_loc12_);
            _loc28_.mesh.updateUVs();
         }
         _loc8_.length = 0;
         var _loc19_:Object = _loc16_["events"];
         if(_loc19_)
         {
            var _loc63_:int = 0;
            var _loc62_:* = _loc19_;
            for(var _loc18_ in _loc19_)
            {
               _loc31_ = _loc19_[_loc18_];
               _loc33_ = new EventData(_loc18_);
               _loc33_.intValue = _loc31_["int"] || 0;
               _loc33_.floatValue = _loc31_["float"] || 0;
               _loc33_.stringValue = _loc31_["string"] || "";
               _loc24_.events.push(_loc33_);
            }
         }
         var _loc17_:Object = _loc16_["animations"];
         var _loc65_:int = 0;
         var _loc64_:* = _loc17_;
         for(var _loc21_ in _loc17_)
         {
            readAnimation(_loc17_[_loc21_],_loc21_,_loc24_);
         }
         return _loc24_;
      }
      
      private function readAttachment(param1:Object, param2:Skin, param3:int, param4:String) : Attachment
      {
         var _loc5_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc13_:* = undefined;
         var _loc8_:* = null;
         var _loc11_:* = null;
         var _loc10_:int = 0;
         var _loc14_:* = undefined;
         param4 = param1["name"] || param4;
         var _loc6_:String = param1["type"] || "region";
         var _loc9_:AttachmentType = AttachmentType[_loc6_];
         var _loc7_:Number = this.scale;
         var _loc18_:* = _loc9_;
         switch(_loc18_)
         {
            case AttachmentType.region:
               _loc15_ = attachmentLoader.newRegionAttachment(param2,param4,param1["path"] || param4);
               if(!_loc15_)
               {
                  return null;
               }
               _loc15_.path = param1["path"] || param4;
               _loc15_.x = (param1["x"] || 0) * _loc7_;
               _loc15_.y = (param1["y"] || 0) * _loc7_;
               _loc15_.scaleX = !!param1.hasOwnProperty("scaleX")?param1["scaleX"]:1;
               _loc15_.scaleY = !!param1.hasOwnProperty("scaleY")?param1["scaleY"]:1;
               _loc15_.rotation = param1["rotation"] || 0;
               _loc15_.width = (param1["width"] || 0) * _loc7_;
               _loc15_.height = (param1["height"] || 0) * _loc7_;
               _loc5_ = param1["color"];
               if(_loc5_)
               {
                  _loc15_.r = toColor(_loc5_,0);
                  _loc15_.g = toColor(_loc5_,1);
                  _loc15_.b = toColor(_loc5_,2);
                  _loc15_.a = toColor(_loc5_,3);
               }
               _loc15_.updateOffset();
               return _loc15_;
            case AttachmentType.mesh:
            case AttachmentType.linkedmesh:
               _loc16_ = attachmentLoader.newMeshAttachment(param2,param4,param1["path"] || param4);
               if(!_loc16_)
               {
                  return null;
               }
               _loc16_.path = param1["path"] || param4;
               _loc5_ = param1["color"];
               if(_loc5_)
               {
                  _loc16_.r = toColor(_loc5_,0);
                  _loc16_.g = toColor(_loc5_,1);
                  _loc16_.b = toColor(_loc5_,2);
                  _loc16_.a = toColor(_loc5_,3);
               }
               _loc16_.width = (param1["width"] || 0) * _loc7_;
               _loc16_.height = (param1["height"] || 0) * _loc7_;
               if(param1["parent"])
               {
                  _loc16_.inheritDeform = !!param1.hasOwnProperty("deform")?Boolean(param1["deform"]):true;
                  linkedMeshes.push(new LinkedMesh(_loc16_,param1["skin"],param3,param1["parent"]));
                  return _loc16_;
               }
               _loc13_ = getFloatArray(param1,"uvs",1);
               readVertices(param1,_loc16_,_loc13_.length);
               _loc16_.triangles = getUintArray(param1,"triangles");
               _loc16_.regionUVs = _loc13_;
               _loc16_.updateUVs();
               _loc16_.hullLength = (int(param1["hull"] || 0)) * 2;
               if(param1["edges"])
               {
                  _loc16_.edges = getIntArray(param1,"edges");
               }
               return _loc16_;
            case AttachmentType.boundingbox:
               _loc8_ = attachmentLoader.newBoundingBoxAttachment(param2,param4);
               if(!_loc8_)
               {
                  return null;
               }
               readVertices(param1,_loc8_,int(param1["vertexCount"]) << 1);
               return _loc8_;
            case AttachmentType.path:
               _loc11_ = attachmentLoader.newPathAttachment(param2,param4);
               if(!_loc11_)
               {
                  return null;
               }
               _loc11_.closed = !!param1.hasOwnProperty("closed")?Boolean(param1["closed"]):false;
               _loc11_.constantSpeed = !!param1.hasOwnProperty("constantSpeed")?Boolean(param1["constantSpeed"]):true;
               _loc10_ = param1["vertexCount"];
               readVertices(param1,_loc11_,_loc10_ << 1);
               _loc14_ = new Vector.<Number>();
               _loc18_ = 0;
               var _loc17_:* = param1["lengths"];
               for each(var _loc12_ in param1["lengths"])
               {
                  _loc14_.push(_loc12_ * _loc7_);
               }
               _loc11_.lengths = _loc14_;
               return _loc11_;
            default:
               return null;
         }
      }
      
      private function readVertices(param1:Object, param2:VertexAttachment, param3:int) : void
      {
         var _loc7_:int = 0;
         var _loc10_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:int = 0;
         param2.worldVerticesLength = param3;
         var _loc5_:Vector.<Number> = getFloatArray(param1,"vertices",1);
         if(param3 == _loc5_.length)
         {
            if(scale != 1)
            {
               _loc7_ = 0;
               _loc10_ = _loc5_.length;
               while(_loc7_ < _loc10_)
               {
                  var _loc11_:* = _loc7_;
                  var _loc12_:* = _loc5_[_loc11_] * scale;
                  _loc5_[_loc11_] = _loc12_;
                  _loc7_++;
               }
            }
            param2.vertices = _loc5_;
            return;
         }
         var _loc9_:Vector.<Number> = new Vector.<Number>(param3 * 3 * 3);
         _loc9_.length = 0;
         var _loc6_:Vector.<int> = new Vector.<int>(param3 * 3);
         _loc6_.length = 0;
         _loc7_ = 0;
         _loc10_ = _loc5_.length;
         _loc5_.length;
         while(_loc7_ < _loc10_)
         {
            _loc7_++;
            _loc8_ = _loc5_[_loc7_];
            _loc6_.push(_loc8_);
            _loc4_ = _loc7_ + _loc8_ * 4;
            while(_loc7_ < _loc4_)
            {
               _loc6_.push(int(_loc5_[_loc7_]));
               _loc9_.push(_loc5_[_loc7_ + 1] * scale);
               _loc9_.push(_loc5_[_loc7_ + 2] * scale);
               _loc9_.push(_loc5_[_loc7_ + 3]);
               _loc7_ = _loc7_ + 4;
            }
         }
         param2.bones = _loc6_;
         param2.vertices = _loc9_;
      }
      
      private function readAnimation(param1:Object, param2:String, param3:SkeletonData) : void
      {
         var _loc43_:int = 0;
         var _loc13_:* = null;
         var _loc76_:* = null;
         var _loc50_:* = null;
         var _loc35_:int = 0;
         var _loc40_:* = null;
         var _loc67_:* = 0;
         var _loc12_:* = null;
         var _loc47_:* = null;
         var _loc36_:* = null;
         var _loc74_:Number = NaN;
         var _loc63_:Number = NaN;
         var _loc60_:Number = NaN;
         var _loc59_:Number = NaN;
         var _loc78_:* = null;
         var _loc33_:int = 0;
         var _loc25_:* = null;
         var _loc21_:* = null;
         var _loc6_:* = null;
         var _loc58_:* = NaN;
         var _loc79_:Number = NaN;
         var _loc80_:Number = NaN;
         var _loc75_:* = null;
         var _loc44_:* = null;
         var _loc56_:Number = NaN;
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc49_:* = null;
         var _loc10_:Number = NaN;
         var _loc54_:Number = NaN;
         var _loc62_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc22_:int = 0;
         var _loc8_:* = null;
         var _loc19_:* = null;
         var _loc5_:* = null;
         var _loc57_:Number = NaN;
         var _loc81_:* = null;
         var _loc41_:* = null;
         var _loc16_:* = null;
         var _loc46_:* = null;
         var _loc15_:* = false;
         var _loc38_:* = undefined;
         var _loc39_:int = 0;
         var _loc14_:* = null;
         var _loc20_:* = undefined;
         var _loc37_:* = null;
         var _loc65_:int = 0;
         var _loc61_:* = undefined;
         var _loc70_:int = 0;
         var _loc32_:* = null;
         var _loc48_:int = 0;
         var _loc31_:* = undefined;
         var _loc77_:* = null;
         var _loc66_:* = undefined;
         var _loc52_:int = 0;
         var _loc11_:* = null;
         var _loc28_:* = null;
         var _loc55_:* = null;
         var _loc42_:Number = this.scale;
         var _loc27_:Vector.<Timeline> = new Vector.<Timeline>();
         var _loc45_:* = 0;
         var _loc26_:Object = param1["slots"];
         var _loc90_:int = 0;
         var _loc89_:* = _loc26_;
         for(_loc13_ in _loc26_)
         {
            _loc76_ = _loc26_[_loc13_];
            _loc43_ = param3.findSlotIndex(_loc13_);
            var _loc88_:int = 0;
            var _loc87_:* = _loc76_;
            for(_loc12_ in _loc76_)
            {
               _loc40_ = _loc76_[_loc12_];
               if(_loc12_ == "color")
               {
                  _loc47_ = new ColorTimeline(_loc40_.length);
                  _loc47_.slotIndex = _loc43_;
                  _loc35_ = 0;
                  var _loc84_:* = 0;
                  var _loc83_:* = _loc40_;
                  for each(_loc50_ in _loc40_)
                  {
                     _loc36_ = _loc50_["color"];
                     _loc74_ = toColor(_loc36_,0);
                     _loc63_ = toColor(_loc36_,1);
                     _loc60_ = toColor(_loc36_,2);
                     _loc59_ = toColor(_loc36_,3);
                     _loc47_.setFrame(_loc35_,_loc50_["time"],_loc74_,_loc63_,_loc60_,_loc59_);
                     readCurve(_loc50_,_loc47_,_loc35_);
                     _loc35_++;
                  }
                  _loc27_[_loc27_.length] = _loc47_;
                  _loc45_ = Number(Math.max(_loc45_,_loc47_.frames[(_loc47_.frameCount - 1) * 5]));
                  continue;
               }
               if(_loc12_ == "attachment")
               {
                  _loc78_ = new AttachmentTimeline(_loc40_.length);
                  _loc78_.slotIndex = _loc43_;
                  _loc35_ = 0;
                  var _loc86_:* = 0;
                  var _loc85_:* = _loc40_;
                  for each(_loc50_ in _loc40_)
                  {
                     _loc35_++;
                     _loc78_.setFrame(_loc35_,_loc50_["time"],_loc50_["name"]);
                  }
                  _loc27_[_loc27_.length] = _loc78_;
                  _loc45_ = Number(Math.max(_loc45_,_loc78_.frames[_loc78_.frameCount - 1]));
                  continue;
               }
               throw new Error("Invalid timeline type for a slot: " + _loc12_ + " (" + _loc13_ + ")");
            }
         }
         var _loc29_:Object = param1["bones"];
         var _loc98_:int = 0;
         var _loc97_:* = _loc29_;
         for(var _loc17_ in _loc29_)
         {
            _loc33_ = param3.findBoneIndex(_loc17_);
            if(_loc33_ == -1)
            {
               throw new Error("Bone not found: " + _loc17_);
            }
            _loc25_ = _loc29_[_loc17_];
            var _loc96_:int = 0;
            var _loc95_:* = _loc25_;
            for(_loc12_ in _loc25_)
            {
               _loc40_ = _loc25_[_loc12_];
               if(_loc12_ == "rotate")
               {
                  _loc21_ = new RotateTimeline(_loc40_.length);
                  _loc21_.boneIndex = _loc33_;
                  _loc35_ = 0;
                  var _loc92_:int = 0;
                  var _loc91_:* = _loc40_;
                  for each(_loc50_ in _loc40_)
                  {
                     _loc21_.setFrame(_loc35_,_loc50_["time"],_loc50_["angle"]);
                     readCurve(_loc50_,_loc21_,_loc35_);
                     _loc35_++;
                  }
                  _loc27_[_loc27_.length] = _loc21_;
                  _loc45_ = Number(Math.max(_loc45_,_loc21_.frames[(_loc21_.frameCount - 1) * 2]));
                  continue;
               }
               if(_loc12_ == "translate" || _loc12_ == "scale" || _loc12_ == "shear")
               {
                  _loc58_ = 1;
                  if(_loc12_ == "scale")
                  {
                     _loc6_ = new ScaleTimeline(_loc40_.length);
                  }
                  else if(_loc12_ == "shear")
                  {
                     _loc6_ = new ShearTimeline(_loc40_.length);
                  }
                  else
                  {
                     _loc6_ = new TranslateTimeline(_loc40_.length);
                     _loc58_ = _loc42_;
                  }
                  _loc6_.boneIndex = _loc33_;
                  _loc35_ = 0;
                  var _loc94_:int = 0;
                  var _loc93_:* = _loc40_;
                  for each(_loc50_ in _loc40_)
                  {
                     _loc79_ = (_loc50_["x"] || 0) * _loc58_;
                     _loc80_ = (_loc50_["y"] || 0) * _loc58_;
                     _loc6_.setFrame(_loc35_,_loc50_["time"],_loc79_,_loc80_);
                     readCurve(_loc50_,_loc6_,_loc35_);
                     _loc35_++;
                  }
                  _loc27_[_loc27_.length] = _loc6_;
                  _loc45_ = Number(Math.max(_loc45_,_loc6_.frames[(_loc6_.frameCount - 1) * 3]));
                  continue;
               }
               throw new Error("Invalid timeline type for a bone: " + _loc12_ + " (" + _loc17_ + ")");
            }
         }
         var _loc18_:Object = param1["ik"];
         var _loc102_:int = 0;
         var _loc101_:* = _loc18_;
         for(var _loc82_ in _loc18_)
         {
            _loc75_ = param3.findIkConstraint(_loc82_);
            _loc40_ = _loc18_[_loc82_];
            _loc44_ = new IkConstraintTimeline(_loc40_.length);
            _loc44_.ikConstraintIndex = param3.ikConstraints.indexOf(_loc75_);
            _loc35_ = 0;
            var _loc100_:int = 0;
            var _loc99_:* = _loc40_;
            for each(_loc50_ in _loc40_)
            {
               _loc56_ = !!_loc50_.hasOwnProperty("mix")?_loc50_["mix"]:1;
               _loc7_ = !_loc50_.hasOwnProperty("bendPositive") || _loc50_["bendPositive"]?1:-1;
               _loc44_.setFrame(_loc35_,_loc50_["time"],_loc56_,_loc7_);
               readCurve(_loc50_,_loc44_,_loc35_);
               _loc35_++;
            }
            _loc27_[_loc27_.length] = _loc44_;
            _loc45_ = Number(Math.max(_loc45_,_loc44_.frames[(_loc44_.frameCount - 1) * 3]));
         }
         var _loc9_:Object = param1["transform"];
         var _loc106_:int = 0;
         var _loc105_:* = _loc9_;
         for(var _loc24_ in _loc9_)
         {
            _loc4_ = param3.findTransformConstraint(_loc24_);
            _loc40_ = _loc9_[_loc24_];
            _loc49_ = new TransformConstraintTimeline(_loc40_.length);
            _loc49_.transformConstraintIndex = param3.transformConstraints.indexOf(_loc4_);
            _loc35_ = 0;
            var _loc104_:int = 0;
            var _loc103_:* = _loc40_;
            for each(_loc50_ in _loc40_)
            {
               _loc10_ = !!_loc50_.hasOwnProperty("rotateMix")?_loc50_["rotateMix"]:1;
               _loc54_ = !!_loc50_.hasOwnProperty("translateMix")?_loc50_["translateMix"]:1;
               _loc62_ = !!_loc50_.hasOwnProperty("scaleMix")?_loc50_["scaleMix"]:1;
               _loc23_ = !!_loc50_.hasOwnProperty("shearMix")?_loc50_["shearMix"]:1;
               _loc49_.setFrame(_loc35_,_loc50_["time"],_loc10_,_loc54_,_loc62_,_loc23_);
               readCurve(_loc50_,_loc49_,_loc35_);
               _loc35_++;
            }
            _loc27_.push(_loc49_);
            _loc45_ = Number(Math.max(_loc45_,_loc49_.frames[(_loc49_.frameCount - 1) * 5]));
         }
         var _loc30_:Object = param1["paths"];
         var _loc114_:int = 0;
         var _loc113_:* = _loc30_;
         for(var _loc34_ in _loc30_)
         {
            _loc22_ = param3.findPathConstraintIndex(_loc34_);
            if(_loc22_ == -1)
            {
               throw new Error("Path constraint not found: " + _loc34_);
            }
            _loc8_ = param3.pathConstraints[_loc22_];
            _loc19_ = _loc30_[_loc34_];
            var _loc112_:int = 0;
            var _loc111_:* = _loc19_;
            for(_loc12_ in _loc19_)
            {
               _loc40_ = _loc19_[_loc12_];
               if(_loc12_ == "position" || _loc12_ == "spacing")
               {
                  _loc58_ = 1;
                  if(_loc12_ == "spacing")
                  {
                     _loc5_ = new PathConstraintSpacingTimeline(_loc40_.length);
                     if(_loc8_.spacingMode == SpacingMode.length || _loc8_.spacingMode == SpacingMode.fixed)
                     {
                        _loc58_ = _loc42_;
                     }
                  }
                  else
                  {
                     _loc5_ = new PathConstraintPositionTimeline(_loc40_.length);
                     if(_loc8_.positionMode == PositionMode.fixed)
                     {
                        _loc58_ = _loc42_;
                     }
                  }
                  _loc5_.pathConstraintIndex = _loc22_;
                  _loc35_ = 0;
                  var _loc108_:int = 0;
                  var _loc107_:* = _loc40_;
                  for each(_loc50_ in _loc40_)
                  {
                     _loc57_ = _loc50_[_loc12_] || 0;
                     _loc5_.setFrame(_loc35_,_loc50_["time"],_loc57_ * _loc58_);
                     readCurve(_loc50_,_loc5_,_loc35_);
                     _loc35_++;
                  }
                  _loc27_.push(_loc5_);
                  _loc45_ = Number(Math.max(_loc45_,_loc5_.frames[(_loc5_.frameCount - 1) * 2]));
               }
               else if(_loc12_ == "mix")
               {
                  _loc81_ = new PathConstraintMixTimeline(_loc40_.length);
                  _loc81_.pathConstraintIndex = _loc22_;
                  _loc35_ = 0;
                  var _loc110_:int = 0;
                  var _loc109_:* = _loc40_;
                  for each(_loc50_ in _loc40_)
                  {
                     _loc10_ = !!_loc50_.hasOwnProperty("rotateMix")?_loc50_["rotateMix"]:1;
                     _loc54_ = !!_loc50_.hasOwnProperty("translateMix")?_loc50_["translateMix"]:1;
                     _loc81_.setFrame(_loc35_,_loc50_["time"],_loc10_,_loc54_);
                     readCurve(_loc50_,_loc81_,_loc35_);
                     _loc35_++;
                  }
                  _loc27_.push(_loc81_);
                  _loc45_ = Number(Math.max(_loc45_,_loc81_.frames[(_loc81_.frameCount - 1) * 3]));
               }
            }
         }
         var _loc64_:Object = param1["deform"];
         var _loc122_:int = 0;
         var _loc121_:* = _loc64_;
         for(var _loc68_ in _loc64_)
         {
            _loc41_ = param3.findSkin(_loc68_);
            _loc76_ = _loc64_[_loc68_];
            var _loc120_:int = 0;
            var _loc119_:* = _loc76_;
            for(_loc13_ in _loc76_)
            {
               _loc43_ = param3.findSlotIndex(_loc13_);
               _loc16_ = _loc76_[_loc13_];
               var _loc118_:int = 0;
               var _loc117_:* = _loc16_;
               for(_loc12_ in _loc16_)
               {
                  _loc40_ = _loc16_[_loc12_];
                  _loc46_ = _loc41_.getAttachment(_loc43_,_loc12_) as VertexAttachment;
                  if(_loc46_ == null)
                  {
                     throw new Error("Deform attachment not found: " + _loc12_);
                  }
                  _loc15_ = _loc46_.bones != null;
                  _loc38_ = _loc46_.vertices;
                  _loc39_ = !!_loc15_?_loc38_.length / 3 * 2:_loc38_.length;
                  _loc14_ = new DeformTimeline(_loc40_.length);
                  _loc14_.slotIndex = _loc43_;
                  _loc14_.attachment = _loc46_;
                  _loc35_ = 0;
                  var _loc116_:int = 0;
                  var _loc115_:* = _loc40_;
                  for each(_loc50_ in _loc40_)
                  {
                     _loc37_ = _loc50_["vertices"];
                     if(_loc37_ == null)
                     {
                        _loc20_ = !!_loc15_?new Vector.<Number>(_loc39_,true):_loc38_;
                     }
                     else
                     {
                        _loc20_ = new Vector.<Number>(_loc39_,true);
                        _loc65_ = Number(_loc50_["offset"] || 0);
                        _loc61_ = getFloatArray(_loc50_,"vertices",1);
                        _loc67_ = 0;
                        while(_loc67_ < _loc61_.length)
                        {
                           _loc20_[_loc65_ + _loc67_] = _loc61_[_loc67_];
                           _loc67_++;
                        }
                        if(_loc42_ != 1)
                        {
                           _loc67_ = _loc65_;
                           _loc70_ = _loc67_ + _loc61_.length;
                           _loc67_ + _loc61_.length;
                           while(_loc67_ < _loc70_)
                           {
                              _loc84_ = _loc67_;
                              _loc83_ = _loc20_[_loc84_] * _loc42_;
                              _loc20_[_loc84_] = _loc83_;
                              _loc67_++;
                           }
                        }
                        if(!_loc15_)
                        {
                           _loc67_ = 0;
                           while(_loc67_ < _loc39_)
                           {
                              _loc86_ = _loc67_;
                              _loc85_ = _loc20_[_loc86_] + _loc38_[_loc67_];
                              _loc20_[_loc86_] = _loc85_;
                              _loc67_++;
                           }
                        }
                     }
                     _loc14_.setFrame(_loc35_,_loc50_["time"],_loc20_);
                     readCurve(_loc50_,_loc14_,_loc35_);
                     _loc35_++;
                  }
                  _loc27_[_loc27_.length] = _loc14_;
                  _loc45_ = Number(Math.max(_loc45_,_loc14_.frames[_loc14_.frameCount - 1]));
               }
            }
         }
         var _loc72_:Array = param1["drawOrder"];
         if(!_loc72_)
         {
            _loc72_ = param1["draworder"];
         }
         if(_loc72_)
         {
            _loc32_ = new DrawOrderTimeline(_loc72_.length);
            _loc48_ = param3.slots.length;
            _loc35_ = 0;
            var _loc126_:int = 0;
            var _loc125_:* = _loc72_;
            for each(var _loc51_ in _loc72_)
            {
               _loc31_ = null;
               if(_loc51_["offsets"])
               {
                  _loc31_ = new Vector.<int>(_loc48_);
                  _loc67_ = int(_loc48_ - 1);
                  while(_loc67_ >= 0)
                  {
                     _loc31_[_loc67_] = -1;
                     _loc67_--;
                  }
                  _loc77_ = _loc51_["offsets"];
                  _loc66_ = new Vector.<int>(_loc48_ - _loc77_.length);
                  _loc52_ = 0;
                  var _loc53_:int = 0;
                  var _loc124_:int = 0;
                  var _loc123_:* = _loc77_;
                  for each(var _loc69_ in _loc77_)
                  {
                     _loc43_ = param3.findSlotIndex(_loc69_["slot"]);
                     if(_loc43_ == -1)
                     {
                        throw new Error("Slot not found: " + _loc69_["slot"]);
                     }
                     while(_loc52_ != _loc43_)
                     {
                        _loc53_++;
                        _loc52_++;
                        _loc66_[_loc53_] = _loc52_;
                     }
                     _loc52_++;
                     _loc31_[_loc52_ + _loc69_["offset"]] = _loc52_;
                  }
                  while(_loc52_ < _loc48_)
                  {
                     _loc53_++;
                     _loc52_++;
                     _loc66_[_loc53_] = _loc52_;
                  }
                  _loc67_ = int(_loc48_ - 1);
                  while(_loc67_ >= 0)
                  {
                     if(_loc31_[_loc67_] == -1)
                     {
                        _loc53_--;
                        _loc31_[_loc67_] = _loc66_[_loc53_];
                     }
                     _loc67_--;
                  }
               }
               _loc35_++;
               _loc32_.setFrame(_loc35_,_loc51_["time"],_loc31_);
            }
            _loc27_[_loc27_.length] = _loc32_;
            _loc45_ = Number(Math.max(_loc45_,_loc32_.frames[_loc32_.frameCount - 1]));
         }
         var _loc71_:Array = param1["events"];
         if(_loc71_)
         {
            _loc11_ = new EventTimeline(_loc71_.length);
            _loc35_ = 0;
            var _loc128_:int = 0;
            var _loc127_:* = _loc71_;
            for each(var _loc73_ in _loc71_)
            {
               _loc28_ = param3.findEvent(_loc73_["name"]);
               if(!_loc28_)
               {
                  throw new Error("Event not found: " + _loc73_["name"]);
               }
               _loc55_ = new Event(_loc73_["time"],_loc28_);
               _loc55_.intValue = !!_loc73_.hasOwnProperty("int")?_loc73_["int"]:_loc28_.intValue;
               _loc55_.floatValue = !!_loc73_.hasOwnProperty("float")?_loc73_["float"]:_loc28_.floatValue;
               _loc55_.stringValue = !!_loc73_.hasOwnProperty("string")?_loc73_["string"]:_loc28_.stringValue;
               _loc35_++;
               _loc11_.setFrame(_loc35_,_loc55_);
            }
            _loc27_[_loc27_.length] = _loc11_;
            _loc45_ = Number(Math.max(_loc45_,_loc11_.frames[_loc11_.frameCount - 1]));
         }
         param3.animations[param3.animations.length] = new Animation(param2,_loc27_,_loc45_);
      }
   }
}

import spine.attachments.MeshAttachment;

class LinkedMesh
{
    
   
   private var parent:String;
   
   private var skin:String;
   
   private var slotIndex:int;
   
   private var mesh:MeshAttachment;
   
   function LinkedMesh(param1:MeshAttachment, param2:String, param3:int, param4:String)
   {
      super();
      this.mesh = param1;
      this.skin = param2;
      this.slotIndex = param3;
      this.parent = param4;
   }
}

package spine.flash
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import spine.Bone;
   import spine.Skeleton;
   import spine.SkeletonData;
   import spine.Slot;
   import spine.atlas.AtlasRegion;
   import spine.attachments.RegionAttachment;
   
   public class SkeletonSprite extends Sprite
   {
      
      private static var blendModes:Vector.<String> = new <String>["normal","add","multiply","screen"];
       
      
      private var _skeleton:Skeleton;
      
      public var timeScale:Number = 1;
      
      private var lastTime:int;
      
      private var wrappers:Dictionary;
      
      public function SkeletonSprite(param1:SkeletonData)
      {
         wrappers = new Dictionary(true);
         super();
         Bone.yDown = true;
         _skeleton = new Skeleton(param1);
         _skeleton.updateWorldTransform();
         lastTime = getTimer();
         lastTime = getTimer();
         addEventListener("addedToStage",onAdd);
         addEventListener("removedFromStage",onRemove);
      }
      
      protected function onRemove(param1:Event) : void
      {
         removeEventListener("enterFrame",enterFrame);
      }
      
      public function clearListeners() : void
      {
         removeEventListener("addedToStage",onAdd);
         removeEventListener("removedFromStage",onRemove);
      }
      
      protected function onAdd(param1:Event) : void
      {
         lastTime = getTimer();
         enterFrame(null);
         addEventListener("enterFrame",enterFrame);
      }
      
      private function enterFrame(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         advanceTime((_loc2_ - lastTime) / 1000);
         lastTime = _loc2_;
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc11_:int = 0;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc18_:* = null;
         var _loc16_:Number = NaN;
         var _loc10_:* = null;
         var _loc12_:* = null;
         var _loc8_:Number = NaN;
         var _loc14_:* = null;
         var _loc9_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc20_:* = null;
         var _loc6_:* = null;
         var _loc17_:int = 0;
         var _loc19_:int = 0;
         _skeleton.update(param1 * timeScale);
         removeChildren();
         var _loc13_:Vector.<Slot> = skeleton.drawOrder;
         _loc4_ = 0;
         _loc11_ = _loc13_.length;
         while(_loc4_ < _loc11_)
         {
            _loc7_ = _loc13_[_loc4_];
            _loc2_ = _loc7_.attachment as RegionAttachment;
            if(_loc2_)
            {
               _loc5_ = wrappers[_loc2_];
               if(!_loc5_)
               {
                  _loc18_ = AtlasRegion(_loc2_.rendererObject);
                  _loc16_ = !!_loc18_.rotate?_loc18_.width:int(_loc18_.height);
                  _loc10_ = _loc18_.rendererObject as BitmapData;
                  if(!_loc10_)
                  {
                     _loc12_ = _loc18_.page.rendererObject as BitmapData;
                     _loc8_ = !!_loc18_.rotate?_loc18_.height:int(_loc18_.width);
                     _loc10_ = new BitmapData(_loc8_,_loc16_);
                     _loc10_.copyPixels(_loc12_,new Rectangle(_loc18_.x,_loc18_.y,_loc8_,_loc16_),new Point());
                     _loc18_.rendererObject = _loc10_;
                  }
                  _loc14_ = new Bitmap(_loc10_);
                  _loc14_.smoothing = true;
                  _loc14_.rotation = -_loc2_.rotation;
                  _loc14_.scaleX = _loc2_.scaleX * (_loc2_.width / _loc18_.width);
                  _loc14_.scaleY = _loc2_.scaleY * (_loc2_.height / _loc18_.height);
                  _loc9_ = -_loc2_.rotation * 3.14159265358979 / 180;
                  _loc3_ = Math.cos(_loc9_);
                  _loc15_ = Math.sin(_loc9_);
                  _loc21_ = -_loc2_.width / 2 * _loc2_.scaleX;
                  _loc22_ = -_loc2_.height / 2 * _loc2_.scaleY;
                  if(_loc18_.rotate)
                  {
                     _loc14_.rotation = _loc14_.rotation + 90;
                     _loc21_ = _loc21_ + _loc16_ * (_loc2_.width / _loc18_.width);
                  }
                  _loc14_.x = _loc2_.x + _loc21_ * _loc3_ - _loc22_ * _loc15_;
                  _loc14_.y = -_loc2_.y + _loc21_ * _loc15_ + _loc22_ * _loc3_;
                  _loc5_ = new Sprite();
                  _loc5_.transform.colorTransform = new ColorTransform();
                  _loc5_.addChild(_loc14_);
                  wrappers[_loc2_] = _loc5_;
               }
               _loc5_.blendMode = blendModes[_loc7_.data.blendMode.ordinal];
               _loc20_ = _loc5_.transform.colorTransform;
               _loc20_.redMultiplier = skeleton.r * _loc7_.r * _loc2_.r;
               _loc20_.greenMultiplier = skeleton.g * _loc7_.g * _loc2_.g;
               _loc20_.blueMultiplier = skeleton.b * _loc7_.b * _loc2_.b;
               _loc20_.alphaMultiplier = skeleton.a * _loc7_.a * _loc2_.a;
               _loc5_.transform.colorTransform = _loc20_;
               _loc6_ = _loc7_.bone;
               _loc17_ = !!skeleton.flipX?-1:1;
               _loc19_ = !!skeleton.flipY?-1:1;
               _loc5_.x = _loc6_.worldX;
               _loc5_.y = _loc6_.worldY;
               _loc5_.rotation = _loc6_.worldRotationX * _loc17_ * _loc19_;
               _loc5_.scaleX = _loc6_.worldScaleX * _loc17_;
               _loc5_.scaleY = _loc6_.worldScaleY * _loc19_;
               addChild(_loc5_);
            }
            _loc4_++;
         }
      }
      
      public function get skeleton() : Skeleton
      {
         return _skeleton;
      }
   }
}

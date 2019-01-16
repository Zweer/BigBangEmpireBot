package spine.animation
{
   import spine.Event;
   import spine.Skeleton;
   import spine.Slot;
   import spine.attachments.Attachment;
   import spine.attachments.VertexAttachment;
   
   public class DeformTimeline extends CurveTimeline
   {
       
      
      public var slotIndex:int;
      
      public var frames:Vector.<Number>;
      
      public var frameVertices:Vector.<Vector.<Number>>;
      
      public var attachment:VertexAttachment;
      
      public function DeformTimeline(param1:int)
      {
         super(param1);
         frames = new Vector.<Number>(param1,true);
         frameVertices = new Vector.<Vector.<Number>>(param1,true);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.deform.ordinal << 24) + slotIndex;
      }
      
      public function setFrame(param1:int, param2:Number, param3:Vector.<Number>) : void
      {
         frames[param1] = param2;
         frameVertices[param1] = param3;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc22_:* = 0;
         var _loc20_:int = 0;
         var _loc17_:* = null;
         var _loc25_:* = undefined;
         var _loc9_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc15_:* = undefined;
         var _loc10_:Slot = param1.slots[slotIndex];
         var _loc13_:Attachment = _loc10_.attachment;
         if(!(_loc13_ is VertexAttachment) || !VertexAttachment(_loc13_).applyDeform(attachment))
         {
            return;
         }
         var _loc16_:Vector.<Number> = this.frames;
         var _loc24_:Vector.<Number> = _loc10_.attachmentVertices;
         if(param3 < _loc16_[0])
         {
            if(param6)
            {
               _loc24_.length = 0;
            }
            return;
         }
         var _loc12_:Vector.<Vector.<Number>> = this.frameVertices;
         var _loc21_:int = _loc12_[0].length;
         if(_loc24_.length != _loc21_)
         {
            param5 = 1;
         }
         _loc24_.length = _loc21_;
         var _loc8_:* = _loc24_;
         if(param3 >= _loc16_[_loc16_.length - 1])
         {
            _loc15_ = _loc12_[_loc16_.length - 1];
            if(param5 == 1)
            {
               _loc20_ = 0;
               _loc22_ = _loc21_;
               _loc22_;
               while(_loc20_ < _loc22_)
               {
                  _loc8_[_loc20_] = _loc15_[_loc20_];
                  _loc20_++;
               }
            }
            else if(param6)
            {
               _loc17_ = VertexAttachment(_loc13_);
               if(_loc17_.bones == null)
               {
                  _loc25_ = _loc17_.vertices;
                  _loc20_ = 0;
                  while(_loc20_ < _loc21_)
                  {
                     _loc23_ = _loc25_[_loc20_];
                     _loc8_[_loc20_] = _loc23_ + (_loc15_[_loc20_] - _loc23_) * param5;
                     _loc20_++;
                  }
               }
               else
               {
                  _loc20_ = 0;
                  while(_loc20_ < _loc21_)
                  {
                     _loc8_[_loc20_] = _loc15_[_loc20_] * param5;
                     _loc20_++;
                  }
               }
            }
            else
            {
               _loc20_ = 0;
               while(_loc20_ < _loc21_)
               {
                  var _loc27_:* = _loc20_;
                  var _loc28_:* = _loc8_[_loc27_] + (_loc15_[_loc20_] - _loc8_[_loc20_]) * param5;
                  _loc8_[_loc27_] = _loc28_;
                  _loc20_++;
               }
            }
            return;
         }
         var _loc26_:int = Animation.binarySearch1(_loc16_,param3);
         var _loc18_:Vector.<Number> = _loc12_[_loc26_ - 1];
         var _loc14_:Vector.<Number> = _loc12_[_loc26_];
         var _loc19_:Number = _loc16_[_loc26_];
         var _loc11_:Number = getCurvePercent(_loc26_ - 1,1 - (param3 - _loc19_) / (_loc16_[_loc26_ - 1] - _loc19_));
         if(param5 == 1)
         {
            _loc20_ = 0;
            while(_loc20_ < _loc21_)
            {
               _loc9_ = _loc18_[_loc20_];
               _loc8_[_loc20_] = _loc9_ + (_loc14_[_loc20_] - _loc9_) * _loc11_;
               _loc20_++;
            }
         }
         else if(param6)
         {
            _loc17_ = VertexAttachment(_loc13_);
            if(_loc17_.bones == null)
            {
               _loc25_ = _loc17_.vertices;
               _loc20_ = 0;
               while(_loc20_ < _loc21_)
               {
                  _loc9_ = _loc18_[_loc20_];
                  _loc23_ = _loc25_[_loc20_];
                  _loc8_[_loc20_] = _loc23_ + (_loc9_ + (_loc14_[_loc20_] - _loc9_) * _loc11_ - _loc23_) * param5;
                  _loc20_++;
               }
            }
            else
            {
               _loc20_ = 0;
               while(_loc20_ < _loc21_)
               {
                  _loc9_ = _loc18_[_loc20_];
                  _loc8_[_loc20_] = (_loc9_ + (_loc14_[_loc20_] - _loc9_) * _loc11_) * param5;
                  _loc20_++;
               }
            }
         }
         else
         {
            _loc20_ = 0;
            while(_loc20_ < _loc21_)
            {
               _loc9_ = _loc18_[_loc20_];
               _loc28_ = _loc20_;
               _loc27_ = _loc8_[_loc28_] + (_loc9_ + (_loc14_[_loc20_] - _loc9_) * _loc11_ - _loc8_[_loc20_]) * param5;
               _loc8_[_loc28_] = _loc27_;
               _loc20_++;
            }
         }
      }
   }
}

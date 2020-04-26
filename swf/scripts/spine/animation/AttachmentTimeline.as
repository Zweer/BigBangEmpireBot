package spine.animation
{
   import spine.Event;
   import spine.Skeleton;
   import spine.Slot;
   
   public class AttachmentTimeline implements Timeline
   {
       
      
      public var slotIndex:int;
      
      public var frames:Vector.<Number>;
      
      public var attachmentNames:Vector.<String>;
      
      public function AttachmentTimeline(param1:int)
      {
         super();
         frames = new Vector.<Number>(param1,true);
         attachmentNames = new Vector.<String>(param1,true);
      }
      
      public function get frameCount() : int
      {
         return frames.length;
      }
      
      public function getPropertyId() : int
      {
         return (TimelineType.attachment.ordinal << 24) + slotIndex;
      }
      
      public function setFrame(param1:int, param2:Number, param3:String) : void
      {
         frames[param1] = param2;
         attachmentNames[param1] = param3;
      }
      
      public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc10_:* = null;
         var _loc8_:int = 0;
         var _loc11_:Slot = param1.slots[slotIndex];
         if(param7 && param6)
         {
            _loc10_ = _loc11_.data.attachmentName;
            _loc11_.attachment = _loc10_ == null?null:param1.getAttachmentForSlotIndex(slotIndex,_loc10_);
            return;
         }
         var _loc9_:Vector.<Number> = this.frames;
         if(param3 < _loc9_[0])
         {
            if(param6)
            {
               _loc10_ = _loc11_.data.attachmentName;
               _loc11_.attachment = _loc10_ == null?null:param1.getAttachmentForSlotIndex(slotIndex,_loc10_);
            }
            return;
         }
         if(param3 >= _loc9_[_loc9_.length - 1])
         {
            _loc8_ = _loc9_.length - 1;
         }
         else
         {
            _loc8_ = Animation.binarySearch(_loc9_,param3,1) - 1;
         }
         _loc10_ = attachmentNames[_loc8_];
         param1.slots[slotIndex].attachment = _loc10_ == null?null:param1.getAttachmentForSlotIndex(slotIndex,_loc10_);
      }
   }
}

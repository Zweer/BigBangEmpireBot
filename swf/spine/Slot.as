package spine
{
   import spine.attachments.Attachment;
   
   public class Slot
   {
       
      
      var _data:SlotData;
      
      var _bone:Bone;
      
      public var r:Number;
      
      public var g:Number;
      
      public var b:Number;
      
      public var a:Number;
      
      var _attachment:Attachment;
      
      private var _attachmentTime:Number;
      
      public var attachmentVertices:Vector.<Number>;
      
      public function Slot(param1:SlotData, param2:Bone)
      {
         attachmentVertices = new Vector.<Number>();
         super();
         if(param1 == null)
         {
            throw new ArgumentError("data cannot be null.");
         }
         if(param2 == null)
         {
            throw new ArgumentError("bone cannot be null.");
         }
         _data = param1;
         _bone = param2;
         setToSetupPose();
      }
      
      public function get data() : SlotData
      {
         return _data;
      }
      
      public function get bone() : Bone
      {
         return _bone;
      }
      
      public function get skeleton() : Skeleton
      {
         return _bone._skeleton;
      }
      
      public function get attachment() : Attachment
      {
         return _attachment;
      }
      
      public function set attachment(param1:Attachment) : void
      {
         if(_attachment == param1)
         {
            return;
         }
         _attachment = param1;
         _attachmentTime = _bone._skeleton.time;
         attachmentVertices.length = 0;
      }
      
      public function set attachmentTime(param1:Number) : void
      {
         _attachmentTime = _bone._skeleton.time - param1;
      }
      
      public function get attachmentTime() : Number
      {
         return _bone._skeleton.time - _attachmentTime;
      }
      
      public function setToSetupPose() : void
      {
         r = _data.r;
         g = _data.g;
         b = _data.b;
         a = _data.a;
         if(_data.attachmentName == null)
         {
            attachment = null;
         }
         else
         {
            _attachment = null;
            attachment = _bone._skeleton.getAttachmentForSlotIndex(data.index,data.attachmentName);
         }
      }
      
      public function toString() : String
      {
         return _data.name;
      }
   }
}

package spine
{
   import flash.utils.Dictionary;
   import spine.attachments.Attachment;
   
   public class Skin
   {
       
      
      var _name:String;
      
      private var _attachments:Vector.<Dictionary>;
      
      public function Skin(param1:String)
      {
         _attachments = new Vector.<Dictionary>();
         super();
         if(param1 == null)
         {
            throw new ArgumentError("name cannot be null.");
         }
         _name = param1;
      }
      
      public function addAttachment(param1:int, param2:String, param3:Attachment) : void
      {
         if(param3 == null)
         {
            throw new ArgumentError("attachment cannot be null.");
         }
         if(param1 >= attachments.length)
         {
            attachments.length = param1 + 1;
         }
         if(!attachments[param1])
         {
            attachments[param1] = new Dictionary();
         }
         attachments[param1][param2] = param3;
      }
      
      public function getAttachment(param1:int, param2:String) : Attachment
      {
         if(param1 >= attachments.length)
         {
            return null;
         }
         var _loc3_:Dictionary = attachments[param1];
         return !!_loc3_?_loc3_[param2]:null;
      }
      
      public function get attachments() : Vector.<Dictionary>
      {
         return _attachments;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function toString() : String
      {
         return _name;
      }
      
      public function attachAll(param1:Skeleton, param2:Skin) : void
      {
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc9_:int = 0;
         var _loc13_:int = 0;
         var _loc12_:* = param1.slots;
         for each(var _loc8_ in param1.slots)
         {
            _loc6_ = _loc8_.attachment;
            if(_loc6_ && _loc9_ < param2.attachments.length)
            {
               _loc4_ = param2.attachments[_loc9_];
               var _loc11_:int = 0;
               var _loc10_:* = _loc4_;
               for(var _loc7_ in _loc4_)
               {
                  _loc3_ = _loc4_[_loc7_];
                  if(_loc6_ == _loc3_)
                  {
                     _loc5_ = getAttachment(_loc9_,_loc7_);
                     if(_loc5_ != null)
                     {
                        _loc8_.attachment = _loc5_;
                     }
                     break;
                  }
               }
            }
            _loc9_++;
         }
      }
   }
}

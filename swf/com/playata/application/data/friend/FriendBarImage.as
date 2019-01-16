package com.playata.application.data.friend
{
   import com.playata.application.task.AppFlashTaskManager;
   import com.playata.application.task.FriendBarImageTask;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.lib.flash.FlashByteArray;
   import com.playata.framework.display.DisplayObjectFactory;
   import flash.display.BitmapData;
   
   public class FriendBarImage
   {
       
      
      private var _hash:String = null;
      
      private var _callback:Function = null;
      
      public function FriendBarImage(param1:String, param2:Function)
      {
         super();
         _hash = param1;
         _callback = param2;
      }
      
      public static function buildFromHash(param1:String, param2:Function, param3:Number = 0.75) : void
      {
         var _loc4_:FriendBarImage = new FriendBarImage(param1,param2);
         _loc4_.build(param3);
      }
      
      private static function getHashValue(param1:String, param2:String) : String
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc4_:Array = param2.split("|");
         var _loc9_:int = 0;
         var _loc8_:* = _loc4_;
         for each(var _loc6_ in _loc4_)
         {
            _loc5_ = _loc6_.split("=");
            _loc3_ = _loc5_[0] as String;
            _loc7_ = _loc5_[1] as String;
            if(_loc3_ == param1)
            {
               return _loc7_;
            }
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function build(param1:Number) : void
      {
         if(Environment.taskManager != null)
         {
            Environment.taskManager.startTask(FriendBarImageTask,null,onResult,AppFlashTaskManager.useAsyncTask,_hash,param1);
         }
      }
      
      private function onResult(param1:int, param2:IByteArray, param3:int, param4:int) : void
      {
         var _loc5_:BitmapData = new BitmapData(param3,param4);
         _loc5_.setPixels(_loc5_.rect,FlashByteArray(param2).flashByteArray);
      }
   }
}

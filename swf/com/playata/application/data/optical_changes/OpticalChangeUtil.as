package com.playata.application.data.optical_changes
{
   import com.playata.application.data.constants.COpticalChange;
   import com.playata.application.task.AppFlashTaskManager;
   import com.playata.application.task.OpticalChangeImageTask;
   import com.playata.application.ui.ViewManager;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.lib.flash.FlashByteArray;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IImage;
   import flash.display.BitmapData;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class OpticalChangeUtil
   {
      
      private static var activeTasks:Array = [];
       
      
      public function OpticalChangeUtil()
      {
         super();
      }
      
      public static function setBackground(param1:Vector.<int>, param2:SymbolDummyGeneric = null, param3:int = 0, param4:Function = null) : void
      {
         if((param1 == null || param1.length == 0) && param3 != 1)
         {
            ViewManager.instance.setBackground(param3);
            if(param2)
            {
               param2.visible = false;
            }
            return;
         }
         ViewManager.instance.setBackground(22);
         var _loc5_:int = Environment.taskManager.startTask(OpticalChangeImageTask,null,onResult,AppFlashTaskManager.useAsyncTask,param1);
         activeTasks.push([_loc5_,param2,param4]);
      }
      
      private static function onResult(param1:int, param2:IByteArray, param3:int, param4:int) : void
      {
         var _loc8_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc9_:SymbolDummyGeneric = null;
         var _loc7_:Function = null;
         _loc8_ = 0;
         while(_loc8_ < activeTasks.length)
         {
            if(activeTasks[_loc8_][0] == param1)
            {
               _loc9_ = activeTasks[_loc8_][1];
               _loc7_ = activeTasks[_loc8_][2];
               activeTasks.splice(_loc8_,1);
               break;
            }
            _loc8_++;
         }
         if(_loc9_ == null && _loc7_ == null)
         {
            return;
         }
         try
         {
            _loc6_ = new BitmapData(param3,param4);
            _loc6_.setPixels(_loc6_.rect,FlashByteArray(param2).flashByteArray);
            _loc5_ = DisplayObjectFactory.createImageFromBitmapData(_loc6_);
            if(!_loc5_)
            {
               return;
            }
            if(_loc9_)
            {
               _loc9_.visible = true;
               _loc5_.tweenFrom(0.5,{"alpha":0});
               try
               {
                  _loc9_.removeAllChildren(true);
                  _loc9_.addChild(_loc5_);
               }
               catch(e:Error)
               {
               }
            }
            if(_loc7_)
            {
               _loc7_(_loc5_);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public static function getDefaultIdentifierForType(param1:int) : String
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = COpticalChange.ids;
         for each(var _loc3_ in COpticalChange.ids)
         {
            _loc2_ = COpticalChange.fromId(_loc3_);
            if(_loc2_.type == param1 && _loc2_.defaultValue)
            {
               return _loc2_.identifier;
            }
         }
         return "";
      }
      
      public static function replaceOpticalChange(param1:Vector.<int>, param2:int) : Vector.<int>
      {
         var _loc5_:int = COpticalChange.fromId(param2).type;
         var _loc4_:Vector.<int> = new Vector.<int>(0);
         if(param1)
         {
            var _loc7_:int = 0;
            var _loc6_:* = param1;
            for each(var _loc3_ in param1)
            {
               if(COpticalChange.fromId(_loc3_).type == _loc5_)
               {
                  _loc4_.push(param2);
               }
               else
               {
                  _loc4_.push(_loc3_);
               }
            }
         }
         else
         {
            _loc4_.push(param2);
         }
         return _loc4_;
      }
   }
}

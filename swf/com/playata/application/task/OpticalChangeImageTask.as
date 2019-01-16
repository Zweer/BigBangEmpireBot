package com.playata.application.task
{
   import com.playata.application.data.optical_changes.OpticalChangeUtil;
   import com.playata.application.task.assets.UriDisplayObjectAsset;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.core.lib.flash.FlashTimer;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.display.flash.FlashDisplayUtil;
   import com.playata.framework.task.Task;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class OpticalChangeImageTask extends Task
   {
      
      private static var BACKGROUND_LAYER:Array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19];
       
      
      private var _timer:ITimer;
      
      private var _target:Sprite;
      
      private var _uriSprites:Vector.<UriDisplayObjectAsset>;
      
      public function OpticalChangeImageTask(param1:int, param2:Function, param3:Function, param4:Function)
      {
         _uriSprites = new Vector.<UriDisplayObjectAsset>();
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         super.dispose();
         _timer.dispose();
         _timer = null;
         _target = null;
         _loc1_ = 0;
         while(_loc1_ < _uriSprites.length)
         {
            !_uriSprites[_loc1_].dispose();
            _loc1_++;
         }
         _uriSprites = null;
      }
      
      override public function start(... rest) : void
      {
         var _loc6_:int = 0;
         var _loc10_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _target = new Sprite();
         var _loc5_:Object = rest[0];
         var _loc7_:Object = Constants.current.constant("optical_changes");
         var _loc11_:int = 630;
         var _loc9_:String = "optical_changes/";
         _loc6_ = 0;
         while(_loc6_ < BACKGROUND_LAYER.length)
         {
            _loc10_ = BACKGROUND_LAYER[_loc6_];
            _loc4_ = "png";
            _loc2_ = null;
            if(_loc5_)
            {
               var _loc13_:int = 0;
               var _loc12_:* = _loc5_;
               for each(var _loc8_ in _loc5_)
               {
                  if(_loc7_[_loc8_]["type"] == _loc10_)
                  {
                     _loc2_ = _loc7_[_loc8_]["identifier"];
                     break;
                  }
               }
            }
            if(!_loc2_)
            {
               _loc2_ = OpticalChangeUtil.getDefaultIdentifierForType(_loc10_);
            }
            _loc3_ = UriDisplayObjectAsset.load(Assets.assetURL(_loc9_ + _loc2_,_loc4_),1120,_loc11_,false,-1,null,false,false,false,false);
            _uriSprites.push(_loc3_);
            _target.addChild(_loc3_);
            _loc6_++;
         }
         _timer = new FlashTimer("OpticalChangeImageTask::checkLoaded",50,checkLoaded);
         _timer.start();
      }
      
      private function checkLoaded() : void
      {
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc5_:Boolean = true;
         _loc4_ = 0;
         while(_loc4_ < _uriSprites.length)
         {
            if(!_uriSprites[_loc4_].isCompleted)
            {
               _loc5_ = false;
               break;
            }
            _loc4_++;
         }
         if(_loc5_)
         {
            _timer.stop();
            _loc1_ = 1120;
            _loc2_ = 630;
            _loc3_ = new Rectangle(0,0,_loc1_,_loc2_);
            sendResultByteArray(FlashDisplayUtil.getFlashDisplayObjectAsByteArray(_target,1,_loc3_),_loc1_,_loc2_);
         }
      }
   }
}

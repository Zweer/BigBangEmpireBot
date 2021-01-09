package com.playata.framework.core
{
   import com.greensock.TweenMax;
   import com.playata.framework.core.logging.Logger;
   import flash.external.ExternalInterface;
   import flash.utils.clearTimeout;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import starling.utils.SystemUtil;
   
   public final class Runtime
   {
       
      
      public function Runtime()
      {
         super();
      }
      
      public static function get isDesktop() : Boolean
      {
         return SystemUtil.isDesktop;
      }
      
      public static function newInstance(param1:Class, param2:Array) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:Array = param2 == null?[]:param2;
         switch(int(_loc4_.length) - 1)
         {
            case 0:
               _loc3_ = new param1(_loc4_[0]);
               break;
            case 1:
               _loc3_ = new param1(_loc4_[0],_loc4_[1]);
               break;
            case 2:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2]);
               break;
            case 3:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3]);
               break;
            case 4:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4]);
               break;
            case 5:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5]);
               break;
            case 6:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6]);
               break;
            case 7:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7]);
               break;
            case 8:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8]);
               break;
            case 9:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9]);
         }
         return _loc3_;
      }
      
      public static function callMethod(param1:*, param2:Function, param3:Array = null) : *
      {
         return param2.apply(param1,param3);
      }
      
      public static function delayFunction(param1:Function, param2:Number, param3:Array = null) : void
      {
         TweenMax.delayedCall(param2,param1,param3);
      }
      
      public static function killDelayedFunction(param1:Function) : void
      {
         TweenMax.killDelayedCallsTo(param1);
      }
      
      public static function callJavaScript(param1:String, param2:Array = null) : *
      {
         if(!ExternalInterface.available)
         {
            return;
         }
         try
         {
            Logger.debug("[Runtime] Making call to external interface: " + param1 + "...");
            if(param2 === null)
            {
               param2 = [];
            }
            param2.unshift(param1);
            var _loc4_:* = ExternalInterface.call.apply(null,param2);
            return _loc4_;
         }
         catch(e:SecurityError)
         {
            Logger.error("[Runtime] Making call to external interface " + param1 + " failed. Error: " + e.toString());
            return;
         }
      }
      
      public static function addJavaScriptCallback(param1:String, param2:Function) : void
      {
         if(!ExternalInterface.available)
         {
            return;
         }
         try
         {
            Logger.debug("[Runtime] Adding JavaScript callback: " + param1 + "...");
            ExternalInterface.addCallback(param1,param2);
            return;
         }
         catch(e:SecurityError)
         {
            Logger.error("[Runtime] Adding JavaScript callback " + param1 + " failed. Error: " + e.toString());
            return;
         }
      }
      
      public static function getClassName(param1:Object, param2:Boolean = true) : String
      {
         var _loc3_:String = getQualifiedClassName(param1);
         if(param2)
         {
            return _loc3_;
         }
         return _loc3_.substring(_loc3_.indexOf("::") + 2);
      }
      
      public static function getClass(param1:String) : Class
      {
         return getDefinitionByName(param1) as Class;
      }
      
      public static function getTimer() : int
      {
         return getTimer();
      }
      
      public static function setTimeout(param1:Function, param2:Number) : uint
      {
         return setTimeout(param1,param2);
      }
      
      public static function clearTimeout(param1:uint) : void
      {
         return clearTimeout(param1);
      }
      
      public static function setProperty(param1:Object, param2:String, param3:*) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1[param2] = param3;
      }
      
      public static function getProperty(param1:Object, param2:String) : *
      {
         if(param1 == null)
         {
            return null;
         }
         return param1[param2];
      }
   }
}

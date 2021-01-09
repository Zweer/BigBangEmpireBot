package com.playata.framework.display.layout
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.DisplayCore;
   import com.playata.framework.display.DisplayCoreConfig;
   import flash.display.Stage;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class LayoutUtil
   {
      
      private static var _nativeStage:Stage;
      
      private static var _nativeWidth:int;
      
      private static var _nativeHeight:int;
      
      private static var _verifyRect:Point = new Point();
       
      
      public function LayoutUtil()
      {
         super();
      }
      
      public static function init(param1:Stage) : void
      {
         _nativeStage = param1;
         _nativeWidth = !!Runtime.isDesktop?_nativeStage.stageWidth:_nativeStage.fullScreenWidth;
         _nativeHeight = !!Runtime.isDesktop?_nativeStage.stageHeight:_nativeStage.fullScreenHeight;
         Logger.debug("[Environment] Initializing LayoutUtil: " + _nativeWidth + "x" + _nativeHeight);
      }
      
      public static function get fullScreenViewport() : Rectangle
      {
         return new Rectangle(0,0,_nativeWidth,_nativeHeight);
      }
      
      public static function get nativeWidth() : int
      {
         return _nativeWidth;
      }
      
      public static function get nativeHeight() : int
      {
         return _nativeHeight;
      }
      
      public static function verifyRectInScreen(param1:Rectangle, param2:Number, param3:Rectangle = null) : Point
      {
         if(param1.x < param2)
         {
            param1.x = param2;
         }
         if(param1.y < param2)
         {
            param1.y = param2;
         }
         if(param3)
         {
            if(param1.x + param1.width > param3.width - param2)
            {
               param1.x = param3.width - param2 - param1.width;
            }
            if(param1.y + param1.height > param3.height - param2)
            {
               param1.y = param3.height - param2 - param1.height;
            }
         }
         else
         {
            if(param1.x + param1.width > DisplayCoreConfig.layout.appWidth - param2)
            {
               param1.x = DisplayCoreConfig.layout.appWidth - param2 - param1.width;
            }
            if(param1.y + param1.height > DisplayCoreConfig.layout.appHeight - param2)
            {
               param1.y = DisplayCoreConfig.layout.appHeight - param2 - param1.height;
            }
         }
         _verifyRect.x = param1.x;
         _verifyRect.y = param1.y;
         return _verifyRect;
      }
      
      public static function get isWidthAdjustedFormat() : Boolean
      {
         var _loc1_:ILayout = DisplayCoreConfig.layout;
         if(!_loc1_.allowResize)
         {
            return true;
         }
         var _loc2_:Number = _loc1_.appDefaultHeight / _loc1_.appDefaultWidth;
         var _loc3_:Rectangle = new Rectangle();
         _loc3_.width = LayoutUtil.nativeWidth;
         _loc3_.height = Math.round(_loc3_.width * _loc2_);
         return _loc3_.height > LayoutUtil.nativeHeight;
      }
      
      public static function get deviceAdjustedAppSize() : Rectangle
      {
         var _loc1_:ILayout = DisplayCoreConfig.layout;
         if(!_loc1_.allowResize)
         {
            return new Rectangle(0,0,_loc1_.appDefaultWidth,_loc1_.appDefaultHeight);
         }
         var _loc2_:Boolean = isWidthAdjustedFormat;
         var _loc4_:Number = !!Runtime.isDesktop?LayoutUtil.nativeWidth:_loc1_.appDefaultWidth;
         var _loc3_:Number = LayoutUtil.nativeHeight / (LayoutUtil.nativeWidth / _loc4_);
         if(_loc2_)
         {
            _loc3_ = !!Runtime.isDesktop?LayoutUtil.nativeHeight:_loc1_.appDefaultHeight;
            _loc4_ = LayoutUtil.nativeWidth / (LayoutUtil.nativeHeight / _loc3_);
         }
         return new Rectangle(0,0,_loc4_,_loc3_);
      }
      
      public static function get deviceAdjustedWidthCorrection() : Number
      {
         var _loc1_:ILayout = DisplayCoreConfig.layout;
         if(!_loc1_.allowResize)
         {
            return 0;
         }
         return deviceAdjustedAppSize.width - _loc1_.appDefaultWidth;
      }
      
      public static function get deviceAdjustedHeightCorrection() : Number
      {
         var _loc1_:ILayout = DisplayCoreConfig.layout;
         if(!_loc1_.allowResize)
         {
            return 0;
         }
         return deviceAdjustedAppSize.height - _loc1_.appDefaultHeight;
      }
      
      public static function get deviceAdjustedSoftKeyboardHeight() : uint
      {
         var _loc2_:Number = LayoutUtil.nativeHeight / DisplayCoreConfig.layout.appHeight;
         var _loc1_:int = Math.round(DisplayCore.current.displayContext.softKeyboardRect.height / _loc2_);
         return _loc1_;
      }
      
      public static function get isPhoneLayout() : Boolean
      {
         return false;
      }
      
      public static function getScaleFactor(param1:Number) : Number
      {
         return 1;
      }
   }
}

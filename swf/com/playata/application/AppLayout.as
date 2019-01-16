package com.playata.application
{
   import com.playata.framework.display.layout.ILayout;
   import com.playata.framework.display.layout.LayoutScaleMode;
   import com.playata.framework.display.layout.Orientation;
   
   public class AppLayout implements ILayout
   {
      
      public static const DEFAULT_APP_WIDTH:uint = 1120;
      
      public static const DEFAULT_APP_HEIGHT:uint = 630;
      
      public static const FRIENDBAR_HEIGHT:uint = 125;
       
      
      private var _appWidth:uint = 1120;
      
      private var _appHeight:uint = 630;
      
      private var _allowResize:Boolean = false;
      
      public function AppLayout(param1:Boolean)
      {
         super();
         _allowResize = param1;
      }
      
      public static function get friendbarCorrection() : int
      {
         return 125;
      }
      
      public function get activeVariation() : String
      {
         return "default_landscape";
      }
      
      public function set activeVariation(param1:String) : void
      {
      }
      
      public function get variations() : Vector.<String>
      {
         return new <String>["default_landscape"];
      }
      
      public function get orientation() : Orientation
      {
         return Orientation.LANDSCAPE_LEFT;
      }
      
      public function onOrientationChanging(param1:Orientation) : Boolean
      {
         return param1 == Orientation.LANDSCAPE_LEFT || param1 == Orientation.LANDSCAPE_RIGHT;
      }
      
      public function onOrientationChange(param1:Orientation) : void
      {
      }
      
      public function get appWidth() : uint
      {
         return _appWidth;
      }
      
      public function set appWidth(param1:uint) : void
      {
         _appWidth = param1;
      }
      
      public function get appHeight() : uint
      {
         return _appHeight;
      }
      
      public function set appHeight(param1:uint) : void
      {
         _appHeight = param1;
      }
      
      public function get allowResize() : Boolean
      {
         return _allowResize;
      }
      
      public function get keepAspectRatio() : Boolean
      {
         return false;
      }
      
      public function get scaleMode() : LayoutScaleMode
      {
         return LayoutScaleMode.NONE;
      }
      
      public function get appDefaultWidth() : uint
      {
         return 1120;
      }
      
      public function get appDefaultHeight() : uint
      {
         return 630;
      }
   }
}

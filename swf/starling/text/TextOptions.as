package starling.text
{
   import flash.text.StyleSheet;
   import starling.core.Starling;
   import starling.events.EventDispatcher;
   
   public class TextOptions extends EventDispatcher
   {
       
      
      private var _wordWrap:Boolean;
      
      private var _autoScale:Boolean;
      
      private var _autoSize:String;
      
      private var _isHtmlText:Boolean;
      
      private var _textureScale:Number;
      
      private var _textureFormat:String;
      
      private var _styleSheet:StyleSheet;
      
      private var _padding:Number;
      
      public function TextOptions(param1:Boolean = true, param2:Boolean = false)
      {
         super();
         _wordWrap = param1;
         _autoScale = param2;
         _autoSize = "none";
         _textureScale = Starling.contentScaleFactor;
         _textureFormat = TextField.defaultTextureFormat;
         _isHtmlText = false;
         _padding = 0;
      }
      
      public function copyFrom(param1:TextOptions) : void
      {
         _wordWrap = param1._wordWrap;
         _autoScale = param1._autoScale;
         _autoSize = param1._autoSize;
         _isHtmlText = param1._isHtmlText;
         _textureScale = param1._textureScale;
         _textureFormat = param1._textureFormat;
         _styleSheet = param1._styleSheet;
         _padding = param1._padding;
         dispatchEventWith("change");
      }
      
      public function clone() : TextOptions
      {
         var _loc2_:Class = Object(this).constructor as Class;
         var _loc1_:TextOptions = new _loc2_() as TextOptions;
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      public function get wordWrap() : Boolean
      {
         return _wordWrap;
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         if(_wordWrap != param1)
         {
            _wordWrap = param1;
            dispatchEventWith("change");
         }
      }
      
      public function get autoSize() : String
      {
         return _autoSize;
      }
      
      public function set autoSize(param1:String) : void
      {
         if(_autoSize != param1)
         {
            _autoSize = param1;
            dispatchEventWith("change");
         }
      }
      
      public function get autoScale() : Boolean
      {
         return _autoScale;
      }
      
      public function set autoScale(param1:Boolean) : void
      {
         if(_autoScale != param1)
         {
            _autoScale = param1;
            dispatchEventWith("change");
         }
      }
      
      public function get isHtmlText() : Boolean
      {
         return _isHtmlText;
      }
      
      public function set isHtmlText(param1:Boolean) : void
      {
         if(_isHtmlText != param1)
         {
            _isHtmlText = param1;
            dispatchEventWith("change");
         }
      }
      
      public function get styleSheet() : StyleSheet
      {
         return _styleSheet;
      }
      
      public function set styleSheet(param1:StyleSheet) : void
      {
         _styleSheet = param1;
         dispatchEventWith("change");
      }
      
      public function get textureScale() : Number
      {
         return _textureScale;
      }
      
      public function set textureScale(param1:Number) : void
      {
         _textureScale = param1;
      }
      
      public function get textureFormat() : String
      {
         return _textureFormat;
      }
      
      public function set textureFormat(param1:String) : void
      {
         if(_textureFormat != param1)
         {
            _textureFormat = param1;
            dispatchEventWith("change");
         }
      }
      
      public function get padding() : Number
      {
         return _padding;
      }
      
      public function set padding(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(_padding != param1)
         {
            _padding = param1;
            dispatchEventWith("change");
         }
      }
   }
}

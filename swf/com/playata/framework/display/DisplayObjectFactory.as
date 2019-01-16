package com.playata.framework.display
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.particle.IParticleEffect;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.IRichLabel;
   import com.playata.framework.display.ui.controls.IRichLabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import com.playata.framework.display.ui.controls.TextFieldFormat;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public final class DisplayObjectFactory
   {
      
      private static var _displayObjectFactory:IDisplayObjectFactory;
       
      
      public function DisplayObjectFactory()
      {
         super();
      }
      
      public static function set displayObjectFactory(param1:IDisplayObjectFactory) : void
      {
         _displayObjectFactory = param1;
      }
      
      public static function get displayObjectFactory() : IDisplayObjectFactory
      {
         return _displayObjectFactory;
      }
      
      public static function createSpriteFromSettings(param1:Object = null) : ISprite
      {
         return _displayObjectFactory.createSpriteFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createUriSpriteFromSettings(param1:Object = null) : IUriSprite
      {
         return _displayObjectFactory.createUriSpriteFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createQuadFromSettings(param1:Object = null) : IQuad
      {
         return _displayObjectFactory.createQuadFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createImage(param1:String) : IImage
      {
         return DisplayObjectFactory.createImageFromSettings({"texture":param1});
      }
      
      public static function createImageFromBitmap(param1:Bitmap) : IImage
      {
         return _displayObjectFactory.createImageFromBitmap(param1);
      }
      
      public static function createImageFromBitmapData(param1:BitmapData) : IImage
      {
         return _displayObjectFactory.createImageFromBitmapData(param1);
      }
      
      public static function createImageFromSettings(param1:Object = null) : IImage
      {
         return _displayObjectFactory.createImageFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createAnimatedImageFromSettings(param1:Object = null) : IAnimatedImage
      {
         return _displayObjectFactory.createAnimatedImageFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createMovieClipFromSettings(param1:Object = null) : IMovieClip
      {
         return _displayObjectFactory.createMovieClipFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createParticleEffectFromSettings(param1:Object = null) : IParticleEffect
      {
         return _displayObjectFactory.createParticleEffectFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createLabel(param1:int, param2:int, param3:int, param4:int, param5:String, param6:TextFieldFormat) : ILabel
      {
         return DisplayObjectFactory.createLabelFromSettings(getSettingsFromTextField(param1,param2,param3,param4,param5,param6));
      }
      
      public static function createLabelFromSettings(param1:Object = null) : ILabel
      {
         return _displayObjectFactory.createLabelFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createLabelArea(param1:int, param2:int, param3:int, param4:int, param5:String, param6:TextFieldFormat) : ILabelArea
      {
         return DisplayObjectFactory.createLabelAreaFromSettings(getSettingsFromTextField(param1,param2,param3,param4,param5,param6));
      }
      
      public static function createLabelAreaFromSettings(param1:Object = null) : ILabelArea
      {
         return _displayObjectFactory.createLabelAreaFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createRichLabel(param1:String, param2:int, param3:int, param4:int, param5:int, param6:String, param7:TextFieldFormat) : IRichLabel
      {
         return DisplayObjectFactory.createRichLabelFromSettings(getSettingsFromTextField(param2,param3,param4,param5,param6,param7,new TypedObject({"id":param1})));
      }
      
      public static function createRichLabelFromSettings(param1:Object = null) : IRichLabel
      {
         return _displayObjectFactory.createRichLabelFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createRichLabelArea(param1:String, param2:int, param3:int, param4:int, param5:int, param6:String, param7:TextFieldFormat) : IRichLabelArea
      {
         return DisplayObjectFactory.createRichLabelAreaFromSettings(getSettingsFromTextField(param2,param3,param4,param5,param6,param7,new TypedObject({"id":param1})));
      }
      
      public static function createRichLabelAreaFromSettings(param1:Object = null) : IRichLabelArea
      {
         return _displayObjectFactory.createRichLabelAreaFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createTextInput(param1:int, param2:int, param3:int, param4:int, param5:TextFieldFormat) : ITextInput
      {
         return DisplayObjectFactory.createTextInputFromSettings(getSettingsFromTextField(param1,param2,param3,param4,"",param5));
      }
      
      public static function createTextInputFromSettings(param1:Object = null) : ITextInput
      {
         return _displayObjectFactory.createTextInputFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createTextInputArea(param1:int, param2:int, param3:int, param4:int, param5:TextFieldFormat) : ITextInputArea
      {
         return DisplayObjectFactory.createTextInputAreaFromSettings(getSettingsFromTextField(param1,param2,param3,param4,"",param5));
      }
      
      public static function createTextInputAreaFromSettings(param1:Object = null) : ITextInputArea
      {
         return _displayObjectFactory.createTextInputAreaFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createSpineDisplayObjectFromSettings(param1:Object = null) : ISpineDisplayObject
      {
         return _displayObjectFactory.createSpineDisplayObjectFromSettings(param1 is TypedObject?param1 as TypedObject:new TypedObject(param1));
      }
      
      public static function createInteractionHandler(param1:IInteractiveDisplayObject) : IInteractionHandler
      {
         return _displayObjectFactory.createInteractionHandler(param1);
      }
      
      private static function getSettingsFromTextField(param1:int, param2:int, param3:int, param4:int, param5:String, param6:TextFieldFormat, param7:TypedObject = null) : TypedObject
      {
         var _loc8_:TypedObject = new TypedObject({
            "x":param1,
            "y":param2,
            "width":param3,
            "height":param4,
            "fontName":param6.fontName,
            "fontSize":param6.fontSize,
            "color":param6.color,
            "bold":param6.bold,
            "hAlign":param6.hAlign,
            "vAlign":param6.vAlign,
            "autoFontSize":param6.autoFontSize
         });
         if(param5 !== null)
         {
            _loc8_.setString("text",param5);
         }
         if(param7 !== null)
         {
            _loc8_.extend(param7);
         }
         return _loc8_;
      }
   }
}

package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IAnimatedImage;
   import com.playata.framework.display.IDisplayObjectFactory;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.IInteractionHandler;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.IMovieClip;
   import com.playata.framework.display.IQuad;
   import com.playata.framework.display.ISpineDisplayObject;
   import com.playata.framework.display.ISprite;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.particle.IParticleEffect;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.IRichLabel;
   import com.playata.framework.display.ui.controls.IRichLabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class FlashDisplayObjectFactory implements IDisplayObjectFactory
   {
       
      
      public function FlashDisplayObjectFactory()
      {
         super();
      }
      
      public function createSpriteFromSettings(param1:TypedObject = null) : ISprite
      {
         return new FlashSprite(param1);
      }
      
      public function createUriSpriteFromSettings(param1:TypedObject = null) : IUriSprite
      {
         return new FlashUriSprite(param1);
      }
      
      public function createQuadFromSettings(param1:TypedObject = null) : IQuad
      {
         return new FlashQuad(param1);
      }
      
      public function createImageFromBitmap(param1:Bitmap) : IImage
      {
         return FlashImage.fromBitmap(param1);
      }
      
      public function createImageFromBitmapData(param1:BitmapData) : IImage
      {
         return FlashImage.fromBitmapData(param1);
      }
      
      public function createImageFromSettings(param1:TypedObject = null) : IImage
      {
         return new FlashImage(param1);
      }
      
      public function createAnimatedImageFromSettings(param1:TypedObject = null) : IAnimatedImage
      {
         return null;
      }
      
      public function createMovieClipFromSettings(param1:TypedObject = null) : IMovieClip
      {
         return new FlashMovieClip(param1);
      }
      
      public function createParticleEffectFromSettings(param1:TypedObject = null) : IParticleEffect
      {
         return null;
      }
      
      public function createLabelFromSettings(param1:TypedObject = null) : ILabel
      {
         return new FlashLabel(param1);
      }
      
      public function createLabelAreaFromSettings(param1:TypedObject = null) : ILabelArea
      {
         return new FlashLabelArea(param1);
      }
      
      public function createRichLabelFromSettings(param1:TypedObject = null) : IRichLabel
      {
         return new FlashRichLabel(param1);
      }
      
      public function createRichLabelAreaFromSettings(param1:TypedObject = null) : IRichLabelArea
      {
         return new FlashRichLabelArea(param1);
      }
      
      public function createTextInputFromSettings(param1:TypedObject = null) : ITextInput
      {
         return new FlashTextInput(param1);
      }
      
      public function createTextInputAreaFromSettings(param1:TypedObject = null) : ITextInputArea
      {
         return new FlashTextInputArea(param1);
      }
      
      public function createSpineDisplayObjectFromSettings(param1:TypedObject = null) : ISpineDisplayObject
      {
         return new FlashSpineDisplayObject(param1);
      }
      
      public function createInteractionHandler(param1:IInteractiveDisplayObject) : IInteractionHandler
      {
         return new FlashInteractionHandler(param1);
      }
   }
}

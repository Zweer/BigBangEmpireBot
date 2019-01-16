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
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public interface IDisplayObjectFactory
   {
       
      
      function createSpriteFromSettings(param1:TypedObject = null) : ISprite;
      
      function createUriSpriteFromSettings(param1:TypedObject = null) : IUriSprite;
      
      function createQuadFromSettings(param1:TypedObject = null) : IQuad;
      
      function createImageFromBitmap(param1:Bitmap) : IImage;
      
      function createImageFromBitmapData(param1:BitmapData) : IImage;
      
      function createImageFromSettings(param1:TypedObject = null) : IImage;
      
      function createAnimatedImageFromSettings(param1:TypedObject = null) : IAnimatedImage;
      
      function createMovieClipFromSettings(param1:TypedObject = null) : IMovieClip;
      
      function createParticleEffectFromSettings(param1:TypedObject = null) : IParticleEffect;
      
      function createLabelFromSettings(param1:TypedObject = null) : ILabel;
      
      function createLabelAreaFromSettings(param1:TypedObject = null) : ILabelArea;
      
      function createRichLabelFromSettings(param1:TypedObject = null) : IRichLabel;
      
      function createRichLabelAreaFromSettings(param1:TypedObject = null) : IRichLabelArea;
      
      function createTextInputFromSettings(param1:TypedObject = null) : ITextInput;
      
      function createTextInputAreaFromSettings(param1:TypedObject = null) : ITextInputArea;
      
      function createSpineDisplayObjectFromSettings(param1:TypedObject = null) : ISpineDisplayObject;
      
      function createInteractionHandler(param1:IInteractiveDisplayObject) : IInteractionHandler;
   }
}

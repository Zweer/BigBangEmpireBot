package com.playata.application.ui.elements.movie
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Expo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.input.InteractionEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import visuals.ui.base.SymbolBlockerAnimationGeneric;
   import visuals.ui.elements.movie.SymbolCoverImagePlaceholderGeneric;
   
   public class UiMovieCover
   {
      
      private static const DUMMY_COVER:BitmapData = new MovieCoverDummyBitmapData();
       
      
      private var _placeHolder:SymbolCoverImagePlaceholderGeneric;
      
      private var _loaderAnimation:SymbolBlockerAnimationGeneric;
      
      private var _placeHolderLayer:InteractiveDisplayObject = null;
      
      private var _scale:Number;
      
      private var _dummyCover:IImage;
      
      private var _oldRotation:Number;
      
      private var _oldIndex:int;
      
      private var _eventListenerAdded:Boolean = false;
      
      private var _movieCover:MovieCover = null;
      
      private var _toggleOver:Boolean = false;
      
      public function UiMovieCover(param1:SymbolCoverImagePlaceholderGeneric, param2:Boolean = false)
      {
         super();
         _placeHolder = param1;
         _placeHolderLayer = new InteractiveDisplayObject(_placeHolder);
         param1.removeAllChildren();
         _scale = param1.scaleX;
         _movieCover = new MovieCover();
         _loaderAnimation = new SymbolBlockerAnimationGeneric();
         _loaderAnimation.x = _movieCover.width * 0.5;
         _loaderAnimation.y = _movieCover.height * 0.5;
      }
      
      public function showWithSettings(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            showDummyCover();
         }
         else
         {
            showPreview(param1);
         }
      }
      
      private function showDummyCover() : void
      {
         var _loc1_:* = null;
         removeEventListener();
         if(!_dummyCover)
         {
            _loc1_ = new Bitmap(DUMMY_COVER);
            _loc1_.smoothing = true;
            _dummyCover = DisplayObjectFactory.createImageFromBitmap(_loc1_);
         }
         _placeHolder.removeAllChildren();
         _loaderAnimation.visible = false;
         _placeHolder.addChild(_dummyCover);
      }
      
      private function onOut(param1:InteractionEvent) : void
      {
         _placeHolder.parent.setChildIndex(_placeHolder,_oldIndex);
         _placeHolder.killTweens();
         _placeHolder.getChildAt(0).tweenTo(0.2,{
            "scaleX":1,
            "scaleY":1,
            "rotation":0,
            "x":0,
            "y":0,
            "ease":Expo.easeOut
         });
      }
      
      private function onOver(param1:InteractionEvent) : void
      {
         _placeHolder.killTweens();
         _placeHolder.bringToTop();
         _oldRotation = _placeHolder.rotation;
         var _loc3_:int = _movieCover.width - _movieCover.width * _scale;
         var _loc2_:int = _movieCover.height - _movieCover.height * _scale;
         _placeHolder.getChildAt(0).tweenTo(0.4,{
            "scaleX":1 / _scale,
            "scaleY":1 / _scale,
            "rotation":-_oldRotation,
            "x":-_loc3_,
            "y":-_loc2_,
            "ease":Back.easeOut
         });
      }
      
      private function onToggle(param1:InteractionEvent) : void
      {
         _toggleOver = !_toggleOver;
         if(_toggleOver)
         {
            onOver(null);
         }
         else
         {
            onOut(null);
         }
      }
      
      private function addEventListener() : void
      {
         if(!_eventListenerAdded && _scale < 1)
         {
            if(Environment.info.isTouchScreen)
            {
               _placeHolderLayer.onClick.add(onToggle);
            }
            else
            {
               _placeHolderLayer.onInteractionOver.add(onOver);
               _placeHolderLayer.onInteractionOut.add(onOut);
            }
            _eventListenerAdded = true;
            _oldIndex = _placeHolder.parent.getChildIndex(_placeHolder);
         }
      }
      
      private function removeEventListener() : void
      {
         if(_eventListenerAdded)
         {
            _eventListenerAdded = false;
            if(Environment.info.isTouchScreen)
            {
               _placeHolderLayer.onClick.removeAll();
            }
            else
            {
               _placeHolderLayer.onInteractionOver.removeAll();
               _placeHolderLayer.onInteractionOut.removeAll();
            }
         }
      }
      
      private function showPreview(param1:String) : void
      {
         if(_loaderAnimation.parent == _placeHolder)
         {
            _placeHolder.removeChild(_loaderAnimation);
         }
         _placeHolder.removeAllChildren(true);
         _placeHolder.addChild(_loaderAnimation);
         _loaderAnimation.visible = true;
         if(_movieCover.preview != null)
         {
            _movieCover.preview.visible = false;
         }
         _movieCover.generateFromCompressedSettings(param1,completePreviewGeneration);
      }
      
      private function completePreviewGeneration() : void
      {
         if(_movieCover.preview != null)
         {
            _placeHolder.addChild(FlashSprite.fromNative(_movieCover.preview));
         }
         _loaderAnimation.visible = false;
         if(_loaderAnimation.parent == _placeHolder)
         {
            _placeHolder.removeChild(_loaderAnimation);
         }
         if(_movieCover.preview != null)
         {
            _movieCover.preview.visible = true;
         }
         addEventListener();
      }
   }
}

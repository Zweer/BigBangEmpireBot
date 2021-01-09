package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonStreamingBuyLikesGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolStreamingActorAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamingActorAnimation = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var iconPose:SymbolPlaceholderGeneric = null;
      
      public var btnUnlock:SymbolButtonStreamingBuyLikesGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public var iconExclamationMark:SymbolIconExclamationMarkGeneric = null;
      
      public function SymbolStreamingActorAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingActorAnimation;
         }
         else
         {
            _nativeObject = new SymbolStreamingActorAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         iconPose = new SymbolPlaceholderGeneric(_nativeObject.iconPose);
         btnUnlock = new SymbolButtonStreamingBuyLikesGeneric(_nativeObject.btnUnlock);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
         iconExclamationMark = new SymbolIconExclamationMarkGeneric(_nativeObject.iconExclamationMark);
      }
      
      public function setNativeInstance(param1:SymbolStreamingActorAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.iconPose)
         {
            iconPose.setNativeInstance(_nativeObject.iconPose);
         }
         if(_nativeObject.btnUnlock)
         {
            btnUnlock.setNativeInstance(_nativeObject.btnUnlock);
         }
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
         if(_nativeObject.iconExclamationMark)
         {
            iconExclamationMark.setNativeInstance(_nativeObject.iconExclamationMark);
         }
      }
   }
}

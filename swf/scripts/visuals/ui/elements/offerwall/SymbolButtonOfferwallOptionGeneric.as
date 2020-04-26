package visuals.ui.elements.offerwall
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolButtonOfferwallOptionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonOfferwallOption = null;
      
      public var background:SymbolBackgroundScalableGeneric = null;
      
      public var image:SymbolPlaceholderGeneric = null;
      
      public function SymbolButtonOfferwallOptionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonOfferwallOption;
         }
         else
         {
            _nativeObject = new SymbolButtonOfferwallOption();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolBackgroundScalableGeneric(_nativeObject.background);
         image = new SymbolPlaceholderGeneric(_nativeObject.image);
      }
      
      public function setNativeInstance(param1:SymbolButtonOfferwallOption) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.image)
         {
            image.setNativeInstance(_nativeObject.image);
         }
      }
   }
}

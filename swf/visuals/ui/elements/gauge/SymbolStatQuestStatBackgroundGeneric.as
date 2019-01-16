package visuals.ui.elements.gauge
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolStatQuestStatBackgroundGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStatQuestStatBackground = null;
      
      public var background:SymbolBackgroundScalableGeneric = null;
      
      public function SymbolStatQuestStatBackgroundGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStatQuestStatBackground;
         }
         else
         {
            _nativeObject = new SymbolStatQuestStatBackground();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolBackgroundScalableGeneric(_nativeObject.background);
      }
      
      public function setNativeInstance(param1:SymbolStatQuestStatBackground) : void
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
      }
   }
}

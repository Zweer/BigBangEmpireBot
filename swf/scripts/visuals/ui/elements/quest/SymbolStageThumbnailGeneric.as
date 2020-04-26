package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolStageThumbnailGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStageThumbnail = null;
      
      public var location:SymbolPlaceholderGeneric = null;
      
      public function SymbolStageThumbnailGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStageThumbnail;
         }
         else
         {
            _nativeObject = new SymbolStageThumbnail();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         location = new SymbolPlaceholderGeneric(_nativeObject.location);
      }
      
      public function setNativeInstance(param1:SymbolStageThumbnail) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.location)
         {
            location.setNativeInstance(_nativeObject.location);
         }
      }
   }
}

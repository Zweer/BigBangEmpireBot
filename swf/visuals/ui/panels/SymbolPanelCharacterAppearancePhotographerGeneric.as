package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorPhotographerContentGeneric;
   
   public class SymbolPanelCharacterAppearancePhotographerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelCharacterAppearancePhotographer = null;
      
      public var background:SymbolDummyGeneric = null;
      
      public var content:SymbolCharacterConfiguratorPhotographerContentGeneric = null;
      
      public function SymbolPanelCharacterAppearancePhotographerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelCharacterAppearancePhotographer;
         }
         else
         {
            _nativeObject = new SymbolPanelCharacterAppearancePhotographer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolDummyGeneric(_nativeObject.background);
         content = new SymbolCharacterConfiguratorPhotographerContentGeneric(_nativeObject.content);
      }
      
      public function setNativeInstance(param1:SymbolPanelCharacterAppearancePhotographer) : void
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
         if(_nativeObject.content)
         {
            content.setNativeInstance(_nativeObject.content);
         }
      }
   }
}

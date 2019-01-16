package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorContentGeneric;
   
   public class SymbolPanelCharacterAppearanceGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelCharacterAppearance = null;
      
      public var background:SymbolDummyGeneric = null;
      
      public var content:SymbolCharacterConfiguratorContentGeneric = null;
      
      public function SymbolPanelCharacterAppearanceGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelCharacterAppearance;
         }
         else
         {
            _nativeObject = new SymbolPanelCharacterAppearance();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolDummyGeneric(_nativeObject.background);
         content = new SymbolCharacterConfiguratorContentGeneric(_nativeObject.content);
      }
      
      public function setNativeInstance(param1:SymbolPanelCharacterAppearance) : void
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

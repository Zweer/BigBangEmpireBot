package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.work.SymbolWorkBoosterButtonGeneric;
   import visuals.ui.elements.work.SymbolWorkContentGeneric;
   
   public class SymbolPanelWorkNewGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelWorkNew = null;
      
      public var content:SymbolWorkContentGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var btnBooster:SymbolWorkBoosterButtonGeneric = null;
      
      public function SymbolPanelWorkNewGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelWorkNew;
         }
         else
         {
            _nativeObject = new SymbolPanelWorkNew();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         content = new SymbolWorkContentGeneric(_nativeObject.content);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         btnBooster = new SymbolWorkBoosterButtonGeneric(_nativeObject.btnBooster);
      }
      
      public function setNativeInstance(param1:SymbolPanelWorkNew) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.content)
         {
            content.setNativeInstance(_nativeObject.content);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.btnBooster)
         {
            btnBooster.setNativeInstance(_nativeObject.btnBooster);
         }
      }
   }
}

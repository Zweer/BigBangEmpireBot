package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconHideUiGeneric;
   import visuals.ui.elements.icons.SymbolIconShowUiGeneric;
   
   public class SymbolButtonToggleUiGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonToggleUi = null;
      
      public var iconShow:SymbolIconShowUiGeneric = null;
      
      public var iconHide:SymbolIconHideUiGeneric = null;
      
      public function SymbolButtonToggleUiGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonToggleUi;
         }
         else
         {
            _nativeObject = new SymbolButtonToggleUi();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconShow = new SymbolIconShowUiGeneric(_nativeObject.iconShow);
         iconHide = new SymbolIconHideUiGeneric(_nativeObject.iconHide);
      }
      
      public function setNativeInstance(param1:SymbolButtonToggleUi) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconShow)
         {
            iconShow.setNativeInstance(_nativeObject.iconShow);
         }
         if(_nativeObject.iconHide)
         {
            iconHide.setNativeInstance(_nativeObject.iconHide);
         }
      }
   }
}

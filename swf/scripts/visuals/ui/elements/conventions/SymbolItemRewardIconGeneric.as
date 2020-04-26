package visuals.ui.elements.conventions
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolItemRewardIconGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemRewardIcon = null;
      
      public var icon:SymbolPlaceholderGeneric = null;
      
      public function SymbolItemRewardIconGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemRewardIcon;
         }
         else
         {
            _nativeObject = new SymbolItemRewardIcon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         icon = new SymbolPlaceholderGeneric(_nativeObject.icon);
      }
      
      public function setNativeInstance(param1:SymbolItemRewardIcon) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
      }
   }
}

package visuals.ui.elements.herobook
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconHerobookAnimatedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconHerobookAnimated = null;
      
      public var icon:SymbolIconHerobookGeneric = null;
      
      public var highlight:SymbolIconHerobookHighlightGeneric = null;
      
      public function SymbolIconHerobookAnimatedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconHerobookAnimated;
         }
         else
         {
            _nativeObject = new SymbolIconHerobookAnimated();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         icon = new SymbolIconHerobookGeneric(_nativeObject.icon);
         highlight = new SymbolIconHerobookHighlightGeneric(_nativeObject.highlight);
      }
      
      public function setNativeInstance(param1:SymbolIconHerobookAnimated) : void
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
         if(_nativeObject.highlight)
         {
            highlight.setNativeInstance(_nativeObject.highlight);
         }
      }
   }
}

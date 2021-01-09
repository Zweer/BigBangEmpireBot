package visuals.ui.elements.icons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.advertisment.SymbolIconVideoAdvertismentRawGeneric;
   
   public class SymbolIconVideoAdvertismentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconVideoAdvertisment = null;
      
      public var icon:SymbolIconVideoAdvertismentRawGeneric = null;
      
      public var highlight:SymbolIconVideoAdvertismentHighlightGeneric = null;
      
      public function SymbolIconVideoAdvertismentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconVideoAdvertisment;
         }
         else
         {
            _nativeObject = new SymbolIconVideoAdvertisment();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         icon = new SymbolIconVideoAdvertismentRawGeneric(_nativeObject.icon);
         highlight = new SymbolIconVideoAdvertismentHighlightGeneric(_nativeObject.highlight);
      }
      
      public function setNativeInstance(param1:SymbolIconVideoAdvertisment) : void
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

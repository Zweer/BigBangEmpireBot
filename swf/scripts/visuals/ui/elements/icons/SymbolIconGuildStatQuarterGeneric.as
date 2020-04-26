package visuals.ui.elements.icons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconGuildStatQuarterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconGuildStatQuarter = null;
      
      public function SymbolIconGuildStatQuarterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconGuildStatQuarter;
         }
         else
         {
            _nativeObject = new SymbolIconGuildStatQuarter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconGuildStatQuarter) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}

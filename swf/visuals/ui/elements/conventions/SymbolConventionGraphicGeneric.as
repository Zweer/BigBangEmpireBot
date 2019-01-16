package visuals.ui.elements.conventions
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolConventionGraphicGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolConventionGraphic = null;
      
      public var npcIcon:SymbolPlaceholderGeneric = null;
      
      public function SymbolConventionGraphicGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolConventionGraphic;
         }
         else
         {
            _nativeObject = new SymbolConventionGraphic();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         npcIcon = new SymbolPlaceholderGeneric(_nativeObject.npcIcon);
      }
      
      public function setNativeInstance(param1:SymbolConventionGraphic) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.npcIcon)
         {
            npcIcon.setNativeInstance(_nativeObject.npcIcon);
         }
      }
   }
}

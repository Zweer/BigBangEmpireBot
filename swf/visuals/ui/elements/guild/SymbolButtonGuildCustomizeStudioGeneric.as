package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultShapeSmallGeneric;
   
   public class SymbolButtonGuildCustomizeStudioGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonGuildCustomizeStudio = null;
      
      public var bg:SymbolUiButtonDefaultShapeSmallGeneric = null;
      
      public var bubbleNew:SymbolStudioCustomizationNewBubbleGeneric = null;
      
      public function SymbolButtonGuildCustomizeStudioGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonGuildCustomizeStudio;
         }
         else
         {
            _nativeObject = new SymbolButtonGuildCustomizeStudio();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolUiButtonDefaultShapeSmallGeneric(_nativeObject.bg);
         bubbleNew = new SymbolStudioCustomizationNewBubbleGeneric(_nativeObject.bubbleNew);
      }
      
      public function setNativeInstance(param1:SymbolButtonGuildCustomizeStudio) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.bubbleNew)
         {
            bubbleNew.setNativeInstance(_nativeObject.bubbleNew);
         }
      }
   }
}

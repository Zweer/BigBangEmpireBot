package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   
   public class SymbolUiGuildChatLinkTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiGuildChatLinkTooltip = null;
      
      public var symbolDummy:SymbolDummyGeneric = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var lines:SymbolDummyGeneric = null;
      
      public function SymbolUiGuildChatLinkTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiGuildChatLinkTooltip;
         }
         else
         {
            _nativeObject = new SymbolUiGuildChatLinkTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolDummy = new SymbolDummyGeneric(_nativeObject.symbolDummy);
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         lines = new SymbolDummyGeneric(_nativeObject.lines);
      }
      
      public function setNativeInstance(param1:SymbolUiGuildChatLinkTooltip) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolDummy)
         {
            symbolDummy.setNativeInstance(_nativeObject.symbolDummy);
         }
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.lines)
         {
            lines.setNativeInstance(_nativeObject.lines);
         }
      }
   }
}

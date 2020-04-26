package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolGuildBottomFrameExpandedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBottomFrameExpanded = null;
      
      public var symbolBackgroundGuildBottomFrame:SymbolBackgroundGuildBottomFrameGeneric = null;
      
      public var btnCollapse:SymbolGuildButtonArrowDownWhiteGeneric = null;
      
      public function SymbolGuildBottomFrameExpandedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBottomFrameExpanded;
         }
         else
         {
            _nativeObject = new SymbolGuildBottomFrameExpanded();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundGuildBottomFrame = new SymbolBackgroundGuildBottomFrameGeneric(_nativeObject.symbolBackgroundGuildBottomFrame);
         btnCollapse = new SymbolGuildButtonArrowDownWhiteGeneric(_nativeObject.btnCollapse);
      }
      
      public function setNativeInstance(param1:SymbolGuildBottomFrameExpanded) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundGuildBottomFrame)
         {
            symbolBackgroundGuildBottomFrame.setNativeInstance(_nativeObject.symbolBackgroundGuildBottomFrame);
         }
         if(_nativeObject.btnCollapse)
         {
            btnCollapse.setNativeInstance(_nativeObject.btnCollapse);
         }
      }
   }
}

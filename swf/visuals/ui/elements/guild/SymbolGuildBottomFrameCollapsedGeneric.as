package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolGuildBottomFrameCollapsedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBottomFrameCollapsed = null;
      
      public var symbolBackgroundGuildBottomFrame:SymbolBackgroundGuildBottomFrameGeneric = null;
      
      public var btnExpand:SymbolGuildButtonArrowUpWhiteGeneric = null;
      
      public function SymbolGuildBottomFrameCollapsedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBottomFrameCollapsed;
         }
         else
         {
            _nativeObject = new SymbolGuildBottomFrameCollapsed();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundGuildBottomFrame = new SymbolBackgroundGuildBottomFrameGeneric(_nativeObject.symbolBackgroundGuildBottomFrame);
         btnExpand = new SymbolGuildButtonArrowUpWhiteGeneric(_nativeObject.btnExpand);
      }
      
      public function setNativeInstance(param1:SymbolGuildBottomFrameCollapsed) : void
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
         if(_nativeObject.btnExpand)
         {
            btnExpand.setNativeInstance(_nativeObject.btnExpand);
         }
      }
   }
}

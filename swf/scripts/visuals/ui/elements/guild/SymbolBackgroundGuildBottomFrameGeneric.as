package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBackgroundGuildBottomFrameGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBackgroundGuildBottomFrame = null;
      
      public function SymbolBackgroundGuildBottomFrameGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBackgroundGuildBottomFrame;
         }
         else
         {
            _nativeObject = new SymbolBackgroundGuildBottomFrame();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolBackgroundGuildBottomFrame) : void
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

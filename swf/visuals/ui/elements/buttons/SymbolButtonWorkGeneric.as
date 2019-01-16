package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolButtonWorkGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonWork = null;
      
      public var progressMask:SymbolButtonWorkProgressGeneric = null;
      
      public var info:SymbolCounterGeneric = null;
      
      public function SymbolButtonWorkGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonWork;
         }
         else
         {
            _nativeObject = new SymbolButtonWork();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         progressMask = new SymbolButtonWorkProgressGeneric(_nativeObject.progressMask);
         info = new SymbolCounterGeneric(_nativeObject.info);
      }
      
      public function setNativeInstance(param1:SymbolButtonWork) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.progressMask)
         {
            progressMask.setNativeInstance(_nativeObject.progressMask);
         }
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
      }
   }
}

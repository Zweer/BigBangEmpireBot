package visuals.ui.elements.herobook
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolHerobookTimerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolHerobookTimer = null;
      
      public var txtTimer:ILabel = null;
      
      public function SymbolHerobookTimerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolHerobookTimer;
         }
         else
         {
            _nativeObject = new SymbolHerobookTimer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtTimer = FlashLabel.fromNative(_nativeObject.txtTimer);
      }
      
      public function setNativeInstance(param1:SymbolHerobookTimer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtTimer,_nativeObject.txtTimer);
      }
   }
}

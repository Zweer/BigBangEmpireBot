package visuals.ui.elements.herobook
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolHerobookButtonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolHerobookButton = null;
      
      public var icon:SymbolIconHerobookAnimatedGeneric = null;
      
      public var counter:SymbolCounterGeneric = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public var timer:SymbolHerobookTimerGeneric = null;
      
      public function SymbolHerobookButtonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolHerobookButton;
         }
         else
         {
            _nativeObject = new SymbolHerobookButton();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         icon = new SymbolIconHerobookAnimatedGeneric(_nativeObject.icon);
         counter = new SymbolCounterGeneric(_nativeObject.counter);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
         timer = new SymbolHerobookTimerGeneric(_nativeObject.timer);
      }
      
      public function setNativeInstance(param1:SymbolHerobookButton) : void
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
         if(_nativeObject.counter)
         {
            counter.setNativeInstance(_nativeObject.counter);
         }
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         if(_nativeObject.timer)
         {
            timer.setNativeInstance(_nativeObject.timer);
         }
      }
   }
}

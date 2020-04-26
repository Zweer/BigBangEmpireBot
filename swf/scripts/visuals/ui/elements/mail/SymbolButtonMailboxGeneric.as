package visuals.ui.elements.mail
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolButtonMailboxGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonMailbox = null;
      
      public var counterUnread:SymbolCounterGeneric = null;
      
      public function SymbolButtonMailboxGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonMailbox;
         }
         else
         {
            _nativeObject = new SymbolButtonMailbox();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         counterUnread = new SymbolCounterGeneric(_nativeObject.counterUnread);
      }
      
      public function setNativeInstance(param1:SymbolButtonMailbox) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.counterUnread)
         {
            counterUnread.setNativeInstance(_nativeObject.counterUnread);
         }
      }
   }
}

package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.herobook.SymbolHerobookTimerGeneric;
   import visuals.ui.elements.icons.SymbolIconDeleteNewGeneric;
   import visuals.ui.elements.icons.SymbolIconDungeonTicketGeneric;
   
   public class SymbolButtonDungeonMultitaskingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonDungeonMultitasking = null;
      
      public var timer:SymbolHerobookTimerGeneric = null;
      
      public var iconTicket:SymbolIconDungeonTicketGeneric = null;
      
      public var iconDelete:SymbolIconDeleteNewGeneric = null;
      
      public function SymbolButtonDungeonMultitaskingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonDungeonMultitasking;
         }
         else
         {
            _nativeObject = new SymbolButtonDungeonMultitasking();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         timer = new SymbolHerobookTimerGeneric(_nativeObject.timer);
         iconTicket = new SymbolIconDungeonTicketGeneric(_nativeObject.iconTicket);
         iconDelete = new SymbolIconDeleteNewGeneric(_nativeObject.iconDelete);
      }
      
      public function setNativeInstance(param1:SymbolButtonDungeonMultitasking) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.timer)
         {
            timer.setNativeInstance(_nativeObject.timer);
         }
         if(_nativeObject.iconTicket)
         {
            iconTicket.setNativeInstance(_nativeObject.iconTicket);
         }
         if(_nativeObject.iconDelete)
         {
            iconDelete.setNativeInstance(_nativeObject.iconDelete);
         }
      }
   }
}

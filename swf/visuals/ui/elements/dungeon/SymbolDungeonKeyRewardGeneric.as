package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.icons.SymbolIconDungeonTicketGeneric;
   import visuals.ui.elements.item.SymbolItemSlotBorderGeneric;
   
   public class SymbolDungeonKeyRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonKeyReward = null;
      
      public var border:SymbolItemSlotBorderGeneric = null;
      
      public var symbolIconDungeonTicket:SymbolIconDungeonTicketGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolDungeonKeyRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonKeyReward;
         }
         else
         {
            _nativeObject = new SymbolDungeonKeyReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         border = new SymbolItemSlotBorderGeneric(_nativeObject.border);
         symbolIconDungeonTicket = new SymbolIconDungeonTicketGeneric(_nativeObject.symbolIconDungeonTicket);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolDungeonKeyReward) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.border)
         {
            border.setNativeInstance(_nativeObject.border);
         }
         if(_nativeObject.symbolIconDungeonTicket)
         {
            symbolIconDungeonTicket.setNativeInstance(_nativeObject.symbolIconDungeonTicket);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}

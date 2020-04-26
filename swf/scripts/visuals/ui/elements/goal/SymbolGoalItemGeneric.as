package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.item.SymbolItemSlotBorderGeneric;
   
   public class SymbolGoalItemGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalItem = null;
      
      public var border:SymbolItemSlotBorderGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolGoalItemGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalItem;
         }
         else
         {
            _nativeObject = new SymbolGoalItem();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         border = new SymbolItemSlotBorderGeneric(_nativeObject.border);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolGoalItem) : void
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
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}

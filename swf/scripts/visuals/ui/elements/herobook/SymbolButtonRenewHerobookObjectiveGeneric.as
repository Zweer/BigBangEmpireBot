package visuals.ui.elements.herobook
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultShapeSmallGeneric;
   
   public class SymbolButtonRenewHerobookObjectiveGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonRenewHerobookObjective = null;
      
      public var symbolUiButtonDefaultShapeSmall:SymbolUiButtonDefaultShapeSmallGeneric = null;
      
      public function SymbolButtonRenewHerobookObjectiveGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonRenewHerobookObjective;
         }
         else
         {
            _nativeObject = new SymbolButtonRenewHerobookObjective();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolUiButtonDefaultShapeSmall = new SymbolUiButtonDefaultShapeSmallGeneric(_nativeObject.symbolUiButtonDefaultShapeSmall);
      }
      
      public function setNativeInstance(param1:SymbolButtonRenewHerobookObjective) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolUiButtonDefaultShapeSmall)
         {
            symbolUiButtonDefaultShapeSmall.setNativeInstance(_nativeObject.symbolUiButtonDefaultShapeSmall);
         }
      }
   }
}

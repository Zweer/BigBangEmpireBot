package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolPlayerPanelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPlayerPanel = null;
      
      public var xpBarMask:SymbolXPBarMaskGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public var levelStar:SymbolPlayerPanelStarAnimationGeneric = null;
      
      public var addXPText:ILabel = null;
      
      public function SymbolPlayerPanelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPlayerPanel;
         }
         else
         {
            _nativeObject = new SymbolPlayerPanel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         xpBarMask = new SymbolXPBarMaskGeneric(_nativeObject.xpBarMask);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
         levelStar = new SymbolPlayerPanelStarAnimationGeneric(_nativeObject.levelStar);
         addXPText = FlashLabel.fromNative(_nativeObject.addXPText);
      }
      
      public function setNativeInstance(param1:SymbolPlayerPanel) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.xpBarMask)
         {
            xpBarMask.setNativeInstance(_nativeObject.xpBarMask);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
         if(_nativeObject.levelStar)
         {
            levelStar.setNativeInstance(_nativeObject.levelStar);
         }
         FlashLabel.setNativeInstance(addXPText,_nativeObject.addXPText);
      }
   }
}

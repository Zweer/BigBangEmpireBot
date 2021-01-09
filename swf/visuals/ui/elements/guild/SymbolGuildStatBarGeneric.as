package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildStatEquipmentGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildStatMotivationGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildStatPopularityGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildStatQuarterGeneric;
   
   public class SymbolGuildStatBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildStatBar = null;
      
      public var iconQuarter:SymbolIconGuildStatQuarterGeneric = null;
      
      public var iconEquipment:SymbolIconGuildStatEquipmentGeneric = null;
      
      public var iconMotivation:SymbolIconGuildStatMotivationGeneric = null;
      
      public var iconPopularity:SymbolIconGuildStatPopularityGeneric = null;
      
      public var btnIncrease:SymbolButtonPlusGeneric = null;
      
      public var background:SymbolGuildStatBarBackgroundGeneric = null;
      
      public var fill:SymbolGuildStatBarFillGeneric = null;
      
      public var txtStatValue:ILabel = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolGuildStatBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildStatBar;
         }
         else
         {
            _nativeObject = new SymbolGuildStatBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconQuarter = new SymbolIconGuildStatQuarterGeneric(_nativeObject.iconQuarter);
         iconEquipment = new SymbolIconGuildStatEquipmentGeneric(_nativeObject.iconEquipment);
         iconMotivation = new SymbolIconGuildStatMotivationGeneric(_nativeObject.iconMotivation);
         iconPopularity = new SymbolIconGuildStatPopularityGeneric(_nativeObject.iconPopularity);
         btnIncrease = new SymbolButtonPlusGeneric(_nativeObject.btnIncrease);
         background = new SymbolGuildStatBarBackgroundGeneric(_nativeObject.background);
         fill = new SymbolGuildStatBarFillGeneric(_nativeObject.fill);
         txtStatValue = FlashLabel.fromNative(_nativeObject.txtStatValue);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolGuildStatBar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconQuarter)
         {
            iconQuarter.setNativeInstance(_nativeObject.iconQuarter);
         }
         if(_nativeObject.iconEquipment)
         {
            iconEquipment.setNativeInstance(_nativeObject.iconEquipment);
         }
         if(_nativeObject.iconMotivation)
         {
            iconMotivation.setNativeInstance(_nativeObject.iconMotivation);
         }
         if(_nativeObject.iconPopularity)
         {
            iconPopularity.setNativeInstance(_nativeObject.iconPopularity);
         }
         if(_nativeObject.btnIncrease)
         {
            btnIncrease.setNativeInstance(_nativeObject.btnIncrease);
         }
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.fill)
         {
            fill.setNativeInstance(_nativeObject.fill);
         }
         FlashLabel.setNativeInstance(txtStatValue,_nativeObject.txtStatValue);
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}

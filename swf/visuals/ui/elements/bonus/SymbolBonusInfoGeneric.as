package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   
   public class SymbolBonusInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBonusInfo = null;
      
      public var backgroundRewarded:SymbolDailyLoginBonusBackgroundRewardedGeneric = null;
      
      public var backgroundPending:SymbolDailyLoginBonusBackgroundPendingGeneric = null;
      
      public var txtDay:ILabel = null;
      
      public var iconBonus:SymbolPlaceholderGeneric = null;
      
      public var checkmark:SymbolIconCheckmarkGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolBonusInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBonusInfo;
         }
         else
         {
            _nativeObject = new SymbolBonusInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundRewarded = new SymbolDailyLoginBonusBackgroundRewardedGeneric(_nativeObject.backgroundRewarded);
         backgroundPending = new SymbolDailyLoginBonusBackgroundPendingGeneric(_nativeObject.backgroundPending);
         txtDay = FlashLabel.fromNative(_nativeObject.txtDay);
         iconBonus = new SymbolPlaceholderGeneric(_nativeObject.iconBonus);
         checkmark = new SymbolIconCheckmarkGeneric(_nativeObject.checkmark);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolBonusInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundRewarded)
         {
            backgroundRewarded.setNativeInstance(_nativeObject.backgroundRewarded);
         }
         if(_nativeObject.backgroundPending)
         {
            backgroundPending.setNativeInstance(_nativeObject.backgroundPending);
         }
         FlashLabel.setNativeInstance(txtDay,_nativeObject.txtDay);
         if(_nativeObject.iconBonus)
         {
            iconBonus.setNativeInstance(_nativeObject.iconBonus);
         }
         if(_nativeObject.checkmark)
         {
            checkmark.setNativeInstance(_nativeObject.checkmark);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}

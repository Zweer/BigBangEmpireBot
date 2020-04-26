package visuals.ui.elements.conventions
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolConventionInfoRewardsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolConventionInfoRewards = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconTopPoolItem:SymbolItemRewardIconGeneric = null;
      
      public var iconTopRankItem:SymbolItemRewardIconGeneric = null;
      
      public var txtGameCurrency:ILabel = null;
      
      public var txtXp:ILabel = null;
      
      public var txtRewardTop1:ILabel = null;
      
      public var txtRewardTop10:ILabel = null;
      
      public var txtRewardOther:ILabel = null;
      
      public function SymbolConventionInfoRewardsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolConventionInfoRewards;
         }
         else
         {
            _nativeObject = new SymbolConventionInfoRewards();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconTopPoolItem = new SymbolItemRewardIconGeneric(_nativeObject.iconTopPoolItem);
         iconTopRankItem = new SymbolItemRewardIconGeneric(_nativeObject.iconTopRankItem);
         txtGameCurrency = FlashLabel.fromNative(_nativeObject.txtGameCurrency);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         txtRewardTop1 = FlashLabel.fromNative(_nativeObject.txtRewardTop1);
         txtRewardTop10 = FlashLabel.fromNative(_nativeObject.txtRewardTop10);
         txtRewardOther = FlashLabel.fromNative(_nativeObject.txtRewardOther);
      }
      
      public function setNativeInstance(param1:SymbolConventionInfoRewards) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         if(_nativeObject.iconTopPoolItem)
         {
            iconTopPoolItem.setNativeInstance(_nativeObject.iconTopPoolItem);
         }
         if(_nativeObject.iconTopRankItem)
         {
            iconTopRankItem.setNativeInstance(_nativeObject.iconTopRankItem);
         }
         FlashLabel.setNativeInstance(txtGameCurrency,_nativeObject.txtGameCurrency);
         FlashLabel.setNativeInstance(txtXp,_nativeObject.txtXp);
         FlashLabel.setNativeInstance(txtRewardTop1,_nativeObject.txtRewardTop1);
         FlashLabel.setNativeInstance(txtRewardTop10,_nativeObject.txtRewardTop10);
         FlashLabel.setNativeInstance(txtRewardOther,_nativeObject.txtRewardOther);
      }
   }
}

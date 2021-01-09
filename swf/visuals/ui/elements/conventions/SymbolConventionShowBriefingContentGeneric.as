package visuals.ui.elements.conventions
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.icons.SymbolIconDurationGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolConventionShowBriefingContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolConventionShowBriefingContent = null;
      
      public var txtConventionName:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtRequirementsCaption:ILabel = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var reward1:SymbolConventionRewardGeneric = null;
      
      public var reward2:SymbolConventionRewardGeneric = null;
      
      public var txtXpTotal:ILabel = null;
      
      public var txtGameCurrency:ILabel = null;
      
      public var txtXp:ILabel = null;
      
      public var iconDuration:SymbolIconDurationGeneric = null;
      
      public var txtDuration:ILabel = null;
      
      public var progress:SymbolConventionFansBarGeneric = null;
      
      public var txtTimeLeft:ILabel = null;
      
      public var txtBriefing:ILabelArea = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public function SymbolConventionShowBriefingContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolConventionShowBriefingContent;
         }
         else
         {
            _nativeObject = new SymbolConventionShowBriefingContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtConventionName = FlashLabel.fromNative(_nativeObject.txtConventionName);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtRequirementsCaption = FlashLabel.fromNative(_nativeObject.txtRequirementsCaption);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         reward1 = new SymbolConventionRewardGeneric(_nativeObject.reward1);
         reward2 = new SymbolConventionRewardGeneric(_nativeObject.reward2);
         txtXpTotal = FlashLabel.fromNative(_nativeObject.txtXpTotal);
         txtGameCurrency = FlashLabel.fromNative(_nativeObject.txtGameCurrency);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         iconDuration = new SymbolIconDurationGeneric(_nativeObject.iconDuration);
         txtDuration = FlashLabel.fromNative(_nativeObject.txtDuration);
         progress = new SymbolConventionFansBarGeneric(_nativeObject.progress);
         txtTimeLeft = FlashLabel.fromNative(_nativeObject.txtTimeLeft);
         txtBriefing = FlashLabelArea.fromNative(_nativeObject.txtBriefing);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
      }
      
      public function setNativeInstance(param1:SymbolConventionShowBriefingContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtConventionName,_nativeObject.txtConventionName);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabel.setNativeInstance(txtRequirementsCaption,_nativeObject.txtRequirementsCaption);
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.reward1)
         {
            reward1.setNativeInstance(_nativeObject.reward1);
         }
         if(_nativeObject.reward2)
         {
            reward2.setNativeInstance(_nativeObject.reward2);
         }
         FlashLabel.setNativeInstance(txtXpTotal,_nativeObject.txtXpTotal);
         FlashLabel.setNativeInstance(txtGameCurrency,_nativeObject.txtGameCurrency);
         FlashLabel.setNativeInstance(txtXp,_nativeObject.txtXp);
         if(_nativeObject.iconDuration)
         {
            iconDuration.setNativeInstance(_nativeObject.iconDuration);
         }
         FlashLabel.setNativeInstance(txtDuration,_nativeObject.txtDuration);
         if(_nativeObject.progress)
         {
            progress.setNativeInstance(_nativeObject.progress);
         }
         FlashLabel.setNativeInstance(txtTimeLeft,_nativeObject.txtTimeLeft);
         FlashLabelArea.setNativeInstance(txtBriefing,_nativeObject.txtBriefing);
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
      }
   }
}

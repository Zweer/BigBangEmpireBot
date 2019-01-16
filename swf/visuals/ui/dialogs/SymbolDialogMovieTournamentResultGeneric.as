package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconTitleGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.movie.SymbolCoverImagePlaceholderGeneric;
   import visuals.ui.elements.movie.SymbolMovieTournamentTournamentInfoBigGeneric;
   
   public class SymbolDialogMovieTournamentResultGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMovieTournamentResult = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var txtStatPoints:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var iconTitle:SymbolIconTitleGeneric = null;
      
      public var txtTitleReward:ILabel = null;
      
      public var titleTooltip:SymbolDummyGeneric = null;
      
      public var txtDateCaption:ILabelArea = null;
      
      public var txtDate:ILabelArea = null;
      
      public var txtRewardCaption:ILabelArea = null;
      
      public var txtSetCaption:ILabelArea = null;
      
      public var txtSet:ILabelArea = null;
      
      public var tournament:SymbolMovieTournamentTournamentInfoBigGeneric = null;
      
      public var cover:SymbolCoverImagePlaceholderGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolDialogMovieTournamentResultGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMovieTournamentResult;
         }
         else
         {
            _nativeObject = new SymbolDialogMovieTournamentResult();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         txtStatPoints = FlashLabel.fromNative(_nativeObject.txtStatPoints);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         iconTitle = new SymbolIconTitleGeneric(_nativeObject.iconTitle);
         txtTitleReward = FlashLabel.fromNative(_nativeObject.txtTitleReward);
         titleTooltip = new SymbolDummyGeneric(_nativeObject.titleTooltip);
         txtDateCaption = FlashLabelArea.fromNative(_nativeObject.txtDateCaption);
         txtDate = FlashLabelArea.fromNative(_nativeObject.txtDate);
         txtRewardCaption = FlashLabelArea.fromNative(_nativeObject.txtRewardCaption);
         txtSetCaption = FlashLabelArea.fromNative(_nativeObject.txtSetCaption);
         txtSet = FlashLabelArea.fromNative(_nativeObject.txtSet);
         tournament = new SymbolMovieTournamentTournamentInfoBigGeneric(_nativeObject.tournament);
         cover = new SymbolCoverImagePlaceholderGeneric(_nativeObject.cover);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolDialogMovieTournamentResult) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         FlashLabel.setNativeInstance(txtStatPoints,_nativeObject.txtStatPoints);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         FlashLabel.setNativeInstance(txtXp,_nativeObject.txtXp);
         if(_nativeObject.iconTitle)
         {
            iconTitle.setNativeInstance(_nativeObject.iconTitle);
         }
         FlashLabel.setNativeInstance(txtTitleReward,_nativeObject.txtTitleReward);
         if(_nativeObject.titleTooltip)
         {
            titleTooltip.setNativeInstance(_nativeObject.titleTooltip);
         }
         FlashLabelArea.setNativeInstance(txtDateCaption,_nativeObject.txtDateCaption);
         FlashLabelArea.setNativeInstance(txtDate,_nativeObject.txtDate);
         FlashLabelArea.setNativeInstance(txtRewardCaption,_nativeObject.txtRewardCaption);
         FlashLabelArea.setNativeInstance(txtSetCaption,_nativeObject.txtSetCaption);
         FlashLabelArea.setNativeInstance(txtSet,_nativeObject.txtSet);
         if(_nativeObject.tournament)
         {
            tournament.setNativeInstance(_nativeObject.tournament);
         }
         if(_nativeObject.cover)
         {
            cover.setNativeInstance(_nativeObject.cover);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}

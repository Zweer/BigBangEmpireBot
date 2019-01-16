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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.movie.SymbolIconMovieProgressGeneric;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class SymbolDialogMovieQuestCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMovieQuestComplete = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtOutcome:ILabelArea = null;
      
      public var txtProgress:ILabel = null;
      
      public var iconProgress:SymbolIconMovieProgressGeneric = null;
      
      public var movieVoteReward:SymbolMovieItemGeneric = null;
      
      public function SymbolDialogMovieQuestCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMovieQuestComplete;
         }
         else
         {
            _nativeObject = new SymbolDialogMovieQuestComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtOutcome = FlashLabelArea.fromNative(_nativeObject.txtOutcome);
         txtProgress = FlashLabel.fromNative(_nativeObject.txtProgress);
         iconProgress = new SymbolIconMovieProgressGeneric(_nativeObject.iconProgress);
         movieVoteReward = new SymbolMovieItemGeneric(_nativeObject.movieVoteReward);
      }
      
      public function setNativeInstance(param1:SymbolDialogMovieQuestComplete) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         FlashLabel.setNativeInstance(txtCoins,_nativeObject.txtCoins);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         FlashLabel.setNativeInstance(txtXp,_nativeObject.txtXp);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabelArea.setNativeInstance(txtOutcome,_nativeObject.txtOutcome);
         FlashLabel.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.iconProgress)
         {
            iconProgress.setNativeInstance(_nativeObject.iconProgress);
         }
         if(_nativeObject.movieVoteReward)
         {
            movieVoteReward.setNativeInstance(_nativeObject.movieVoteReward);
         }
      }
   }
}

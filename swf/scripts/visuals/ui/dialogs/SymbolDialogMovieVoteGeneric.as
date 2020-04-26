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
   import visuals.ui.base.SymbolBlockerAnimationGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.movie.SymbolMovieVoteGeneric;
   import visuals.ui.elements.movie.SymbolMovieVotesBackgroundGeneric;
   import visuals.ui.elements.movie.SymbolVotingVSAnimationGeneric;
   
   public class SymbolDialogMovieVoteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMovieVote = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var bgMovies:SymbolMovieVotesBackgroundGeneric = null;
      
      public var vsAnimation:SymbolVotingVSAnimationGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var movie2:SymbolMovieVoteGeneric = null;
      
      public var movie1:SymbolMovieVoteGeneric = null;
      
      public var btnVote1:SymbolUiButtonDefaultGeneric = null;
      
      public var btnVote2:SymbolUiButtonDefaultGeneric = null;
      
      public var btnOk:SymbolUiButtonDefaultGeneric = null;
      
      public var btnRefreshMovies:SymbolButtonPremiumGeneric = null;
      
      public var txtReward:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtReportMovie:ILabel = null;
      
      public var txtInfo:ILabel = null;
      
      public var txtInfoError:ILabelArea = null;
      
      public var loader:SymbolBlockerAnimationGeneric = null;
      
      public function SymbolDialogMovieVoteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMovieVote;
         }
         else
         {
            _nativeObject = new SymbolDialogMovieVote();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         bgMovies = new SymbolMovieVotesBackgroundGeneric(_nativeObject.bgMovies);
         vsAnimation = new SymbolVotingVSAnimationGeneric(_nativeObject.vsAnimation);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         movie2 = new SymbolMovieVoteGeneric(_nativeObject.movie2);
         movie1 = new SymbolMovieVoteGeneric(_nativeObject.movie1);
         btnVote1 = new SymbolUiButtonDefaultGeneric(_nativeObject.btnVote1);
         btnVote2 = new SymbolUiButtonDefaultGeneric(_nativeObject.btnVote2);
         btnOk = new SymbolUiButtonDefaultGeneric(_nativeObject.btnOk);
         btnRefreshMovies = new SymbolButtonPremiumGeneric(_nativeObject.btnRefreshMovies);
         txtReward = FlashLabel.fromNative(_nativeObject.txtReward);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtReportMovie = FlashLabel.fromNative(_nativeObject.txtReportMovie);
         txtInfo = FlashLabel.fromNative(_nativeObject.txtInfo);
         txtInfoError = FlashLabelArea.fromNative(_nativeObject.txtInfoError);
         loader = new SymbolBlockerAnimationGeneric(_nativeObject.loader);
      }
      
      public function setNativeInstance(param1:SymbolDialogMovieVote) : void
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
         if(_nativeObject.bgMovies)
         {
            bgMovies.setNativeInstance(_nativeObject.bgMovies);
         }
         if(_nativeObject.vsAnimation)
         {
            vsAnimation.setNativeInstance(_nativeObject.vsAnimation);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.movie2)
         {
            movie2.setNativeInstance(_nativeObject.movie2);
         }
         if(_nativeObject.movie1)
         {
            movie1.setNativeInstance(_nativeObject.movie1);
         }
         if(_nativeObject.btnVote1)
         {
            btnVote1.setNativeInstance(_nativeObject.btnVote1);
         }
         if(_nativeObject.btnVote2)
         {
            btnVote2.setNativeInstance(_nativeObject.btnVote2);
         }
         if(_nativeObject.btnOk)
         {
            btnOk.setNativeInstance(_nativeObject.btnOk);
         }
         if(_nativeObject.btnRefreshMovies)
         {
            btnRefreshMovies.setNativeInstance(_nativeObject.btnRefreshMovies);
         }
         FlashLabel.setNativeInstance(txtReward,_nativeObject.txtReward);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         FlashLabel.setNativeInstance(txtReportMovie,_nativeObject.txtReportMovie);
         FlashLabel.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtInfoError,_nativeObject.txtInfoError);
         if(_nativeObject.loader)
         {
            loader.setNativeInstance(_nativeObject.loader);
         }
      }
   }
}

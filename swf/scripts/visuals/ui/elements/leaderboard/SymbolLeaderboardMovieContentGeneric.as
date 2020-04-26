package visuals.ui.elements.leaderboard
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.icons.SymbolIconDurationGeneric;
   
   public class SymbolLeaderboardMovieContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardMovieContent = null;
      
      public var line1:SymbolLeaderboardMovieLineGeneric = null;
      
      public var line2:SymbolLeaderboardMovieLineGeneric = null;
      
      public var line3:SymbolLeaderboardMovieLineGeneric = null;
      
      public var line4:SymbolLeaderboardMovieLineGeneric = null;
      
      public var line5:SymbolLeaderboardMovieLineGeneric = null;
      
      public var line6:SymbolLeaderboardMovieLineGeneric = null;
      
      public var line7:SymbolLeaderboardMovieLineGeneric = null;
      
      public var line8:SymbolLeaderboardMovieLineGeneric = null;
      
      public var line9:SymbolLeaderboardMovieLineGeneric = null;
      
      public var line10:SymbolLeaderboardMovieLineGeneric = null;
      
      public var txtPositionCaption:ILabel = null;
      
      public var txtNoMovies:ILabelArea = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtCharacterCaption:ILabel = null;
      
      public var txtRewardCaption:ILabel = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtTournamentInfo:ILabelArea = null;
      
      public var symbolIconDuration:SymbolIconDurationGeneric = null;
      
      public function SymbolLeaderboardMovieContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardMovieContent;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardMovieContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line1);
         line2 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line2);
         line3 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line3);
         line4 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line4);
         line5 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line5);
         line6 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line6);
         line7 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line7);
         line8 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line8);
         line9 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line9);
         line10 = new SymbolLeaderboardMovieLineGeneric(_nativeObject.line10);
         txtPositionCaption = FlashLabel.fromNative(_nativeObject.txtPositionCaption);
         txtNoMovies = FlashLabelArea.fromNative(_nativeObject.txtNoMovies);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtCharacterCaption = FlashLabel.fromNative(_nativeObject.txtCharacterCaption);
         txtRewardCaption = FlashLabel.fromNative(_nativeObject.txtRewardCaption);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtTournamentInfo = FlashLabelArea.fromNative(_nativeObject.txtTournamentInfo);
         symbolIconDuration = new SymbolIconDurationGeneric(_nativeObject.symbolIconDuration);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardMovieContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.line6)
         {
            line6.setNativeInstance(_nativeObject.line6);
         }
         if(_nativeObject.line7)
         {
            line7.setNativeInstance(_nativeObject.line7);
         }
         if(_nativeObject.line8)
         {
            line8.setNativeInstance(_nativeObject.line8);
         }
         if(_nativeObject.line9)
         {
            line9.setNativeInstance(_nativeObject.line9);
         }
         if(_nativeObject.line10)
         {
            line10.setNativeInstance(_nativeObject.line10);
         }
         FlashLabel.setNativeInstance(txtPositionCaption,_nativeObject.txtPositionCaption);
         FlashLabelArea.setNativeInstance(txtNoMovies,_nativeObject.txtNoMovies);
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtCharacterCaption,_nativeObject.txtCharacterCaption);
         FlashLabel.setNativeInstance(txtRewardCaption,_nativeObject.txtRewardCaption);
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabelArea.setNativeInstance(txtTournamentInfo,_nativeObject.txtTournamentInfo);
         if(_nativeObject.symbolIconDuration)
         {
            symbolIconDuration.setNativeInstance(_nativeObject.symbolIconDuration);
         }
      }
   }
}

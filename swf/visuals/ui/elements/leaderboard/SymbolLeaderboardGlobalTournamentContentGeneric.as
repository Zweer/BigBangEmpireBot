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
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.tournament.SymbolTournamentTickerGeneric;
   
   public class SymbolLeaderboardGlobalTournamentContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardGlobalTournamentContent = null;
      
      public var line1:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var line2:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var line3:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var line4:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var line5:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var line6:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var line7:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var line8:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var line9:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var line10:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      public var txtPositionCaption:ILabel = null;
      
      public var txtNoCharacters:ILabelArea = null;
      
      public var txtLocked:ILabelArea = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtGuildCaption:ILabel = null;
      
      public var txtFightCaption:ILabel = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var ticker:SymbolTournamentTickerGeneric = null;
      
      public var refreshInfo:SymbolButtonHelpGeneric = null;
      
      public function SymbolLeaderboardGlobalTournamentContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardGlobalTournamentContent;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardGlobalTournamentContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line1);
         line2 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line2);
         line3 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line3);
         line4 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line4);
         line5 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line5);
         line6 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line6);
         line7 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line7);
         line8 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line8);
         line9 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line9);
         line10 = new SymbolLeaderboardCharacterGlobalTournamentLineGeneric(_nativeObject.line10);
         txtPositionCaption = FlashLabel.fromNative(_nativeObject.txtPositionCaption);
         txtNoCharacters = FlashLabelArea.fromNative(_nativeObject.txtNoCharacters);
         txtLocked = FlashLabelArea.fromNative(_nativeObject.txtLocked);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtGuildCaption = FlashLabel.fromNative(_nativeObject.txtGuildCaption);
         txtFightCaption = FlashLabel.fromNative(_nativeObject.txtFightCaption);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         ticker = new SymbolTournamentTickerGeneric(_nativeObject.ticker);
         refreshInfo = new SymbolButtonHelpGeneric(_nativeObject.refreshInfo);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardGlobalTournamentContent) : void
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
         FlashLabelArea.setNativeInstance(txtNoCharacters,_nativeObject.txtNoCharacters);
         FlashLabelArea.setNativeInstance(txtLocked,_nativeObject.txtLocked);
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtGuildCaption,_nativeObject.txtGuildCaption);
         FlashLabel.setNativeInstance(txtFightCaption,_nativeObject.txtFightCaption);
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.ticker)
         {
            ticker.setNativeInstance(_nativeObject.ticker);
         }
         if(_nativeObject.refreshInfo)
         {
            refreshInfo.setNativeInstance(_nativeObject.refreshInfo);
         }
      }
   }
}

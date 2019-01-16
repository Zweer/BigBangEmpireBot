package visuals.ui.elements.leaderboard
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonSmallTabGeneric;
   import visuals.ui.elements.icons.SymbolIconDurationGeneric;
   
   public class SymbolLeaderboardGuildCompetitionContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardGuildCompetitionContainer = null;
      
      public var guildCompetitionContent:SymbolLeaderboardGuildCompetitionContentGeneric = null;
      
      public var soloGuildCompetitionContent:SymbolLeaderboardSoloGuildCompetitionContentGeneric = null;
      
      public var tabGuildCompetition:SymbolButtonSmallTabGeneric = null;
      
      public var tabSoloGuildCompetition:SymbolButtonSmallTabGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtTournamentInfo:ILabelArea = null;
      
      public var iconTournamentInfo:SymbolIconDurationGeneric = null;
      
      public function SymbolLeaderboardGuildCompetitionContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardGuildCompetitionContainer;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardGuildCompetitionContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         guildCompetitionContent = new SymbolLeaderboardGuildCompetitionContentGeneric(_nativeObject.guildCompetitionContent);
         soloGuildCompetitionContent = new SymbolLeaderboardSoloGuildCompetitionContentGeneric(_nativeObject.soloGuildCompetitionContent);
         tabGuildCompetition = new SymbolButtonSmallTabGeneric(_nativeObject.tabGuildCompetition);
         tabSoloGuildCompetition = new SymbolButtonSmallTabGeneric(_nativeObject.tabSoloGuildCompetition);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtTournamentInfo = FlashLabelArea.fromNative(_nativeObject.txtTournamentInfo);
         iconTournamentInfo = new SymbolIconDurationGeneric(_nativeObject.iconTournamentInfo);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardGuildCompetitionContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.guildCompetitionContent)
         {
            guildCompetitionContent.setNativeInstance(_nativeObject.guildCompetitionContent);
         }
         if(_nativeObject.soloGuildCompetitionContent)
         {
            soloGuildCompetitionContent.setNativeInstance(_nativeObject.soloGuildCompetitionContent);
         }
         if(_nativeObject.tabGuildCompetition)
         {
            tabGuildCompetition.setNativeInstance(_nativeObject.tabGuildCompetition);
         }
         if(_nativeObject.tabSoloGuildCompetition)
         {
            tabSoloGuildCompetition.setNativeInstance(_nativeObject.tabSoloGuildCompetition);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabelArea.setNativeInstance(txtTournamentInfo,_nativeObject.txtTournamentInfo);
         if(_nativeObject.iconTournamentInfo)
         {
            iconTournamentInfo.setNativeInstance(_nativeObject.iconTournamentInfo);
         }
      }
   }
}

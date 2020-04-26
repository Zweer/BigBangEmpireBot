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
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.guild_competition.SymbolIconGuildCompetitionScoreGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderFemaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderMaleGeneric;
   import visuals.ui.elements.icons.SymbolIconOnlineGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   
   public class SymbolLeaderboardSoloGuildCompetitionLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardSoloGuildCompetitionLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtRank:ILabel = null;
      
      public var txtGuildName:ILabelArea = null;
      
      public var txtScore:ILabelArea = null;
      
      public var iconScore:SymbolIconGuildCompetitionScoreGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var iconOnline:SymbolIconOnlineGeneric = null;
      
      public var iconGenderFemale:SymbolIconGenderFemaleGeneric = null;
      
      public var iconGenderMale:SymbolIconGenderMaleGeneric = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public var iconRewardStatPoint:SymbolIconPlusGeneric = null;
      
      public var txtStatPoints:ILabelArea = null;
      
      public var tooltipStatPoints:SymbolDummyGeneric = null;
      
      public function SymbolLeaderboardSoloGuildCompetitionLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardSoloGuildCompetitionLine;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardSoloGuildCompetitionLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         txtRank = FlashLabel.fromNative(_nativeObject.txtRank);
         txtGuildName = FlashLabelArea.fromNative(_nativeObject.txtGuildName);
         txtScore = FlashLabelArea.fromNative(_nativeObject.txtScore);
         iconScore = new SymbolIconGuildCompetitionScoreGeneric(_nativeObject.iconScore);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         iconOnline = new SymbolIconOnlineGeneric(_nativeObject.iconOnline);
         iconGenderFemale = new SymbolIconGenderFemaleGeneric(_nativeObject.iconGenderFemale);
         iconGenderMale = new SymbolIconGenderMaleGeneric(_nativeObject.iconGenderMale);
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
         iconRewardStatPoint = new SymbolIconPlusGeneric(_nativeObject.iconRewardStatPoint);
         txtStatPoints = FlashLabelArea.fromNative(_nativeObject.txtStatPoints);
         tooltipStatPoints = new SymbolDummyGeneric(_nativeObject.tooltipStatPoints);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardSoloGuildCompetitionLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         FlashLabel.setNativeInstance(txtRank,_nativeObject.txtRank);
         FlashLabelArea.setNativeInstance(txtGuildName,_nativeObject.txtGuildName);
         FlashLabelArea.setNativeInstance(txtScore,_nativeObject.txtScore);
         if(_nativeObject.iconScore)
         {
            iconScore.setNativeInstance(_nativeObject.iconScore);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.iconOnline)
         {
            iconOnline.setNativeInstance(_nativeObject.iconOnline);
         }
         if(_nativeObject.iconGenderFemale)
         {
            iconGenderFemale.setNativeInstance(_nativeObject.iconGenderFemale);
         }
         if(_nativeObject.iconGenderMale)
         {
            iconGenderMale.setNativeInstance(_nativeObject.iconGenderMale);
         }
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
         if(_nativeObject.iconRewardStatPoint)
         {
            iconRewardStatPoint.setNativeInstance(_nativeObject.iconRewardStatPoint);
         }
         FlashLabelArea.setNativeInstance(txtStatPoints,_nativeObject.txtStatPoints);
         if(_nativeObject.tooltipStatPoints)
         {
            tooltipStatPoints.setNativeInstance(_nativeObject.tooltipStatPoints);
         }
      }
   }
}

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
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.guild_competition.SymbolIconGuildCompetitionScoreGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolLeaderboardGuildCompetitionLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardGuildCompetitionLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtRank:ILabel = null;
      
      public var txtGuildName:ILabelArea = null;
      
      public var txtScore:ILabelArea = null;
      
      public var iconScore:SymbolIconGuildCompetitionScoreGeneric = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public var iconRewardXP:SymbolIconXpGeneric = null;
      
      public var iconRewardPremium:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconRewardStatPoint:SymbolIconPlusGeneric = null;
      
      public function SymbolLeaderboardGuildCompetitionLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardGuildCompetitionLine;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardGuildCompetitionLine();
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
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
         iconRewardXP = new SymbolIconXpGeneric(_nativeObject.iconRewardXP);
         iconRewardPremium = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconRewardPremium);
         iconRewardStatPoint = new SymbolIconPlusGeneric(_nativeObject.iconRewardStatPoint);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardGuildCompetitionLine) : void
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
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
         if(_nativeObject.iconRewardXP)
         {
            iconRewardXP.setNativeInstance(_nativeObject.iconRewardXP);
         }
         if(_nativeObject.iconRewardPremium)
         {
            iconRewardPremium.setNativeInstance(_nativeObject.iconRewardPremium);
         }
         if(_nativeObject.iconRewardStatPoint)
         {
            iconRewardStatPoint.setNativeInstance(_nativeObject.iconRewardStatPoint);
         }
      }
   }
}

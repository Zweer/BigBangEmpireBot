package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.guild_competition.SymbolIconGuildCompetitionScoreGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleAttackGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleDefenseGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildLeaderVoteGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildRankLeaderGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildRankMemberGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildRankOfficerGeneric;
   import visuals.ui.elements.icons.SymbolIconOnlineGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolGuildMemberInfoLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildMemberInfoLine = null;
      
      public var backgroundHighlight:SymbolGuildMemberListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var iconRankLeader:SymbolIconGuildRankLeaderGeneric = null;
      
      public var iconRankOfficer:SymbolIconGuildRankOfficerGeneric = null;
      
      public var iconRankMember:SymbolIconGuildRankMemberGeneric = null;
      
      public var txtName:ILabel = null;
      
      public var iconOnline:SymbolIconOnlineGeneric = null;
      
      public var iconLeaderVote:SymbolIconGuildLeaderVoteGeneric = null;
      
      public var iconGuildBattleAttack:SymbolIconGuildBattleAttackGeneric = null;
      
      public var iconGuildBattleDefense:SymbolIconGuildBattleDefenseGeneric = null;
      
      public var iconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconGuildCompetition:SymbolIconGuildCompetitionScoreGeneric = null;
      
      public var txtDonated:ILabel = null;
      
      public function SymbolGuildMemberInfoLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildMemberInfoLine;
         }
         else
         {
            _nativeObject = new SymbolGuildMemberInfoLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGuildMemberListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         iconRankLeader = new SymbolIconGuildRankLeaderGeneric(_nativeObject.iconRankLeader);
         iconRankOfficer = new SymbolIconGuildRankOfficerGeneric(_nativeObject.iconRankOfficer);
         iconRankMember = new SymbolIconGuildRankMemberGeneric(_nativeObject.iconRankMember);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         iconOnline = new SymbolIconOnlineGeneric(_nativeObject.iconOnline);
         iconLeaderVote = new SymbolIconGuildLeaderVoteGeneric(_nativeObject.iconLeaderVote);
         iconGuildBattleAttack = new SymbolIconGuildBattleAttackGeneric(_nativeObject.iconGuildBattleAttack);
         iconGuildBattleDefense = new SymbolIconGuildBattleDefenseGeneric(_nativeObject.iconGuildBattleDefense);
         iconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrency);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconGuildCompetition = new SymbolIconGuildCompetitionScoreGeneric(_nativeObject.iconGuildCompetition);
         txtDonated = FlashLabel.fromNative(_nativeObject.txtDonated);
      }
      
      public function setNativeInstance(param1:SymbolGuildMemberInfoLine) : void
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
         if(_nativeObject.iconRankLeader)
         {
            iconRankLeader.setNativeInstance(_nativeObject.iconRankLeader);
         }
         if(_nativeObject.iconRankOfficer)
         {
            iconRankOfficer.setNativeInstance(_nativeObject.iconRankOfficer);
         }
         if(_nativeObject.iconRankMember)
         {
            iconRankMember.setNativeInstance(_nativeObject.iconRankMember);
         }
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.iconOnline)
         {
            iconOnline.setNativeInstance(_nativeObject.iconOnline);
         }
         if(_nativeObject.iconLeaderVote)
         {
            iconLeaderVote.setNativeInstance(_nativeObject.iconLeaderVote);
         }
         if(_nativeObject.iconGuildBattleAttack)
         {
            iconGuildBattleAttack.setNativeInstance(_nativeObject.iconGuildBattleAttack);
         }
         if(_nativeObject.iconGuildBattleDefense)
         {
            iconGuildBattleDefense.setNativeInstance(_nativeObject.iconGuildBattleDefense);
         }
         if(_nativeObject.iconGameCurrency)
         {
            iconGameCurrency.setNativeInstance(_nativeObject.iconGameCurrency);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconGuildCompetition)
         {
            iconGuildCompetition.setNativeInstance(_nativeObject.iconGuildCompetition);
         }
         FlashLabel.setNativeInstance(txtDonated,_nativeObject.txtDonated);
      }
   }
}

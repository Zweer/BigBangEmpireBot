package visuals.ui.panels
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
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonSmallTabGeneric;
   import visuals.ui.elements.buttons.SymbolButtonSmallTabWhiteGeneric;
   import visuals.ui.elements.buttons.SymbolButtonSmallWideTabGeneric;
   import visuals.ui.elements.guild.SymbolButtonGuildBattleHistoryGeneric;
   import visuals.ui.elements.guild.SymbolButtonGuildTeamPageGeneric;
   import visuals.ui.elements.guild.SymbolDialogNoGuildGeneric;
   import visuals.ui.elements.guild.SymbolGuildBattleInfoContentGeneric;
   import visuals.ui.elements.guild.SymbolGuildChatTabGeneric;
   import visuals.ui.elements.guild.SymbolGuildCustomizationGeneric;
   import visuals.ui.elements.guild.SymbolGuildDescriptionTabGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.guild.SymbolGuildInfoTabGeneric;
   import visuals.ui.elements.guild.SymbolGuildLeaderVoteInfoGeneric;
   import visuals.ui.elements.guild.SymbolGuildMemberInfoTabGeneric;
   import visuals.ui.elements.guild.SymbolGuildNoteTabGeneric;
   import visuals.ui.elements.guild.SymbolGuildOfficerNoteTabGeneric;
   import visuals.ui.elements.guild_booster.SymbolButtonGuildBoosterGeneric;
   import visuals.ui.elements.guild_competition.SymbolButtonGuildCompetitionGeneric;
   import visuals.ui.elements.icons.SymbolIconFlagGeneric;
   
   public class SymbolPanelGuildGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelGuild = null;
      
      public var background:SymbolDummyGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var leaderVoteInfo:SymbolGuildLeaderVoteInfoGeneric = null;
      
      public var battleInfo:SymbolGuildBattleInfoContentGeneric = null;
      
      public var txtName:ILabel = null;
      
      public var txtServerId:ILabelArea = null;
      
      public var iconServerLocale:SymbolIconFlagGeneric = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public var btnGuildCompetition:SymbolButtonGuildCompetitionGeneric = null;
      
      public var btnGuildBooster:SymbolButtonGuildBoosterGeneric = null;
      
      public var btnBattleHistory:SymbolButtonGuildBattleHistoryGeneric = null;
      
      public var memberInfoTab:SymbolGuildMemberInfoTabGeneric = null;
      
      public var btnTabInfo:SymbolButtonSmallTabWhiteGeneric = null;
      
      public var btnTabMembers:SymbolButtonSmallTabWhiteGeneric = null;
      
      public var btnVisitGuildPage:SymbolButtonGuildTeamPageGeneric = null;
      
      public var btnTabDescription:SymbolButtonSmallTabGeneric = null;
      
      public var btnTabChat:SymbolButtonSmallTabGeneric = null;
      
      public var btnTabNote:SymbolButtonSmallTabGeneric = null;
      
      public var btnTabOfficerNote:SymbolButtonSmallWideTabGeneric = null;
      
      public var chatTab:SymbolGuildChatTabGeneric = null;
      
      public var guildInfoTab:SymbolGuildInfoTabGeneric = null;
      
      public var guildCustomization:SymbolGuildCustomizationGeneric = null;
      
      public var descriptionTab:SymbolGuildDescriptionTabGeneric = null;
      
      public var noteTab:SymbolGuildNoteTabGeneric = null;
      
      public var officerNoteTab:SymbolGuildOfficerNoteTabGeneric = null;
      
      public var dialogNoGuild:SymbolDialogNoGuildGeneric = null;
      
      public function SymbolPanelGuildGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelGuild;
         }
         else
         {
            _nativeObject = new SymbolPanelGuild();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolDummyGeneric(_nativeObject.background);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         leaderVoteInfo = new SymbolGuildLeaderVoteInfoGeneric(_nativeObject.leaderVoteInfo);
         battleInfo = new SymbolGuildBattleInfoContentGeneric(_nativeObject.battleInfo);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         txtServerId = FlashLabelArea.fromNative(_nativeObject.txtServerId);
         iconServerLocale = new SymbolIconFlagGeneric(_nativeObject.iconServerLocale);
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
         btnGuildCompetition = new SymbolButtonGuildCompetitionGeneric(_nativeObject.btnGuildCompetition);
         btnGuildBooster = new SymbolButtonGuildBoosterGeneric(_nativeObject.btnGuildBooster);
         btnBattleHistory = new SymbolButtonGuildBattleHistoryGeneric(_nativeObject.btnBattleHistory);
         memberInfoTab = new SymbolGuildMemberInfoTabGeneric(_nativeObject.memberInfoTab);
         btnTabInfo = new SymbolButtonSmallTabWhiteGeneric(_nativeObject.btnTabInfo);
         btnTabMembers = new SymbolButtonSmallTabWhiteGeneric(_nativeObject.btnTabMembers);
         btnVisitGuildPage = new SymbolButtonGuildTeamPageGeneric(_nativeObject.btnVisitGuildPage);
         btnTabDescription = new SymbolButtonSmallTabGeneric(_nativeObject.btnTabDescription);
         btnTabChat = new SymbolButtonSmallTabGeneric(_nativeObject.btnTabChat);
         btnTabNote = new SymbolButtonSmallTabGeneric(_nativeObject.btnTabNote);
         btnTabOfficerNote = new SymbolButtonSmallWideTabGeneric(_nativeObject.btnTabOfficerNote);
         chatTab = new SymbolGuildChatTabGeneric(_nativeObject.chatTab);
         guildInfoTab = new SymbolGuildInfoTabGeneric(_nativeObject.guildInfoTab);
         guildCustomization = new SymbolGuildCustomizationGeneric(_nativeObject.guildCustomization);
         descriptionTab = new SymbolGuildDescriptionTabGeneric(_nativeObject.descriptionTab);
         noteTab = new SymbolGuildNoteTabGeneric(_nativeObject.noteTab);
         officerNoteTab = new SymbolGuildOfficerNoteTabGeneric(_nativeObject.officerNoteTab);
         dialogNoGuild = new SymbolDialogNoGuildGeneric(_nativeObject.dialogNoGuild);
      }
      
      public function setNativeInstance(param1:SymbolPanelGuild) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.leaderVoteInfo)
         {
            leaderVoteInfo.setNativeInstance(_nativeObject.leaderVoteInfo);
         }
         if(_nativeObject.battleInfo)
         {
            battleInfo.setNativeInstance(_nativeObject.battleInfo);
         }
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtServerId,_nativeObject.txtServerId);
         if(_nativeObject.iconServerLocale)
         {
            iconServerLocale.setNativeInstance(_nativeObject.iconServerLocale);
         }
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
         if(_nativeObject.btnGuildCompetition)
         {
            btnGuildCompetition.setNativeInstance(_nativeObject.btnGuildCompetition);
         }
         if(_nativeObject.btnGuildBooster)
         {
            btnGuildBooster.setNativeInstance(_nativeObject.btnGuildBooster);
         }
         if(_nativeObject.btnBattleHistory)
         {
            btnBattleHistory.setNativeInstance(_nativeObject.btnBattleHistory);
         }
         if(_nativeObject.memberInfoTab)
         {
            memberInfoTab.setNativeInstance(_nativeObject.memberInfoTab);
         }
         if(_nativeObject.btnTabInfo)
         {
            btnTabInfo.setNativeInstance(_nativeObject.btnTabInfo);
         }
         if(_nativeObject.btnTabMembers)
         {
            btnTabMembers.setNativeInstance(_nativeObject.btnTabMembers);
         }
         if(_nativeObject.btnVisitGuildPage)
         {
            btnVisitGuildPage.setNativeInstance(_nativeObject.btnVisitGuildPage);
         }
         if(_nativeObject.btnTabDescription)
         {
            btnTabDescription.setNativeInstance(_nativeObject.btnTabDescription);
         }
         if(_nativeObject.btnTabChat)
         {
            btnTabChat.setNativeInstance(_nativeObject.btnTabChat);
         }
         if(_nativeObject.btnTabNote)
         {
            btnTabNote.setNativeInstance(_nativeObject.btnTabNote);
         }
         if(_nativeObject.btnTabOfficerNote)
         {
            btnTabOfficerNote.setNativeInstance(_nativeObject.btnTabOfficerNote);
         }
         if(_nativeObject.chatTab)
         {
            chatTab.setNativeInstance(_nativeObject.chatTab);
         }
         if(_nativeObject.guildInfoTab)
         {
            guildInfoTab.setNativeInstance(_nativeObject.guildInfoTab);
         }
         if(_nativeObject.guildCustomization)
         {
            guildCustomization.setNativeInstance(_nativeObject.guildCustomization);
         }
         if(_nativeObject.descriptionTab)
         {
            descriptionTab.setNativeInstance(_nativeObject.descriptionTab);
         }
         if(_nativeObject.noteTab)
         {
            noteTab.setNativeInstance(_nativeObject.noteTab);
         }
         if(_nativeObject.officerNoteTab)
         {
            officerNoteTab.setNativeInstance(_nativeObject.officerNoteTab);
         }
         if(_nativeObject.dialogNoGuild)
         {
            dialogNoGuild.setNativeInstance(_nativeObject.dialogNoGuild);
         }
      }
   }
}

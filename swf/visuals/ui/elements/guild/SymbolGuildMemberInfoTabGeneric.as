package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolGuildMemberInfoTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildMemberInfoTab = null;
      
      public var symbolSlice9BackgroundTooltip:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var line1:SymbolGuildMemberInfoLineGeneric = null;
      
      public var line2:SymbolGuildMemberInfoLineGeneric = null;
      
      public var line3:SymbolGuildMemberInfoLineGeneric = null;
      
      public var line4:SymbolGuildMemberInfoLineGeneric = null;
      
      public var line5:SymbolGuildMemberInfoLineGeneric = null;
      
      public var line6:SymbolGuildMemberInfoLineGeneric = null;
      
      public var line7:SymbolGuildMemberInfoLineGeneric = null;
      
      public var line8:SymbolGuildMemberInfoLineGeneric = null;
      
      public var line9:SymbolGuildMemberInfoLineGeneric = null;
      
      public var line10:SymbolGuildMemberInfoLineGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnSortRank:SymbolGuildMemberListSortButtonRankGeneric = null;
      
      public var btnSortPremiumCurrencySpent:SymbolGuildMemberListSortButtonPremiumCurrencyGeneric = null;
      
      public var btnSortGameCurrencySpent:SymbolGuildMemberListSortButtonGameCurrencyGeneric = null;
      
      public var btnSortGuildCompetition:SymbolGuildMemberListSortButtonGuildCompetitionGeneric = null;
      
      public var btnProfile:SymbolButtonGuildProfileGeneric = null;
      
      public var btnMessage:SymbolButtonGuildMessageGeneric = null;
      
      public var btnTeamMessage:SymbolButtonGuildTeamMessageGeneric = null;
      
      public var btnOptions:SymbolButtonGuildMemberOptionsGeneric = null;
      
      public function SymbolGuildMemberInfoTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildMemberInfoTab;
         }
         else
         {
            _nativeObject = new SymbolGuildMemberInfoTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolSlice9BackgroundTooltip = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.symbolSlice9BackgroundTooltip);
         line1 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line1);
         line2 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line2);
         line3 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line3);
         line4 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line4);
         line5 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line5);
         line6 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line6);
         line7 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line7);
         line8 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line8);
         line9 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line9);
         line10 = new SymbolGuildMemberInfoLineGeneric(_nativeObject.line10);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnSortRank = new SymbolGuildMemberListSortButtonRankGeneric(_nativeObject.btnSortRank);
         btnSortPremiumCurrencySpent = new SymbolGuildMemberListSortButtonPremiumCurrencyGeneric(_nativeObject.btnSortPremiumCurrencySpent);
         btnSortGameCurrencySpent = new SymbolGuildMemberListSortButtonGameCurrencyGeneric(_nativeObject.btnSortGameCurrencySpent);
         btnSortGuildCompetition = new SymbolGuildMemberListSortButtonGuildCompetitionGeneric(_nativeObject.btnSortGuildCompetition);
         btnProfile = new SymbolButtonGuildProfileGeneric(_nativeObject.btnProfile);
         btnMessage = new SymbolButtonGuildMessageGeneric(_nativeObject.btnMessage);
         btnTeamMessage = new SymbolButtonGuildTeamMessageGeneric(_nativeObject.btnTeamMessage);
         btnOptions = new SymbolButtonGuildMemberOptionsGeneric(_nativeObject.btnOptions);
      }
      
      public function setNativeInstance(param1:SymbolGuildMemberInfoTab) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolSlice9BackgroundTooltip)
         {
            symbolSlice9BackgroundTooltip.setNativeInstance(_nativeObject.symbolSlice9BackgroundTooltip);
         }
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
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnSortRank)
         {
            btnSortRank.setNativeInstance(_nativeObject.btnSortRank);
         }
         if(_nativeObject.btnSortPremiumCurrencySpent)
         {
            btnSortPremiumCurrencySpent.setNativeInstance(_nativeObject.btnSortPremiumCurrencySpent);
         }
         if(_nativeObject.btnSortGameCurrencySpent)
         {
            btnSortGameCurrencySpent.setNativeInstance(_nativeObject.btnSortGameCurrencySpent);
         }
         if(_nativeObject.btnSortGuildCompetition)
         {
            btnSortGuildCompetition.setNativeInstance(_nativeObject.btnSortGuildCompetition);
         }
         if(_nativeObject.btnProfile)
         {
            btnProfile.setNativeInstance(_nativeObject.btnProfile);
         }
         if(_nativeObject.btnMessage)
         {
            btnMessage.setNativeInstance(_nativeObject.btnMessage);
         }
         if(_nativeObject.btnTeamMessage)
         {
            btnTeamMessage.setNativeInstance(_nativeObject.btnTeamMessage);
         }
         if(_nativeObject.btnOptions)
         {
            btnOptions.setNativeInstance(_nativeObject.btnOptions);
         }
      }
   }
}

package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusGeneric;
   import visuals.ui.elements.buttons.SymbolButtonUseResourceGeneric;
   import visuals.ui.elements.citymap.SymbolCitymapContentGeneric;
   import visuals.ui.elements.dungeon.SymbolButtonDungeonKeyGeneric;
   import visuals.ui.elements.icons.SymbolBoosterSenseGeneric;
   import visuals.ui.elements.quest.SymbolBasePanelBgEnergyGeneric;
   import visuals.ui.elements.quest.SymbolButtonDungeonKeyQuestGeneric;
   import visuals.ui.elements.quest.SymbolButtonMostCoinQuestGeneric;
   import visuals.ui.elements.quest.SymbolButtonMostXPQuestGeneric;
   import visuals.ui.elements.quest.SymbolButtonRefreshQuestsGeneric;
   import visuals.ui.elements.quest.SymbolButtonStoryDungeonKeyQuestGeneric;
   
   public class SymbolPanelCitymapGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelCitymap = null;
      
      public var citymapContent:SymbolCitymapContentGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var iconEnergy:SymbolBasePanelBgEnergyGeneric = null;
      
      public var txtEnergyLeft:ILabel = null;
      
      public var btnBuyEnergy:SymbolButtonPlusGeneric = null;
      
      public var btnMostXPQuest:SymbolButtonMostXPQuestGeneric = null;
      
      public var btnMostCoinQuest:SymbolButtonMostCoinQuestGeneric = null;
      
      public var btnDungeonKeyQuest:SymbolButtonDungeonKeyQuestGeneric = null;
      
      public var btnRepeatStoryDungeonKeyQuest:SymbolButtonStoryDungeonKeyQuestGeneric = null;
      
      public var btnRepeatDatingKeyQuest:SymbolButtonStoryDungeonKeyQuestGeneric = null;
      
      public var btnSenseBoosterIcon:SymbolBoosterSenseGeneric = null;
      
      public var btnRefreshQuests:SymbolButtonRefreshQuestsGeneric = null;
      
      public var btnUseResource:SymbolButtonUseResourceGeneric = null;
      
      public var btnDungeonTicket:SymbolButtonDungeonKeyGeneric = null;
      
      public function SymbolPanelCitymapGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelCitymap;
         }
         else
         {
            _nativeObject = new SymbolPanelCitymap();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         citymapContent = new SymbolCitymapContentGeneric(_nativeObject.citymapContent);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         iconEnergy = new SymbolBasePanelBgEnergyGeneric(_nativeObject.iconEnergy);
         txtEnergyLeft = FlashLabel.fromNative(_nativeObject.txtEnergyLeft);
         btnBuyEnergy = new SymbolButtonPlusGeneric(_nativeObject.btnBuyEnergy);
         btnMostXPQuest = new SymbolButtonMostXPQuestGeneric(_nativeObject.btnMostXPQuest);
         btnMostCoinQuest = new SymbolButtonMostCoinQuestGeneric(_nativeObject.btnMostCoinQuest);
         btnDungeonKeyQuest = new SymbolButtonDungeonKeyQuestGeneric(_nativeObject.btnDungeonKeyQuest);
         btnRepeatStoryDungeonKeyQuest = new SymbolButtonStoryDungeonKeyQuestGeneric(_nativeObject.btnRepeatStoryDungeonKeyQuest);
         btnRepeatDatingKeyQuest = new SymbolButtonStoryDungeonKeyQuestGeneric(_nativeObject.btnRepeatDatingKeyQuest);
         btnSenseBoosterIcon = new SymbolBoosterSenseGeneric(_nativeObject.btnSenseBoosterIcon);
         btnRefreshQuests = new SymbolButtonRefreshQuestsGeneric(_nativeObject.btnRefreshQuests);
         btnUseResource = new SymbolButtonUseResourceGeneric(_nativeObject.btnUseResource);
         btnDungeonTicket = new SymbolButtonDungeonKeyGeneric(_nativeObject.btnDungeonTicket);
      }
      
      public function setNativeInstance(param1:SymbolPanelCitymap) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.citymapContent)
         {
            citymapContent.setNativeInstance(_nativeObject.citymapContent);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.iconEnergy)
         {
            iconEnergy.setNativeInstance(_nativeObject.iconEnergy);
         }
         FlashLabel.setNativeInstance(txtEnergyLeft,_nativeObject.txtEnergyLeft);
         if(_nativeObject.btnBuyEnergy)
         {
            btnBuyEnergy.setNativeInstance(_nativeObject.btnBuyEnergy);
         }
         if(_nativeObject.btnMostXPQuest)
         {
            btnMostXPQuest.setNativeInstance(_nativeObject.btnMostXPQuest);
         }
         if(_nativeObject.btnMostCoinQuest)
         {
            btnMostCoinQuest.setNativeInstance(_nativeObject.btnMostCoinQuest);
         }
         if(_nativeObject.btnDungeonKeyQuest)
         {
            btnDungeonKeyQuest.setNativeInstance(_nativeObject.btnDungeonKeyQuest);
         }
         if(_nativeObject.btnRepeatStoryDungeonKeyQuest)
         {
            btnRepeatStoryDungeonKeyQuest.setNativeInstance(_nativeObject.btnRepeatStoryDungeonKeyQuest);
         }
         if(_nativeObject.btnRepeatDatingKeyQuest)
         {
            btnRepeatDatingKeyQuest.setNativeInstance(_nativeObject.btnRepeatDatingKeyQuest);
         }
         if(_nativeObject.btnSenseBoosterIcon)
         {
            btnSenseBoosterIcon.setNativeInstance(_nativeObject.btnSenseBoosterIcon);
         }
         if(_nativeObject.btnRefreshQuests)
         {
            btnRefreshQuests.setNativeInstance(_nativeObject.btnRefreshQuests);
         }
         if(_nativeObject.btnUseResource)
         {
            btnUseResource.setNativeInstance(_nativeObject.btnUseResource);
         }
         if(_nativeObject.btnDungeonTicket)
         {
            btnDungeonTicket.setNativeInstance(_nativeObject.btnDungeonTicket);
         }
      }
   }
}

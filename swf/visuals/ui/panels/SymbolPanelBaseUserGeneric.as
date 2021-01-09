package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.application.SymbolMainNavigationBarGeneric;
   import visuals.ui.elements.buttons.SymbolButtonOptionsGeneric;
   import visuals.ui.elements.generic.SymbolCoinsPanelGeneric;
   import visuals.ui.elements.generic.SymbolOptionsPopupGeneric;
   import visuals.ui.elements.generic.SymbolPlayerPanelGeneric;
   import visuals.ui.elements.generic.SymbolPremiumCurrencyPanelGeneric;
   import visuals.ui.elements.goal.SymbolButtonGoalGeneric;
   import visuals.ui.elements.goal.SymbolStoryGoalsContainerGeneric;
   import visuals.ui.elements.goal.SymbolStoryGoalsIconContainerGeneric;
   import visuals.ui.elements.mail.SymbolButtonMailboxGeneric;
   
   public class SymbolPanelBaseUserGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelBaseUser = null;
      
      public var mainNavigationBar:SymbolMainNavigationBarGeneric = null;
      
      public var optionsPopup:SymbolOptionsPopupGeneric = null;
      
      public var btnOptions:SymbolButtonOptionsGeneric = null;
      
      public var premiumCurrencyPanel:SymbolPremiumCurrencyPanelGeneric = null;
      
      public var coinsPanel:SymbolCoinsPanelGeneric = null;
      
      public var storyGoalsContainer:SymbolStoryGoalsContainerGeneric = null;
      
      public var playerPanel:SymbolPlayerPanelGeneric = null;
      
      public var storyGoalsIconContainer:SymbolStoryGoalsIconContainerGeneric = null;
      
      public var btnGoals:SymbolButtonGoalGeneric = null;
      
      public var btnMailbox:SymbolButtonMailboxGeneric = null;
      
      public function SymbolPanelBaseUserGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelBaseUser;
         }
         else
         {
            _nativeObject = new SymbolPanelBaseUser();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         mainNavigationBar = new SymbolMainNavigationBarGeneric(_nativeObject.mainNavigationBar);
         optionsPopup = new SymbolOptionsPopupGeneric(_nativeObject.optionsPopup);
         btnOptions = new SymbolButtonOptionsGeneric(_nativeObject.btnOptions);
         premiumCurrencyPanel = new SymbolPremiumCurrencyPanelGeneric(_nativeObject.premiumCurrencyPanel);
         coinsPanel = new SymbolCoinsPanelGeneric(_nativeObject.coinsPanel);
         storyGoalsContainer = new SymbolStoryGoalsContainerGeneric(_nativeObject.storyGoalsContainer);
         playerPanel = new SymbolPlayerPanelGeneric(_nativeObject.playerPanel);
         storyGoalsIconContainer = new SymbolStoryGoalsIconContainerGeneric(_nativeObject.storyGoalsIconContainer);
         btnGoals = new SymbolButtonGoalGeneric(_nativeObject.btnGoals);
         btnMailbox = new SymbolButtonMailboxGeneric(_nativeObject.btnMailbox);
      }
      
      public function setNativeInstance(param1:SymbolPanelBaseUser) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.mainNavigationBar)
         {
            mainNavigationBar.setNativeInstance(_nativeObject.mainNavigationBar);
         }
         if(_nativeObject.optionsPopup)
         {
            optionsPopup.setNativeInstance(_nativeObject.optionsPopup);
         }
         if(_nativeObject.btnOptions)
         {
            btnOptions.setNativeInstance(_nativeObject.btnOptions);
         }
         if(_nativeObject.premiumCurrencyPanel)
         {
            premiumCurrencyPanel.setNativeInstance(_nativeObject.premiumCurrencyPanel);
         }
         if(_nativeObject.coinsPanel)
         {
            coinsPanel.setNativeInstance(_nativeObject.coinsPanel);
         }
         if(_nativeObject.storyGoalsContainer)
         {
            storyGoalsContainer.setNativeInstance(_nativeObject.storyGoalsContainer);
         }
         if(_nativeObject.playerPanel)
         {
            playerPanel.setNativeInstance(_nativeObject.playerPanel);
         }
         if(_nativeObject.storyGoalsIconContainer)
         {
            storyGoalsIconContainer.setNativeInstance(_nativeObject.storyGoalsIconContainer);
         }
         if(_nativeObject.btnGoals)
         {
            btnGoals.setNativeInstance(_nativeObject.btnGoals);
         }
         if(_nativeObject.btnMailbox)
         {
            btnMailbox.setNativeInstance(_nativeObject.btnMailbox);
         }
      }
   }
}

package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonToggleUiGeneric;
   
   public class UiToggleUiButton extends UiButton
   {
       
      
      private var _container:SymbolButtonToggleUiGeneric;
      
      private var _hiddenUiElements:Vector.<IDisplayObject>;
      
      private var _referenceObject = null;
      
      public function UiToggleUiButton(param1:SymbolButtonToggleUiGeneric)
      {
         _hiddenUiElements = new Vector.<IDisplayObject>();
         super(param1,LocText.current.text("screen/character_overview/button_hide_ui"),handleToggleUiClick);
         _container = param1;
         _container.iconHide.visible = _hiddenUiElements.length <= 0;
         _container.iconShow.visible = _hiddenUiElements.length > 0;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _referenceObject = null;
         _hiddenUiElements.length = 0;
         _hiddenUiElements = null;
      }
      
      public function refreshLocalization() : void
      {
         tooltip = LocText.current.text("screen/character_overview/button_hide_ui");
      }
      
      public function refresh(param1:*) : void
      {
         if(_referenceObject != param1)
         {
            showUi(false);
         }
         _referenceObject = param1;
         visible = User.current.character.hasTutorialFlag("tutorial_finished");
      }
      
      public function hideUi() : void
      {
         if(_hiddenUiElements.length <= 0)
         {
            toggleUi();
         }
      }
      
      public function showUi(param1:Boolean = true) : void
      {
         if(_hiddenUiElements.length > 0)
         {
            toggleUi(param1);
         }
      }
      
      private function handleToggleUiClick(param1:InteractionEvent) : void
      {
         toggleUi();
      }
      
      private function toggleUi(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(_hiddenUiElements.length > 0)
         {
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            ViewManager.instance.baseUserPanel.showUserBars(true,true,param1);
            ViewManager.instance.baseUserPanel.showTopIcons(true,param1);
            _loc3_ = 0;
            while(_loc3_ < _hiddenUiElements.length)
            {
               if(param1)
               {
                  _hiddenUiElements[_loc3_].killTweens();
                  _hiddenUiElements[_loc3_].tweenTo(0.5,{
                     "delay":0.2,
                     "autoAlpha":1
                  });
               }
               else
               {
                  _hiddenUiElements[_loc3_].alpha = 1;
                  _hiddenUiElements[_loc3_].visible = true;
               }
               _loc3_++;
            }
            _hiddenUiElements.length = 0;
         }
         else
         {
            ViewManager.instance.baseUserPanel.fadeOutMainNavigationButtons();
            ViewManager.instance.baseUserPanel.showUserBars(false,true,param1);
            ViewManager.instance.baseUserPanel.showTopIcons(false,param1);
            _loc2_ = ViewManager.instance.activePanelInstance.container;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.numChildren)
            {
               _loc4_ = _loc2_.getChildAt(_loc3_);
               if(_loc4_.visible && _loc4_.alpha == 1 && _loc4_.name != "btnToggleUi" && _loc4_.name != "background" && _loc4_.name != "avatar")
               {
                  _hiddenUiElements.push(_loc4_);
                  if(param1)
                  {
                     _loc4_.killTweens();
                     _loc4_.tweenTo(0.5,{
                        "delay":0.2,
                        "autoAlpha":0
                     });
                  }
                  else
                  {
                     _hiddenUiElements[_loc3_].alpha = 0;
                     _hiddenUiElements[_loc3_].visible = false;
                  }
               }
               _loc3_++;
            }
         }
         _container.iconHide.visible = _hiddenUiElements.length <= 0;
         _container.iconShow.visible = _hiddenUiElements.length > 0;
      }
   }
}

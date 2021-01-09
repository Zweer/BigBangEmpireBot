package com.playata.application
{
   import com.playata.application.ui.elements.account_settings.UiOptionsBase;
   import com.playata.framework.application.ApplicationConfig;
   import com.playata.framework.core.Core;
   import com.playata.framework.localization.LocText;
   import flash.display.InteractiveObject;
   import flash.events.ContextMenuEvent;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   
   public class AppContextMenu
   {
       
      
      protected var _menu:ContextMenu = null;
      
      public function AppContextMenu(param1:InteractiveObject)
      {
         super();
         _menu = new ContextMenu();
         _menu.hideBuiltInItems();
         addMenuItem(LocText.current.text("general/common_title_bar") + ": " + ApplicationConfig.clientVersion,null);
         addMenuItem(LocText.current.text("general/base_panel/support_caption"),UiOptionsBase.openSupport,true);
         if(AppEnvironment.appPlatform.isForumLinkAllowed)
         {
            addMenuItem(LocText.current.text("Forum"),UiOptionsBase.openForum);
            if(Core.config.hasCfg("url_facebook") && AppConfig.urlFacebook)
            {
               addMenuItem(LocText.current.text("general/base_panel/facebook_page_caption"),onOpenFacebookPage);
            }
         }
         param1.contextMenu = _menu;
      }
      
      private function addMenuItem(param1:String, param2:Function, param3:Boolean = false) : void
      {
         label = param1;
         onClick = param2;
         separatorBefore = param3;
         var clickable:Boolean = onClick != null;
         var newMenuItem:ContextMenuItem = new ContextMenuItem(label,separatorBefore,clickable);
         if(clickable)
         {
            newMenuItem.addEventListener("menuItemSelect",function(param1:ContextMenuEvent):void
            {
            });
         }
         _menu.customItems.push(newMenuItem);
      }
      
      private function onOpenFacebookPage() : void
      {
         AppEnvironment.appPlatform.openLink(AppConfig.urlFacebook);
      }
   }
}

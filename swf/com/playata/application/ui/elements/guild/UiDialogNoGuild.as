package com.playata.application.ui.elements.guild
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogGuildCreate;
   import com.playata.application.ui.dialogs.DialogGuildSearch;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.panels.PanelGuild;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolDialogNoGuildGeneric;
   
   public class UiDialogNoGuild
   {
       
      
      private var _content:SymbolDialogNoGuildGeneric = null;
      
      private var _btnCreateGuild:UiTextButton = null;
      
      private var _btnFindGuild:UiTextButton = null;
      
      public function UiDialogNoGuild(param1:SymbolDialogNoGuildGeneric)
      {
         super();
         _content = param1;
         _btnCreateGuild = new UiTextButton(_content.btnCreateGuild,LocText.current.text("dialog/no_guild/button_create_guild"),"",onClickCreateGuild);
         _btnFindGuild = new UiTextButton(_content.btnFindGuild,LocText.current.text("dialog/no_guild/button_find_guild"),"",onClickFindGuild);
         _content.txtMessage.interactionEnabled = true;
         _content.lady.y = _content.lady.y + LayoutUtil.deviceAdjustedHeightCorrection / 2;
         refresh();
      }
      
      public function dispose() : void
      {
         _btnCreateGuild.dispose();
         _btnCreateGuild = null;
         _btnFindGuild.dispose();
         _btnFindGuild = null;
      }
      
      public function refreshLocalization() : void
      {
         _btnCreateGuild.caption = LocText.current.text("dialog/no_guild/button_create_guild");
         _btnFindGuild.caption = LocText.current.text("dialog/no_guild/button_find_guild");
      }
      
      public function refresh() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc3_:* = null;
         _content.txtTitle.text = LocText.current.text("dialog/no_guild/title");
         if(!AppEnvironment.appPlatform.isForumLinkAllowed)
         {
            _loc2_ = LocText.current.text("dialog/no_guild/text","");
            if(_loc2_.lastIndexOf("\n\n") != -1)
            {
               _loc2_ = _loc2_.substr(0,_loc2_.lastIndexOf("\n\n"));
            }
            _content.txtMessage.text = _loc2_;
         }
         else
         {
            _loc1_ = LocText.current.text("dialog/no_guild/text",AppConfig.urlForumTeams).replace("<a","<u><a").replace("/a>","/a></u>");
            _content.txtMessage.htmlText = _loc1_;
         }
         if(ViewManager.instance.activePanelInstance is PanelGuild)
         {
            _loc3_ = ViewManager.instance.activePanelInstance as PanelGuild;
            if(_loc3_.customGuild == null && !DialogGuildSearch.isOpen && DialogGuildSearch.autoOpen)
            {
               onClickFindGuild(null);
            }
         }
      }
      
      private function onClickCreateGuild(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildCreate());
      }
      
      private function onClickFindGuild(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildSearch());
      }
   }
}

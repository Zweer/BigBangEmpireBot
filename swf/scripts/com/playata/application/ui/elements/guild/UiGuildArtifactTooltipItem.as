package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.GuildArtifact;
   import visuals.ui.elements.guild.SymbolGuildArtifactTooltipItemGeneric;
   
   public class UiGuildArtifactTooltipItem
   {
       
      
      private var _content:SymbolGuildArtifactTooltipItemGeneric = null;
      
      private var _artifactId:int = 0;
      
      public function UiGuildArtifactTooltipItem(param1:SymbolGuildArtifactTooltipItemGeneric)
      {
         super();
         _content = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get content() : SymbolGuildArtifactTooltipItemGeneric
      {
         return _content;
      }
      
      public function get contentWidth() : int
      {
         if(_content.txtInfo.textWidth > _content.txtName.textWidth)
         {
            return int(_content.txtInfo.textWidth);
         }
         return int(_content.txtName.textWidth);
      }
      
      public function set artifactId(param1:int) : void
      {
         _artifactId = param1;
         refresh();
      }
      
      public function refresh() : void
      {
         var _loc1_:GuildArtifact = new GuildArtifact(_artifactId);
         _content.txtName.text = _loc1_.name;
         _content.txtInfo.text = _loc1_.bonusInfo;
         _content.artifactImage.setUriSprite(_loc1_.imageUrl,45,54,true,3,null,true);
      }
   }
}

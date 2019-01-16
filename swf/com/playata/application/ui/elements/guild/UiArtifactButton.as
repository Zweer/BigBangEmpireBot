package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildArtifact;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.display.InteractiveDisplayObjectState;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolButtonArtifactGeneric;
   
   public class UiArtifactButton extends UiButton
   {
       
      
      private var _allowClick:Boolean = true;
      
      private var _index:int;
      
      private var _guild:Guild;
      
      private var _realContent:SymbolButtonArtifactGeneric;
      
      public function UiArtifactButton(param1:SymbolButtonArtifactGeneric, param2:int, param3:Guild, param4:Function)
      {
         _index = param2;
         _realContent = param1;
         super(param1,"",param4);
         this.guild = param3;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function set guild(param1:Guild) : void
      {
         if(_guild != param1)
         {
            _guild = param1;
            refresh();
         }
      }
      
      public function get allowClick() : Boolean
      {
         return _allowClick;
      }
      
      public function refresh() : void
      {
         var _loc1_:* = null;
         if(_guild.artifactsOwnedCurrent >= _index)
         {
            _allowClick = _guild.isOwnGuild && User.current.character.guildRank <= 2;
            useHandCursor = _guild.isOwnGuild && User.current.character.guildRank <= 2;
            _realContent.artifact.visible = true;
            _realContent.artifactSlot.visible = false;
            _realContent.artifactSlotLock.visible = false;
            _realContent.iconCross.alpha = 0;
            _loc1_ = _guild.getArtifact(_index - 1);
            _realContent.artifact.setUriSprite(_loc1_.imageUrl,45,54,true,1,null,true);
            tooltip = _loc1_.tooltip;
         }
         else
         {
            _allowClick = false;
            useHandCursor = false;
            _realContent.artifact.visible = false;
            _realContent.iconCross.alpha = 0;
            _realContent.artifactSlot.visible = true;
            _realContent.artifactSlotLock.visible = _guild.unlockedArtifactSlots < _index;
            if(_realContent.artifactSlotLock.visible)
            {
               tooltip = LocText.current.text("dialog/guild_statistics/guild_artifact_locked",Math.round(Constants.current.getNumber("guild_artifact_slot" + _index + "_unlock_percentage") * 100));
            }
            else
            {
               tooltip = LocText.current.text("dialog/guild_statistics/guild_artifact_empty");
            }
         }
      }
      
      override protected function onStateChanged(param1:InteractiveDisplayObjectState) : void
      {
         if(_allowClick)
         {
            if(param1 == InteractiveDisplayObjectState.OVER)
            {
               _realContent.iconCross.tweenTo(0.1,{"alpha":1});
               _realContent.iconCross.visible = true;
            }
            else if(param1 == InteractiveDisplayObjectState.UP)
            {
               _realContent.iconCross.tweenTo(0.1,{"alpha":0});
               _realContent.iconCross.visible = true;
            }
         }
         super.onStateChanged(param1);
      }
      
      override protected function handleClick(param1:InteractionEvent) : void
      {
         super.handleClick(param1);
         if(!_allowClick && Environment.info.isTouchScreen)
         {
            TooltipLayer.instance.tooltip = _tooltip;
            TooltipLayer.instance.tooltipVisible = true;
         }
      }
   }
}

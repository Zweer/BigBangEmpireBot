package com.playata.application.ui.elements.guild
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.base.SymbolUiGuildChatLinkTooltipLineGeneric;
   
   public class UiGuildChatLinkTooltipLine extends SymbolUiGuildChatLinkTooltipLineGeneric
   {
       
      
      private var _btnGuild:UiButton;
      
      private var _btnCharacter:UiButton;
      
      private var _btnWhisper:UiButton;
      
      private var _btnURL:UiButton;
      
      private var _onLinkClick:Function;
      
      private var _url:String;
      
      public function UiGuildChatLinkTooltipLine(param1:Function)
      {
         super();
         _onLinkClick = param1;
         _btnGuild = new UiButton(btnGuild,"",handleClick);
         _btnCharacter = new UiButton(btnCharacter,"",handleClick);
         _btnWhisper = new UiButton(btnWhisper,"",handleClick);
         _btnURL = new UiButton(btnURL,"",handleClick);
      }
      
      override public function dispose() : void
      {
         _btnGuild.dispose();
         _btnCharacter.dispose();
         _btnWhisper.dispose();
         _btnURL.dispose();
         _onLinkClick = null;
         _btnGuild = null;
         _btnCharacter = null;
         _btnWhisper = null;
         _btnURL = null;
         super.dispose();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
      }
      
      public function refresh(param1:String, param2:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         _url = param2;
         btnWhisper.visible = false;
         btnGuild.visible = false;
         btnCharacter.visible = false;
         btnURL.visible = false;
         if(param2.indexOf("whisper;") === 0)
         {
            txtLink.text = param2.substr(8);
            btnWhisper.visible = true;
         }
         else if(param2.indexOf("guild;") === 0)
         {
            _loc3_ = param1.indexOf(param2) + param2.length + 2;
            _loc4_ = param1.indexOf("</a>",param1.indexOf(param2));
            txtLink.text = param1.substr(_loc3_,_loc4_ - _loc3_);
            btnGuild.visible = true;
         }
         else if(param2.indexOf("character;") === 0)
         {
            _loc5_ = param2.substr(10);
            if(isNaN(parseInt(_loc5_)))
            {
               txtLink.text = _loc5_;
            }
            else
            {
               _loc3_ = param1.indexOf(param2) + param2.length + 2;
               _loc4_ = param1.indexOf("</a>",param1.indexOf(param2));
               txtLink.text = param1.substr(_loc3_,_loc4_ - _loc3_);
            }
            btnCharacter.visible = true;
         }
         else if(param2.indexOf("http://") != -1 || param2.indexOf("https://") != -1 || param2.indexOf("www") != -1)
         {
            txtLink.text = param2;
            btnURL.visible = true;
         }
         if(txtLink.textHeight > 25)
         {
            txtLink.y = 0;
         }
         else
         {
            txtLink.y = 8;
         }
      }
   }
}

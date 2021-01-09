package com.playata.application.ui.elements.fan_foto
{
   import com.playata.application.data.fan_foto.FanFoto;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.fan_foto.SymbolFanFotoOfferGeneric;
   
   public class UiFanFotoOffer
   {
       
      
      private var _content:SymbolFanFotoOfferGeneric = null;
      
      private var _type:int = -1;
      
      private var _onClickFunction:Function;
      
      private var _fotoIdentifier:String;
      
      private var _btnUnlock:UiTextButton;
      
      public function UiFanFotoOffer(param1:SymbolFanFotoOfferGeneric, param2:int, param3:Function)
      {
         super();
         _content = param1;
         _type = param2;
         _onClickFunction = param3;
         _content.txtName.text = LocText.current.text("dialog/fan_foto_offer/offer_" + param2);
         _btnUnlock = new UiTextButton(param1.btnUnlockFoto,LocText.current.text("dialog/fan_foto_offer/button_unlock"),"",handleClick);
         _content.offer1.visible = param2 == 1;
         _content.offer2.visible = param2 == 2;
         _content.offer3.visible = param2 == 3;
      }
      
      public function dispose() : void
      {
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
      }
      
      public function refresh() : void
      {
         if(!_content)
         {
            return;
         }
         var _loc1_:FanFoto = User.current.character.fanFoto;
         _content.txtResource.text = LocText.current.formatHugeNumber(_loc1_.getResourceCost(_type));
         if(_type != 1 && !_loc1_.fotosAvailableForTags)
         {
            _btnUnlock.buttonEnabled = false;
            if(_loc1_.tags.length == 0)
            {
               _btnUnlock.tooltip = LocText.current.text("dialog/fan_foto_offer/tooltip_no_tag_selected");
            }
            else
            {
               _btnUnlock.tooltip = LocText.current.text("dialog/fan_foto_offer/tooltip_no_foto_available_for_tags");
            }
         }
         else if(_loc1_.fotosAvailable)
         {
            _btnUnlock.buttonEnabled = true;
            _btnUnlock.tooltip = "";
         }
         else
         {
            _btnUnlock.buttonEnabled = false;
            _btnUnlock.tooltip = LocText.current.text("dialog/fan_foto_offer/tooltip_no_foto_available");
         }
         if(!User.current.character.hasTutorialFlag("fan_foto_tag2"))
         {
            _btnUnlock.buttonEnabled = false;
         }
      }
   }
}

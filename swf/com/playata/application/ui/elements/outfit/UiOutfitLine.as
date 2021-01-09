package com.playata.application.ui.elements.outfit
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.outfit.Outfits;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.outfit.SymbolOutfitLineGeneric;
   
   public class UiOutfitLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolOutfitLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _outfit:Outfit = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onUnlockFuntion:Function = null;
      
      private var _btnUnlock:UiPremiumButton = null;
      
      public function UiOutfitLine(param1:SymbolOutfitLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onUnlockFuntion = param4;
         _content.backgroundHighlight.visible = false;
         _btnUnlock = new UiPremiumButton(_content.btnUnlock,CConstant.outfit_unlock_cost,"",LocText.current.text("dialog/outfits/unlock_outfit"),"","",onClickUnlock);
         _btnUnlock.premium = true;
         _content.txtName.autoFontSize = true;
         onClick.add(handleClick);
      }
      
      public function get outfit() : Outfit
      {
         return _outfit;
      }
      
      override public function dispose() : void
      {
         _outfit = null;
         _btnUnlock.dispose();
         _btnUnlock = null;
         super.dispose();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.txtName.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
      }
      
      public function refresh(param1:Outfit, param2:int) : void
      {
         _index = param2;
         _outfit = param1;
         if(!_outfit)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _btnUnlock.visible = false;
         highlight(false);
         _content.txtName.visible = true;
         _content.icon.visible = true;
         _content.iconCheckmark.visible = allItemsEquiped();
         _content.settingsIcon.visible = _outfit.outfitSettings.length > 0;
         _content.iconExclamationMark.visible = _outfit.hasMissingItem();
         _content.txtName.text = _outfit.name;
         if(_content.txtName.numLines > 1)
         {
            _content.txtName.y = 4;
         }
         else
         {
            _content.txtName.y = 13;
         }
         _content.icon.removeAllChildren();
         _content.iconNoItems.visible = false;
         var _loc3_:String = getIconURL();
         if(_loc3_)
         {
            _content.icon.setUriSprite(_loc3_,60,60,false,8);
         }
         else
         {
            _content.iconNoItems.visible = true;
         }
      }
      
      public function refreshUnlock(param1:int) : void
      {
         _index = param1;
         _outfit = null;
         _content.visible = true;
         highlight(false);
         _btnUnlock.visible = true;
         _content.iconCheckmark.visible = false;
         _content.settingsIcon.visible = false;
         _content.iconExclamationMark.visible = false;
         _content.iconNoItems.visible = false;
         _content.txtName.visible = false;
         _content.icon.visible = false;
      }
      
      private function allItemsEquiped() : Boolean
      {
         var _loc1_:Character = User.current.character;
         var _loc4_:int = 0;
         var _loc3_:* = Outfits.ITEM_TYPES;
         for each(var _loc2_ in Outfits.ITEM_TYPES)
         {
            if(!§§pop())
            {
               return false;
            }
         }
         return true;
      }
      
      private function getIconURL() : String
      {
         var _loc3_:int = 0;
         var _loc2_:* = Outfits.ITEM_TYPES;
         for each(var _loc1_ in Outfits.ITEM_TYPES)
         {
            if(_outfit.getItem(_loc1_) && !_outfit.isItemMissing(_loc1_))
            {
               return _outfit.getItem(_loc1_).iconImageUrl;
            }
         }
         return null;
      }
      
      private function onClickUnlock(param1:InteractionEvent) : void
      {
      }
   }
}

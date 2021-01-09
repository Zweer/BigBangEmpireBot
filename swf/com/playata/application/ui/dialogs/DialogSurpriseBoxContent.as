package com.playata.application.ui.dialogs
{
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogSurpriseBoxContentGeneric;
   
   public class DialogSurpriseBoxContent extends UiDialog
   {
       
      
      private var _data:TypedObject = null;
      
      private var _item1Reward:UiItemSlot = null;
      
      private var _item2Reward:UiItemSlot = null;
      
      private var _item3Reward:UiItemSlot = null;
      
      private var _btnClose:UiTextButton = null;
      
      public function DialogSurpriseBoxContent(param1:Object)
      {
         _data = new TypedObject(param1);
         var _loc2_:SymbolDialogSurpriseBoxContentGeneric = new SymbolDialogSurpriseBoxContentGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/surprise_box_content/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/surprise_box_content/info_text");
         _loc2_.item1Reward.visible = item1Id != 0;
         _loc2_.item2Reward.visible = item2Id != 0;
         _loc2_.item3Reward.visible = item3Id != 0;
         if(_loc2_.item1Reward.visible)
         {
            _item1Reward = new UiItemSlot(_loc2_.item1Reward,0);
            _item1Reward.item = User.current.character.getItemById(item1Id);
         }
         if(_loc2_.item2Reward.visible)
         {
            _item2Reward = new UiItemSlot(_loc2_.item2Reward,0);
            _item2Reward.item = User.current.character.getItemById(item2Id);
         }
         if(_loc2_.item3Reward.visible)
         {
            _item3Reward = new UiItemSlot(_loc2_.item3Reward,0);
            _item3Reward.item = User.current.character.getItemById(item3Id);
         }
         if(!_loc2_.item2Reward.visible)
         {
            _loc2_.item1Reward.x = _loc2_.item2Reward.x;
         }
         if(_loc2_.item2Reward.visible && !_loc2_.item3Reward.visible)
         {
            _loc2_.item1Reward.x = _loc2_.item1Reward.x + 40;
            _loc2_.item2Reward.x = _loc2_.item2Reward.x + 40;
         }
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function get items() : Array
      {
         return _data.getArray("items");
      }
      
      private function get item1Id() : int
      {
         if(items.length < 1)
         {
            return 0;
         }
         return items[0].id as int;
      }
      
      private function get item2Id() : int
      {
         if(items.length < 2)
         {
            return 0;
         }
         return items[1].id as int;
      }
      
      private function get item3Id() : int
      {
         if(items.length < 3)
         {
            return 0;
         }
         return items[2].id as int;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         showRewardEffect();
         close();
      }
      
      private function showRewardEffect() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         try
         {
            _loc2_ = _vo as SymbolDialogSurpriseBoxContentGeneric;
            _loc1_ = null;
            if(_item1Reward != null)
            {
               _loc1_ = User.current.character.getItemById(item1Id);
               EffectsLayer.instance.show(3,{
                  "emitter":_loc2_.item1Reward,
                  "imageUrl":_loc1_.iconImageUrl
               });
            }
            if(_item2Reward != null)
            {
               _loc1_ = User.current.character.getItemById(item2Id);
               EffectsLayer.instance.show(3,{
                  "emitter":_loc2_.item2Reward,
                  "imageUrl":_loc1_.iconImageUrl
               });
            }
            if(_item3Reward != null)
            {
               _loc1_ = User.current.character.getItemById(item3Id);
               EffectsLayer.instance.show(3,{
                  "emitter":_loc2_.item3Reward,
                  "imageUrl":_loc1_.iconImageUrl
               });
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}

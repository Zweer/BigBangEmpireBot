package com.playata.application.ui.elements.event
{
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.dataobject.DOItem;
   import com.playata.application.data.item.Item;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.effects.GlowFilterEffect;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiEmptyItemTooltip;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.event.SymbolEventQuestItemRewardGeneric;
   
   public class UiEventQuestItemReward
   {
       
      
      private var _content:SymbolEventQuestItemRewardGeneric = null;
      
      private var _tooltip:Tooltip = null;
      
      private var _glowFilterRare:GlowFilterEffect = null;
      
      private var _glowFilterEpic:GlowFilterEffect = null;
      
      public function UiEventQuestItemReward(param1:SymbolEventQuestItemRewardGeneric)
      {
         super();
         _content = param1;
         _tooltip = new UiTextTooltip(_content.itemPos,"");
         _glowFilterRare = UiItemGraphic.getItemGlowEffect(2,_content.itemPos.container);
         _glowFilterEpic = UiItemGraphic.getItemGlowEffect(3,_content.itemPos.container);
         _content.itemPos.container.removeAllChildren();
      }
      
      public function dispose() : void
      {
         _glowFilterRare.dispose();
         _glowFilterEpic.dispose();
         _tooltip.dispose();
         _tooltip = null;
      }
      
      public function set item(param1:String) : void
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:int = 1;
         if(param1 == "random_common" || param1 == "random_rare" || param1 == "random_epic")
         {
            _loc6_ = ServerInfo.assetURL("items/random_i","png");
            _content.itemPos.container.setUriSprite(_loc6_,60,60,true,3,null,true);
            if(param1 == "random_common")
            {
               _loc2_ = 1;
               (_tooltip as UiTextTooltip).text = LocText.current.text("dialog/event_quest/reward_item/random_common_tooltip");
            }
            else if(param1 == "random_rare")
            {
               _loc2_ = 2;
               (_tooltip as UiTextTooltip).text = LocText.current.text("dialog/event_quest/reward_item/random_rare_tooltip");
            }
            else if(param1 == "random_epic")
            {
               _loc2_ = 3;
               (_tooltip as UiTextTooltip).text = LocText.current.text("dialog/event_quest/reward_item/random_epic_tooltip");
            }
         }
         else
         {
            _loc3_ = new Item(new DOItem({"identifier":param1}));
            _content.itemPos.container.setUriSprite(_loc3_.iconImageUrl,60,60,true,2,null,true);
            _loc4_ = CItemTemplate.fromId(param1);
            _loc2_ = _loc4_.quality;
            _loc5_ = _loc4_.type;
            _loc3_.update(new TypedObject({
               "quality":_loc2_,
               "type":_loc5_
            }));
            _tooltip = new UiEmptyItemTooltip(new InteractiveDisplayObject(_content.itemPos),_loc3_,undefinedAttributesTooltip);
         }
         _content.itemPos.txtAmount.visible = false;
         switch(int(_loc2_) - 1)
         {
            case 0:
               _glowFilterRare.stop();
               _glowFilterEpic.stop();
               break;
            case 1:
               _glowFilterEpic.stop();
               _glowFilterRare.play();
               break;
            case 2:
               _glowFilterRare.stop();
               _glowFilterEpic.play();
         }
      }
      
      protected function get undefinedAttributesTooltip() : String
      {
         return LocText.current.text("dialog/event_quest/item_attributes_undefined");
      }
   }
}

package com.playata.application.ui.elements.slotmachine
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.resource.ResourceFeature;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.HighlightEffect;
   import com.playata.application.ui.elements.resource.UiUseResourceButton;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonUseResourceGeneric;
   
   public class UiUseSlotmachineResourceButton extends UiUseResourceButton
   {
       
      
      private var _highlight:HighlightEffect = null;
      
      public function UiUseSlotmachineResourceButton(param1:SymbolButtonUseResourceGeneric, param2:int, param3:Boolean, param4:String)
      {
         super(param1,param2,param3,param4);
         _realContent.counter.visible = false;
         _highlight = new HighlightEffect(_realContent.highlightSlotmachine,0.6,0.6,true);
      }
      
      override public function dispose() : void
      {
         _highlight.dispose();
         super.dispose();
      }
      
      override public function refresh() : void
      {
         var _loc2_:ResourceFeature = new ResourceFeature(2);
         var _loc5_:ResourceFeature = new ResourceFeature(3);
         var _loc1_:int = _loc2_.unusedResourceCount;
         var _loc3_:int = _loc5_.unusedResourceCount;
         var _loc4_:int = Math.floor(_loc1_ / CConstant.resource_free_slotmachine_spin_usage_amount) + Math.floor(_loc3_ / CConstant.resource_slotmachine_jeton_usage_amount);
         if(!buttonEnabled)
         {
            _loc4_ = 0;
            tooltip = LocText.current.text("dialog/use_resource/slotmachine/button_not_unlocked",CConstant.slotmachine_min_level);
         }
         else if(_loc4_ > 0 && User.current.character.slotmachineSpinCountLeftToday > 0 || User.current.character.currentSlotmachineSpin > 0)
         {
            _realContent.counter.caption.text = _loc4_.toString();
            tooltip = LocText.current.text("dialog/use_resource/slotmachine/button_resources_left_tooltip",_loc4_);
            _highlight.loop = true;
            _highlight.highlight();
         }
         else
         {
            _loc4_ = 0;
            tooltip = LocText.current.text("dialog/use_resource/slotmachine/button_no_resources_left_tooltip");
            _highlight.loop = false;
            _highlight.highlight(true);
         }
         _realContent.counter.visible = _loc4_ > 0;
         refreshIcon();
      }
   }
}

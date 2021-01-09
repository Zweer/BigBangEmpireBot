package com.playata.application.ui.elements.resource
{
   import com.playata.application.data.resource.ResourceFeature;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogUseResource;
   import com.playata.application.ui.dialogs.DialogUseResourceUpgradable;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.buttons.SymbolButtonUseResourceGeneric;
   
   public class UiUseResourceButton extends UiButton
   {
       
      
      protected var _realContent:SymbolButtonUseResourceGeneric = null;
      
      protected var _featureType:int = 0;
      
      protected var _resourceUsable:Boolean = true;
      
      protected var _featureFlag:String;
      
      public function UiUseResourceButton(param1:SymbolButtonUseResourceGeneric, param2:int, param3:Boolean, param4:String)
      {
         _realContent = param1;
         _featureType = param2;
         _resourceUsable = param3;
         _featureFlag = param4;
         super(param1,"",onClickUseResource);
         _realContent.highlightSlotmachine.visible = false;
         _realContent.highlightRemote.visible = false;
         _realContent.highlightRemoteUpgraded.visible = false;
      }
      
      public function set featureFlag(param1:String) : void
      {
         _featureFlag = param1;
      }
      
      protected function onClickUseResource(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         if(_featureType == 1)
         {
            _loc2_ = new ResourceFeature(_featureType);
            if(_loc2_.isUpgradeable)
            {
               Environment.panelManager.showDialog(new DialogUseResourceUpgradable(_featureType,_resourceUsable,_featureFlag));
            }
            else
            {
               Environment.panelManager.showDialog(new DialogUseResource(_featureType,_resourceUsable,_featureFlag));
            }
         }
         else if(_featureType == 2)
         {
            ViewManager.instance.showPanel("slotmachine");
         }
      }
      
      public function refresh() : void
      {
         var _loc1_:ResourceFeature = new ResourceFeature(_featureType);
         var _loc2_:int = _loc1_.unusedResourceCount;
         if(_loc2_ > 0)
         {
            _realContent.counter.caption.text = _loc2_.toString();
            tooltip = _loc1_.useButtonResourcesLeftTooltipText;
         }
         else
         {
            tooltip = _loc1_.useButtonNoResourcesLeftTooltipText;
         }
         _realContent.counter.visible = _loc2_ > 0;
         refreshIcon();
      }
      
      protected function refreshIcon() : void
      {
         var _loc1_:ResourceFeature = new ResourceFeature(_featureType);
         _realContent.icon.gotoAndStop(_loc1_.resourceFeatureIconIndex);
         _realContent.highlightRemote.visible = _loc1_.resourceFeatureIconIndex == 1;
         _realContent.highlightRemoteUpgraded.visible = _loc1_.resourceFeatureIconIndex == 2;
         _realContent.highlightSlotmachine.visible = _loc1_.resourceFeatureIconIndex == 3;
      }
      
      public function get hasUnusedResources() : Boolean
      {
         return _realContent.counter.visible;
      }
   }
}

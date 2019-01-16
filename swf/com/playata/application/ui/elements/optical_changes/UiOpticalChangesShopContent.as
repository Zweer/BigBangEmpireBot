package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.ui.dialogs.DialogOpticalChanges;
   import com.playata.framework.display.InteractiveDisplayObject;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangesShopContentGeneric;
   
   public class UiOpticalChangesShopContent extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolOpticalChangesShopContentGeneric = null;
      
      private var _opticalChangeDialog:DialogOpticalChanges = null;
      
      private var _offer1:UiOpticalChangeShopOffer;
      
      private var _offer2:UiOpticalChangeShopOffer;
      
      public function UiOpticalChangesShopContent(param1:SymbolOpticalChangesShopContentGeneric, param2:DialogOpticalChanges)
      {
         _content = param1;
         _opticalChangeDialog = param2;
         super(_content);
         _offer1 = new UiOpticalChangeShopOffer(param1.offer1,1,_opticalChangeDialog);
         _offer2 = new UiOpticalChangeShopOffer(param1.offer2,2,_opticalChangeDialog);
      }
      
      public function refresh() : void
      {
         _offer1.refresh();
      }
      
      public function show() : void
      {
         _content.visible = true;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      override public function dispose() : void
      {
         _content = null;
         _opticalChangeDialog = null;
         _offer1.dispose();
         _offer1 = null;
         _offer2.dispose();
         _offer2 = null;
         super.dispose();
      }
   }
}

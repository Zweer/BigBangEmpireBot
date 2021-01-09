package com.playata.application.ui.elements.item
{
   import com.playata.application.data.item.Item;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.item.SymbolEmptyItemTooltipGeneric;
   
   public class UiEmptyItemTooltip extends UiClosableTooltip
   {
      
      protected static var _tooltipContent:SymbolEmptyItemTooltipGeneric = null;
      
      private static var _currentItem:Item = null;
       
      
      protected var _item:Item = null;
      
      public function UiEmptyItemTooltip(param1:IInteractiveDisplayObject, param2:Item = null, param3:String = null)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolEmptyItemTooltipGeneric();
            _tooltipContent.txtItemName.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
         }
         if(param3)
         {
            _tooltipContent.txtStats.text = param3;
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
         _item = param2;
      }
      
      override public function onAssigned() : void
      {
         if(_currentItem == _item)
         {
            return;
         }
         _currentItem = _item;
         if(_item == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         _tooltipContent.txtStatsCaption.text = LocText.current.text("general/item_attributes_caption","");
         _tooltipContent.txtItemName.text = _item.name;
         _tooltipContent.txtItemCategory.text = _item.typeName;
         _tooltipContent.txtItemQualityCommon.text = _item.qualityName;
         _tooltipContent.txtItemQualityCommon.visible = _item.quality == 1;
         _tooltipContent.txtItemQualityRare.text = _item.qualityName;
         _tooltipContent.txtItemQualityRare.visible = _item.quality == 2;
         _tooltipContent.txtItemQualityEpic.text = _item.qualityName;
         _tooltipContent.txtItemQualityEpic.visible = _item.quality == 3;
         _tooltipContent.txtItemQualityCommon.visible = _item.quality == 1;
         _tooltipContent.txtItemQualityRare.visible = _item.quality == 2;
         _tooltipContent.txtItemQualityEpic.visible = _item.quality == 3;
         _tooltipContent.background.height = _tooltipContent.txtStats.y + _tooltipContent.txtStats.textHeight + 35;
         _tooltipContent.visible = true;
         placeCloseButton(_tooltipContent.background);
      }
      
      public function set item(param1:Item) : void
      {
         _item = param1;
      }
   }
}
